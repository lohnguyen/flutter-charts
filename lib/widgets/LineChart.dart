import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/Entry.dart';

class LineChart extends StatelessWidget {
  final List<Entry> _data;
  final int _averageNumSteps;

  List<charts.Series<Entry, int>> _createSeries() {
    return [
      new charts.Series<Entry, int>(
        id: 'LineChart',
        colorFn: (_, __) => charts.Color.fromHex(code: '#187BCD'),
        domainFn: (Entry entry, _) => entry.dateIndex,
        measureFn: (Entry entry, _) => entry.numSteps,
        data: _data,
      )
    ];
  }

  LineChart(this._data, this._averageNumSteps);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 5,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: new charts.LineChart(
                _createSeries(),
                animate: true,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'On average, you have walked',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  Text(
                    _averageNumSteps.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'steps in the past week.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
