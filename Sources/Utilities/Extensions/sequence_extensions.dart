
import 'dart:async';

extension SequenceExtensions<T> on Iterable<T> {
  Future<List<U>> asyncMap<U>(
    Future<U> Function(T element) transform,
  ) async {
    List<U> values = [];
    
    for (var element in this) {
      values.add(await transform(element));
    }
    
    return values;
  }
  
  Future<List<U>> asyncCompactMap<U>(
    Future<U?> Function(T element) transform,
  ) async {
    List<U> values = [];
    
    for (var element in this) {
      final value = await transform(element);
      if (value != null) {
        values.add(value);
      }
    }
    
    return values;
  }
}
