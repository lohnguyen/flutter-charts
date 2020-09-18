import 'dart:math';
import 'package:intl/intl.dart';

import '../models/Entry.dart';

List<Entry> fetchData() {
  List<Entry> entries = [];
  final df = DateFormat('EEE, MMM d');

  for (int i = 1; i < 7; i++) {
    DateTime date = new DateTime.utc(2020, DateTime.july, i);
    Random random = new Random();
    entries.add(new Entry(1, 42, df.format(date), random.nextInt(500)));
  }

  return entries;
}
