import 'package:flutter/material.dart';

class CreditCardView extends StatelessWidget {
  final double balance;
  final double incomeTotal;
  final double expenseTotal;

  const CreditCardView({
    super.key,
    required this.balance,
    required this.incomeTotal,
    required this.expenseTotal,
  });

  // Define colors similar to SwiftUI version
  static const color0 = Color.fromRGBO(238, 130, 238, 1); // Violet
  static const color1 = Color.fromRGBO(0, 188, 212, 1); // Cyan
  static const color3 = Color.fromRGBO(33, 150, 243, 1); // Blue
  static const color4 = Color.fromRGBO(255, 87, 34, 1); // Deep Orange

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardHeight = size.height * 0.22; // 22% of screen height
    final iconSize = cardHeight * 0.12;
    final balanceFontSize = cardHeight * 0.13;
    final regularFontSize = cardHeight * 0.07;

    return Padding(
      padding: EdgeInsets.all(size.width * 0.03),
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [color3, color4],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: iconSize,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: regularFontSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: balanceFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 300),
                          tween: Tween<double>(
                            begin: 0,
                            end: balance,
                          ),
                          builder: (context, value, child) {
                            return Text(
                              value.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: balanceFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: cardHeight * 0.02),
              Row(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.green,
                    size: iconSize * 0.8,
                  ),
                  SizedBox(width: size.width * 0.02),
                  Text(
                    'Income',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: regularFontSize,
                    ),
                  ),
                  const Spacer(),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 300),
                    tween: Tween<double>(
                      begin: 0,
                      end: incomeTotal,
                    ),
                    builder: (context, value, child) {
                      return Text(
                        value.toStringAsFixed(2),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: regularFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: cardHeight * 0.02),
              Row(
                children: [
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                    size: iconSize * 0.8,
                  ),
                  SizedBox(width: size.width * 0.02),
                  Text(
                    'Expenses',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: regularFontSize,
                    ),
                  ),
                  const Spacer(),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 300),
                    tween: Tween<double>(
                      begin: 0,
                      end: expenseTotal,
                    ),
                    builder: (context, value, child) {
                      return Text(
                        value.toStringAsFixed(2),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: regularFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
