
import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
import 'credential_issuer_id.dart';
import 'credential_issuer_endpoint.dart';
import '../Types/display.dart';
import '../Encryption/credential_response_encryption.dart';

class CredentialIssuerMetadata {
  final CredentialIssuerId credentialIssuerIdentifier;
  final List<Uri>? authorizationServers;
  final CredentialIssuerEndpoint credentialEndpoint;
  final CredentialIssuerEndpoint? batchCredentialEndpoint;
  final CredentialIssuerEndpoint? deferredCredentialEndpoint;
  final CredentialIssuerEndpoint? notificationEndpoint;
  final CredentialResponseEncryption credentialResponseEncryption;
  final Map<String, dynamic> credentialsSupported;
  final bool? credentialIdentifiersSupported;
  final String? signedMetadata;
  final List<Display> display;

  CredentialIssuerMetadata({
    required this.credentialIssuerIdentifier,
    this.authorizationServers,
    required this.credentialEndpoint,
    this.batchCredentialEndpoint,
    this.deferredCredentialEndpoint,
    this.notificationEndpoint,
    this.credentialResponseEncryption = const CredentialResponseEncryption.notRequired(),
    required this.credentialsSupported,
    this.credentialIdentifiersSupported,
    this.signedMetadata,
    List<Display>? display,
  }) : this.display = display ?? [];

  factory CredentialIssuerMetadata.fromJson(Map<String, dynamic> json) {
    return CredentialIssuerMetadata(
      credentialIssuerIdentifier: CredentialIssuerId.fromJson(json['credential_issuer'] as Map<String, dynamic>),
      authorizationServers: (json['authorization_servers'] as List<dynamic>?)
          ?.map((e) => Uri.parse(e as String))
          .toList(),
      credentialEndpoint: CredentialIssuerEndpoint.fromJson(json['credential_endpoint'] as Map<String, dynamic>),
      batchCredentialEndpoint: json['batch_credential_endpoint'] != null
          ? CredentialIssuerEndpoint.fromJson(json['batch_credential_endpoint'] as Map<String, dynamic>)
          : null,
      deferredCredentialEndpoint: json['deferred_credential_endpoint'] != null
          ? CredentialIssuerEndpoint.fromJson(json['deferred_credential_endpoint'] as Map<String, dynamic>)
          : null,
      notificationEndpoint: json['notification_endpoint'] != null
          ? CredentialIssuerEndpoint.fromJson(json['notification_endpoint'] as Map<String, dynamic>)
          : null,
      credentialResponseEncryption: json['credential_response_encryption'] != null
          ? CredentialResponseEncryption.fromJson(json['credential_response_encryption'] as Map<String, dynamic>)
          : const CredentialResponseEncryption.notRequired(),
      credentialsSupported: json['credential_configurations_supported'] as Map<String, dynamic>,
      signedMetadata: json['signed_metadata'] as String?,
      display: (json['display'] as List<dynamic>?)
          ?.map((e) => Display.fromJson(e as Map<String, dynamic>))
          .toList(),
      credentialIdentifiersSupported: json['credential_identifiers_supported'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'credential_issuer': credentialIssuerIdentifier.toJson(),
    if (authorizationServers != null)
      'authorization_servers': authorizationServers!.map((e) => e.toString()).toList(),
    'credential_endpoint': credentialEndpoint.toJson(),
    if (batchCredentialEndpoint != null)
      'batch_credential_endpoint': batchCredentialEndpoint!.toJson(),
    if (deferredCredentialEndpoint != null)
      'deferred_credential_endpoint': deferredCredentialEndpoint!.toJson(),
    if (notificationEndpoint != null)
      'notification_endpoint': notificationEndpoint!.toJson(),
    'credential_response_encryption': credentialResponseEncryption.toJson(),
    'credential_configurations_supported': credentialsSupported,
    if (signedMetadata != null) 'signed_metadata': signedMetadata,
    'display': display.map((e) => e.toJson()).toList(),
    if (credentialIdentifiersSupported != null)
      'credential_identifiers_supported': credentialIdentifiersSupported,
  };
}
