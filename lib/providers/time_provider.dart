import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final TimeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
