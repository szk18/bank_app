import 'package:bank_app/config/theme.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      constraints: const BoxConstraints.expand(),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        color: Colors.white,
        margin: EdgeInsets.zero,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  '2020年',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 400,
              child: SimpleBarChart(
                SimpleBarChart._createSampleData(),
                animate: true,
              ),
            ),
            const Divider(color: Colors.black),
            const Center(child: Text('この月の入金明細を見る')),
            const Divider(color: Colors.black)
          ],
        ),
      ),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList as List<charts.Series<OrdinalSales, String>>,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('1月', 5),
      new OrdinalSales('2月', 25),
      new OrdinalSales('3月', 100),
      new OrdinalSales('4月', 7),
      new OrdinalSales('5月', 45),
      new OrdinalSales('6月', 75),
      new OrdinalSales('7月', 5),
      new OrdinalSales('8月', 25),
      new OrdinalSales('9月', 0),
      new OrdinalSales('10月', 4),
      new OrdinalSales('11月', 42),
      new OrdinalSales('12月', 49),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.yen,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String month;
  final int yen;

  OrdinalSales(this.month, this.yen);
}
