
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../errors/generic_error_response.dart';

enum PostError {
  invalidUrl,
  networkError,
  response,
  cannotParse,
  serverError
}

extension PostErrorExtension on PostError {
  String get message {
    switch (this) {
      case PostError.invalidUrl:
        return 'Invalid URL';
      case PostError.networkError:
        return 'Network Error';
      case PostError.response:
        return 'Generic error response';
      case PostError.cannotParse:
        return 'Could not parse response';
      case PostError.serverError:
        return 'Server error';
    }
  }
}

abstract class PostingType {
  Future<Result<T, PostError>> post<T>(
    http.Request request,
    T Function(Map<String, dynamic>) fromJson,
  );
  Future<Result<bool, PostError>> check(http.Request request);
}

class Poster implements PostingType {
  final http.Client client;

  Poster({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<Result<T, PostError>> post<T>(
    http.Request request,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final streamedResponse = await client.send(request);
      final response = await http.Response.fromStream(streamedResponse);
      
      if (response.statusCode >= 400 && response.statusCode < 500) {
        final errorData = json.decode(response.body);
        return Result.failure(PostError.response);
      } else if (response.statusCode >= 500) {
        return Result.failure(PostError.serverError);
      }

      try {
        final data = json.decode(response.body);
        if (data is! Map<String, dynamic>) {
          return Result.failure(PostError.cannotParse);
        }
        final object = fromJson(data);
        return Result.success(object);
      } catch (e) {
        if (response.statusCode == 200) {
          return Result.failure(PostError.cannotParse);
        } else {
          return Result.failure(PostError.networkError);
        }
      }
    } catch (e) {
      return Result.failure(PostError.networkError);
    }
  }

  @override
  Future<Result<bool, PostError>> check(http.Request request) async {
    try {
      final streamedResponse = await client.send(request);
      final response = await http.Response.fromStream(streamedResponse);
      return Result.success(response.statusCode >= 200 && response.statusCode < 300);
    } catch (e) {
      return Result.failure(PostError.networkError);
    }
  }
}

class Result<T, E> {
  final T? _value;
  final E? _error;
  final bool isSuccess;

  Result.success(T value)
      : _value = value,
        _error = null,
        isSuccess = true;

  Result.failure(E error)
      : _value = null,
        _error = error,
        isSuccess = false;

  T get() => _value!;
  E getError() => _error!;
}
