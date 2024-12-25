
class JOSEAlgorithmFamily<T extends JOSEAlgorithm> {
  List<T> _algorithms;

  JOSEAlgorithmFamily(List<T> algorithms) : _algorithms = algorithms;
  
  void append(T item) {
    _algorithms.add(item);
  }

  List<T> all() {
    return _algorithms;
  }

  void clear() {
    _algorithms = [];
  }
  
  bool contains(T item) {
    return _algorithms.any((element) => element == item);
  }
}
