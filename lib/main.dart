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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text('Charts'),
          ),
          body: TabBarView(
            children: [
              BarChart(data),
              LineChart(data),
            ],
          ),
        ),
      ),
    );
  }
}
