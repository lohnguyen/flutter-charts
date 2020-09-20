import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './widgets/BarChart.dart';
import './widgets/LineChart.dart';

import './services/appServices.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var data = fetchData();

  int _getAverageNumSteps() {
    int numSteps = 0;
    for (var entry in data) {
      numSteps += entry.numSteps;
    }
    return numSteps ~/ 7;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xFFF2EEE7),
          appBar: AppBar(
            title: Text('Charts', style: TextStyle(color: Color(0xFFEFC501))),
            backgroundColor: Color(0xFF003366),
            bottom: TabBar(
              indicatorColor: Color(0xFFEFC501),
              labelColor: Color(0xFFEFC501),
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: TabBarView(
              children: [
                BarChart(data, _getAverageNumSteps()),
                LineChart(data, _getAverageNumSteps()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
