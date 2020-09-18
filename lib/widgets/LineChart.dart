import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/Entry.dart';

class LineChart extends StatelessWidget {
  final List<Entry> _data;

  List<charts.Series<Entry, int>> _createSeries() {
    int i = 0;

    return [
      new charts.Series<Entry, int>(
        id: 'LineChart',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Entry entry, _) => entry.age,
        measureFn: (Entry entry, _) => entry.numSteps,
        data: _data,
      )
    ];
  }

  LineChart(this._data);

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      _createSeries(),
      animate: true,
    );
  }
}
