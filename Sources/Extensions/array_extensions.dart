// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

extension ListExtensions<T> on List<T> {
  bool containsAll(List<T> elements) {
    final elementSet = Set<T>.from(elements);
    final listSet = Set<T>.from(this);
    return elementSet.difference(listSet).isEmpty;
  }
}