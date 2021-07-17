import 'package:currency_convertor/widget/customTextField.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String from;
  final String to;
  final String results;
  final Function setAmount;

  CustomContainer({
    this.from,
    this.to,
    this.results,
    this.setAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 340,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  from,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                ),
                Icon(
                  Icons.forward,
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                ),
                Text(
                  to,
                  style: TextStyle(
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomField(
              title: from,
              label: from,
              value: from,
              enabled: true,
              setAmount: setAmount,
            ),
            SizedBox(
              height: 40,
            ),
            CustomField(
              title: to,
              label: results != "0.0" ? results : to,
              value: results,
              enabled: false,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: Offset(
              3,
              3,
            ),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
