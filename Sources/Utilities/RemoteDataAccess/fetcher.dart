
import 'dart:convert';
import 'package:http/http.dart' as http;

enum FetchError {
  invalidUrl,
  networkError,
  invalidResponse,
  decodingError,
  invalidStatusCode
}

extension FetchErrorExtension on FetchError {
  String get message {
    switch (this) {
      case FetchError.invalidUrl:
        return 'Invalid URL';
      case FetchError.networkError:
        return 'Network Error';
      case FetchError.invalidResponse:
        return 'Invalid Response';
      case FetchError.decodingError:
        return 'Decoding Error';
      case FetchError.invalidStatusCode:
        return 'Invalid Status Code';
    }
  }
}

abstract class Fetching<T> {
  Future<Result<T, FetchError>> fetch(Uri url);
}

class Fetcher<T> implements Fetching<T> {
  final http.Client client;
  final T Function(Map<String, dynamic>) fromJson;

  Fetcher({
    http.Client? client,
    required this.fromJson,
  }) : client = client ?? http.Client();

  @override
  Future<Result<T, FetchError>> fetch(Uri url) async {
    try {
      final response = await client.get(url);
      
      if (response.statusCode < 200 || response.statusCode > 299) {
        return Result.failure(FetchError.invalidStatusCode);
      }

      final dynamic jsonData = json.decode(response.body);
      if (jsonData is! Map<String, dynamic>) {
        return Result.failure(FetchError.decodingError);
      }

      final object = fromJson(jsonData);
      return Result.success(object);
    } catch (e) {
      if (e is FormatException) {
        return Result.failure(FetchError.decodingError);
      }
      return Result.failure(FetchError.networkError);
    }
  }

  Future<Result<String, FetchError>> fetchString(Uri url) async {
    try {
      final response = await client.get(url);
      
      if (response.statusCode < 200 || response.statusCode > 299) {
        return Result.failure(FetchError.invalidStatusCode);
      }

      return Result.success(response.body);
    } catch (e) {
      return Result.failure(FetchError.networkError);
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
