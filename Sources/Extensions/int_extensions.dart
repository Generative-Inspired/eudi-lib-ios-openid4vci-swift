// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

extension IntExtensions on int {
  bool isWithinRange(RangeValues range) {
    return this >= range.start && this <= range.end;
  }
}

class RangeValues {
  final int start;
  final int end;
  
  const RangeValues(this.start, this.end);
}