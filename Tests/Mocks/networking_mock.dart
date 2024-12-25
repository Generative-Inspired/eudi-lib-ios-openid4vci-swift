
import 'package:openid4vci/openid4vci.dart';

class NetworkingMock implements Networking {
  final dynamic mockResponse;
  
  NetworkingMock([this.mockResponse]);

  @override
  Future<T> fetch<T>(Request<T> request) async {
    return mockResponse as T;
  }

  @override
  Future<T> post<T>(Request<T> request) async {
    return mockResponse as T;
  }
}
