import 'dart:js';

import 'package:currency_convertor/fetch_currency.dart';
import 'package:currency_convertor/widget/customBuilder.dart';
import 'package:currency_convertor/widget/customContainer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> currencies;
  String from;
  String to;
  double rates;
  String results = "0.0";
  String currencyAmount;
  FetchData fetchData = FetchData();
  bool isLoading = false;

  loading() {
    setState(() {
      isLoading = true;
    });
  }

  loadingStop() {
    setState(() {
      isLoading = false;
    });
  }

  getCurrenciesList() async {
    loading();
    currencies = await fetchData.getCurrencies();
    from = currencies[0];
    to = currencies[1];
    loadingStop();
  }

  fromValue(String value) {
    setState(() {
      from = value;
    });
  }

  toValue(String value) {
    setState(() {
      to = value;
    });
  }

  swapCurrency() {
    String swapper = from;
    setState(() {
      from = to;
      to = swapper;
    });
  }

  setAmount(value) {
    setState(() {
      currencyAmount = value;
    });
  }

  convertData() async {
    rates = await fetchData.getRates(
      from,
      to,
    );
    setState(() {
      results = (rates * double.parse(currencyAmount ?? 00)).toStringAsFixed(3);
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrenciesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/currency.png',
                        height: 200,
                        width: 250,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Currency Convertor",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.indigoAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomBuilder(
                        swapCurrency: swapCurrency,
                        to: to,
                        from: from,
                        currencies: currencies,
                        fromValues: fromValue,
                        toValues: toValue,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomContainer(
                        to: to,
                        from: from,
                        results: results,
                        setAmount: setAmount,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.teal.withOpacity(0.4),
                              offset: Offset(
                                2,
                                2,
                              ),
                              spreadRadius: 1,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            convertData();
                          },
                          child: Center(
                            child: Text(
                              "Convert",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Hello_Pirates',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
