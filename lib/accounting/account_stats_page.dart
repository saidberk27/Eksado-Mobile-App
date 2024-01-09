import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';

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
    AccountingStats accountingStats = AccountingStats();
    accountingStats.getTotalIncomes().then((value) {
      setState(() {});
    });

    accountingStats.getTotalOutcomes().then((value) {
      setState(() {});
    });

    accountingStats.getTotalDebts().then((value) {
      setState(() {});
    });

    accountingStats.getTotalReceivables().then((value) {
      setState(() {});
    });
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
            NumericDisplay(
              title: "Gelir",
              future: AccountingStats().getTotalIncomes(),
            ),
            NumericDisplay(
              title: "Gider",
              future: AccountingStats().getTotalOutcomes(),
            ),
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
      ),
    );
  }
}

class NumericDisplay extends StatelessWidget {
  String title;
  Future<String> future;
  NumericDisplay({super.key, required this.title, required this.future});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Card(
          child: Container(
        padding: EdgeInsets.all(20),
        height: 250,
        width: 250,
        child: Column(
          children: [
            Center(
                child: Text(
              title,
              style: LightTheme.defaultTextTheme.displayLarge,
            )),
            FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                      child: Text(
                    "${snapshot.data}₺",
                    style: LightTheme.defaultTextTheme.displayLarge,
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
