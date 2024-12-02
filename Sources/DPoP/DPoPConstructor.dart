// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'data_extensions.dart';

abstract class DPoPConstructorType {
  Future<String> jwt({
    required Uri endpoint,
    String? accessToken,
  });
}

class DPoPConstructor implements DPoPConstructorType {
  enum Methods {
    get,
    head,
    post,
    put,
    delete,
    connect,
    options,
    trace
  }

  final String algorithm;
  final Map<String, dynamic> jwk;
  final SigningKeyProxy privateKey;

  DPoPConstructor({
    required this.algorithm,
    required this.jwk,
    required this.privateKey,
  });

  @override
  Future<String> jwt({
    required Uri endpoint,
    String? accessToken,
  }) async {
    final header = {
      'typ': 'dpop+jwt',
      'alg': algorithm,
      'jwk': jwk,
    };

    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final claims = {
      'iat': now,
      'htm': Methods.post.name.toUpperCase(),
      'htu': endpoint.toString(),
      'jti': _generateRandomString(20),
    };

    if (accessToken != null) {
      final bytes = utf8.encode(accessToken);
      final digest = sha256.convert(bytes);
      claims['ath'] = base64Url.encode(digest.bytes);
    }

    try {
      final signer = await _createSigner(
        header: header,
        payload: claims,
        privateKey: privateKey,
        algorithm: algorithm,
      );

      return await signer.sign();
    } catch (e) {
      throw CredentialIssuanceError('Cryptographic algorithm not supported');
    }
  }

  String _generateRandomString(int length) {
    final random = Uint8List.fromList(
      List<int>.generate(length, (i) => Random.secure().nextInt(256))
    );
    return base64Url.encode(random).substring(0, length);
  }
}

// These would need to be implemented based on your JWT library choice
abstract class SigningKeyProxy {}
class CredentialIssuanceError implements Exception {
  final String message;
  CredentialIssuanceError(this.message);
}