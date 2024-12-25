import 'dart:convert';

abstract class AuthorisationServiceType {
  Future<U> formPost<T, U>({
    required PostingType poster,
    required Uri url,
    required T request,
  });

  Future<U> formPostWithHeaders<U>({
    required PostingType poster,
    required Uri url,
    required Map<String, String> headers,
    required Map<String, String> parameters,
  });

  Future<U> formPostWithBody<U>({
    required PostingType poster,
    required Uri url,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  });
}

class AuthorisationService implements AuthorisationServiceType {
  @override
  Future<U> formPost<T, U>({
    required PostingType poster,
    required Uri url,
    required T request,
  }) async {
    final post = FormPost(
      url: url,
      contentType: ContentType.form,
      formData: (request as dynamic).toJson(),
    );

    final result = await poster.post<U>(request: post.urlRequest);
    return result.fold(
      (success) => success,
      (error) => throw error,
    );
  }

  @override
  Future<U> formPostWithHeaders<U>({
    required PostingType poster,
    required Uri url,
    required Map<String, String> headers,
    required Map<String, String> parameters,
  }) async {
    final post = FormPost(
      url: url,
      contentType: ContentType.form,
      additionalHeaders: headers,
      formData: parameters,
    );

    final result = await poster.post<U>(request: post.urlRequest);
    return result.fold(
      (success) => success,
      (error) => throw error,
    );
  }

  @override
  Future<U> formPostWithBody<U>({
    required PostingType poster,
    required Uri url,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final post = FormPost(
      url: url,
      contentType: ContentType.json,
      additionalHeaders: headers,
      formData: body,
    );

    final result = await poster.post<U>(request: post.urlRequest);
    return result.fold(
      (success) => success,
      (error) => throw error,
    );
  }
}