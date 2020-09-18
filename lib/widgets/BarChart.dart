import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/Entry.dart';

class BarChart extends StatelessWidget {
  final List<Entry> _data;

  List<charts.Series<Entry, String>> _createSeries() {
    return [
      new charts.Series<Entry, String>(
        id: 'BarChart',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Entry entry, _) => entry.date,
        measureFn: (Entry entry, _) => entry.numSteps,
        data: _data,
      )
    ];
  }

  BarChart(this._data);

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      _createSeries(),
      animate: true,
    );
  }
}
