import 'package:eksado_main/accounting/accounting_page.dart';
import 'package:eksado_main/product/product_page.dart';
import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';

import '../customer/customer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _tabController = TabController(length: 3, vsync: this);
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
        bottom: TabBar(
          labelColor: LightTheme.primaryColor,
          labelStyle: LightTheme.defaultTextTheme.bodyLarge,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Müşteri'),
            Tab(text: 'Ürün'),
            Tab(text: 'Muhasebe'),
          ],
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          CustomerPage(),
          ProductPage(),
          AccountingPage(),
        ],
        onPageChanged: (index) {
          _tabController.animateTo(index);
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
