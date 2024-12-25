
import 'package:openid4vci/openid4vci.dart';

class NetworkingThrowingMock implements Networking {
  final Exception throwError;
  
  NetworkingThrowingMock(this.throwError);

  @override
  Future<T> fetch<T>(Request<T> request) async {
    throw throwError;
  }

  @override
  Future<T> post<T>(Request<T> request) async {
    throw throwError;
  }
}
