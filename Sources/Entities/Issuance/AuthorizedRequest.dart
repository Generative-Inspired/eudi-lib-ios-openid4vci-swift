
abstract class CanExpire {
  double? get expiresIn;
  
  bool isExpired(double issued, double at) {
    if (issued >= at) {
      return true;
    }
    
    if (expiresIn == null) {
      return false;
    }
    
    final expiration = issued + expiresIn!;
    return expiration <= at;
  }
}
