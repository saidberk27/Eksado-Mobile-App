import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'accounting_stats.dart';

class AccountStatsPage extends StatefulWidget {
  const AccountStatsPage({super.key});

  @override
  State<AccountStatsPage> createState() => _AccountStatsPageState();
}

class _AccountStatsPageState extends State<AccountStatsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140.0,
        title: Image.asset(
          "assets/images/logoM.png",
          fit: BoxFit.contain,
          height: 120,
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Row(
              children: [
                NumericDisplay(
                  title: "Gelir",
                  future: AccountingStats().getTotalIncomes(),
                ),
                NumericDisplay(
                  title: "Gider",
                  future: AccountingStats().getTotalOutcomes(),
                ),
              ],
            ),
            Row(
              children: [
                NumericDisplay(
                  title: "Borç",
                  future: AccountingStats().getTotalDebts(),
                ),
                NumericDisplay(
                  title: "Alacak",
                  future: AccountingStats().getTotalReceivables(),
                ),
              ],
            ),
            Row(
              children: [
                NumericDisplay(
                  title: "Hızlı Oran",
                  future: AccountingStats().getQuickRatio(),
                  currencySign: false,
                ),
                NumericDisplay(
                  title: "Tam Oran",
                  future: AccountingStats().getCurrentRatio(),
                  currencySign: false,
                ),
              ],
            ),
            NumericDisplay(
              title: "Net Kar",
              future: AccountingStats().getNetProfitStr(),
              currencySign: false,
            ),
            Column(
              children: [
                PercentageDisplay(
                    title: "Gelir Bütçesi Yüzdesi",
                    future: AccountingStats().getIncomePercentage()),
                PercentageDisplay(
                    title: "Gider Bütçesi Yüzdesi",
                    future: AccountingStats().getOutcomePercentage()),
                PercentageDisplay(
                    title: "Net Kar Marjı",
                    future: AccountingStats().getNetProfitMargin()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PercentageDisplay extends StatelessWidget {
  String title;
  Future<int> future;
  PercentageDisplay({
    super.key,
    required String this.title,
    required Future<int> this.future,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            title,
            style: LightTheme.defaultTextTheme.displayLarge,
          ),
          Divider(
            thickness: 2,
            color: LightTheme.tertiaryColor,
          ),
          FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(alignment: Alignment.center, children: [
                  Text("${snapshot.data}%",
                      style: LightTheme.defaultTextTheme.displayLarge),
                  SfCircularChart(
                    series: <CircularSeries>[
                      RadialBarSeries<ChartData, String>(
                          dataSource: <ChartData>[
                            ChartData('Gelir Bütçesi',
                                double.parse(snapshot.data.toString())),
                            ChartData('Gelir',
                                100 - double.parse(snapshot.data.toString())),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          cornerStyle: CornerStyle.bothCurve),
                    ],
                  ),
                ]);
              } else {
                return Center(
                    child: Text(
                  "Yükleniyor...",
                  style: LightTheme.defaultTextTheme.displayLarge,
                ));
              }
            },
          )
        ],
      ),
    );
  }
}

class NumericDisplay extends StatelessWidget {
  String title;
  Future<String> future;
  bool currencySign;
  NumericDisplay(
      {super.key,
      required this.title,
      required this.future,
      this.currencySign = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Card(
          child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 3 - 10,
        child: Column(
          children: [
            Center(
                child: Text(
              title,
              style: LightTheme.defaultTextTheme.displayLarge,
            )),
            Divider(
              thickness: 2,
              color: LightTheme.tertiaryColor,
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                      child: Expanded(
                    child: Text(
                      "${snapshot.data}" + (currencySign ? " ₺" : ""),
                      style: LightTheme.defaultTextTheme.displayMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ));
                } else {
                  return Center(
                      child: Text(
                    "Yükleniyor...",
                    style: LightTheme.defaultTextTheme.displayLarge,
                  ));
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
