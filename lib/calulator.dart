import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  var userInput = '';
  var answer = '';
  bool isResultDisplayed = false;

  void tapOnEqual() {
    if (userInput.isNotEmpty) {
      if (userInput.endsWith('+') ||
          userInput.endsWith('-') ||
          userInput.endsWith('*') ||
          userInput.endsWith('/')) {
        setState(() {
          answer = '';
        });
      } else {
        try {
          Parser p = Parser();
          Expression expression = p.parse(userInput.replaceAll('X', '*'));
          ContextModel contextModel = ContextModel();
          double evaluateExpression =
              expression.evaluate(EvaluationType.REAL, contextModel);
          answer = evaluateExpression.toString();
          if (answer.endsWith('.0')) {
            answer = answer.substring(0, answer.length - 2);
          }
          isResultDisplayed = true;
        } catch (e) {
          answer = '';
        }
        setState(() {});
      }
    }
  }

  void onNumberTap(String number) {
    if (isResultDisplayed) {
      setState(() {
        userInput = answer;
        isResultDisplayed = false;
      });
    }

    if (number == '.') {
      List<String> numbers = userInput.split(RegExp(r'[-+*/]'));
      String lastNumber = numbers.isNotEmpty ? numbers.last : '';

      if (lastNumber.contains('.')) {
        return;
      }
    }

    setState(() {
      userInput += number;
    });
  }

  Widget myIconButton() {
    final widthM = MediaQuery.sizeOf(context).width;
    final heightM = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
        setState(() {});
      },
      child: Container(
        height: heightM * 0.08,
        width: widthM * 0.20,
        margin: EdgeInsets.all(widthM * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Center(
          child: Icon(
            Icons.backspace_outlined,
            color: Colors.white.withOpacity(0.3),
            size: 30,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthM = MediaQuery.sizeOf(context).width;
    final heightM = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              width: widthM * 1,
              height: heightM * 0.47,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: heightM * 0.05),
                child: Column(
                  children: [
                    Text(
                      userInput.toString(),
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '=${answer.toString()}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: heightM * 0.53,
              width: widthM * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                            onTap: () {
                              setState(() {
                                userInput = '';
                                answer = '';
                                isResultDisplayed = false;
                              });
                            },
                            title: 'AC',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.grey.withOpacity(0.5),
                            txtColor: Colors.white.withOpacity(0.3),
                          ),
                          myIconButton(),
                          MyButton(
                            onTap: () {
                              setState(() {
                                userInput += '/';
                              });
                            },
                            title: '/',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.blue.withOpacity(0.8),
                            txtColor: Colors.white.withOpacity(0.5),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            onTap: () {
                              onNumberTap('7');
                            },
                            title: '7',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                          MyButton(
                            onTap: () {
                              onNumberTap('8');
                            },
                            title: '8',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                          MyButton(
                            onTap: () {
                              onNumberTap('9');
                            },
                            title: '9',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            onTap: () {
                              onNumberTap('4');
                            },
                            title: '4',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                          MyButton(
                            onTap: () {
                              onNumberTap('5');
                            },
                            title: '5',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                          MyButton(
                            onTap: () {
                              onNumberTap('6');
                            },
                            title: '6',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            onTap: () {
                              onNumberTap('1');
                            },
                            title: '1',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                          MyButton(
                            onTap: () {
                              onNumberTap('2');
                            },
                            title: '2',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                          MyButton(
                            onTap: () {
                              onNumberTap('3');
                            },
                            title: '3',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            onTap: () {
                              onNumberTap('0');
                            },
                            title: '0',
                            height: heightM * 0.08,
                            btnColor: Colors.white.withOpacity(0.2),
                            width: widthM * 0.45,
                          ),
                          MyButton(
                            onTap: () {
                              onNumberTap('.');
                            },
                            title: '.',
                            height: heightM * 0.08,
                            width: widthM * 0.20,
                            btnColor: Colors.white.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      MyButton(
                        onTap: () {
                          setState(() {
                            userInput += 'X';
                          });
                        },
                        title: 'X',
                        height: heightM * 0.08,
                        width: widthM * 0.20,
                        btnColor: Colors.blue.withOpacity(0.8),
                        txtColor: Colors.white.withOpacity(0.5),
                      ),
                      MyButton(
                        onTap: () {
                          setState(() {
                            userInput += '-';
                          });
                        },
                        title: '-',
                        height: heightM * 0.08,
                        width: widthM * 0.20,
                        btnColor: Colors.blue.withOpacity(0.8),
                        txtColor: Colors.white.withOpacity(0.5),
                      ),
                      MyButton(
                        onTap: () {
                          setState(() {
                            userInput += '+';
                          });
                        },
                        title: '+',
                        height: heightM * 0.13,
                        width: widthM * 0.20,
                        btnColor: Colors.blue.withOpacity(0.8),
                        txtColor: Colors.white.withOpacity(0.5),
                      ),
                      MyButton(
                        onTap: () {
                          setState(() {
                            tapOnEqual();
                          });
                        },
                        title: '=',
                        height: heightM * 0.13,
                        width: widthM * 0.20,
                        btnColor: Colors.blue.withOpacity(1),
                        txtColor: Colors.white.withOpacity(0.8),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final Color txtColor;
  final Color btnColor;
  final double height;
  final double width;
  VoidCallback onTap;

  MyButton({
    super.key,
    this.txtColor = Colors.blue,
    this.btnColor = Colors.grey,
    required this.title,
    this.height = 0,
    this.width = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final widthM = MediaQuery.sizeOf(context).width;
    final heightM = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.all(widthM * 0.02),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: btnColor,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: txtColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
