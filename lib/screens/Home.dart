import 'package:flutter/material.dart';
import 'package:flutter_calculator/screens/widgets/sampleButton.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:fraction/fraction.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String result = "";
  String display = "";
  String str = "";


  void clicked(val){
    setState(() {
      if(str.toString().isEmpty){
        if(val == "x" || val == "*" || val == "/" || val == "-" || val == "+" || val == "C" || val == "AC" || val == "="){
          display = "";
          result = "";
          str = "";
          return;
        }
      }

      // if(val == "0" || val == "1" || val == "2" || val == "3" || val == "4" || val == "5" ||
      //     val == "6" || val == "7" || val == "8" || val == "9"){
      //   tempStr += val;
      // }
      // else if(val == "*" || val == "/" || val == "-" || val == "+"){
      //   result = double.parse(tempStr);
      //   operand = val;
      //   tempStr = "";
      // }
      // else if(val == "="){
      //   display = result.toString();
      // }


      if(val == "AC"){
        str = "";
        display = "";
        result = "";
      }
      else if(val == "C"){
        str = str.substring(0, str.length - 1);
      }
      else if(val == "="){
        try{
          result = str.replaceAll("%", "*(1/100)");
          Parser p = Parser();
          Expression exp = p.parse(result);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          eval % 1 == 0 ? display = eval.toInt().toString() : display = eval.toStringAsPrecision(5);
          print(eval);
        }
        catch(error){
          display = "error";
        }
      }
      // Fraction Handling
      else if(display.toString().isNotEmpty && val == "x"){
        if(display.contains("/")){
          final split = display.split("/");
          display = Fraction(int.parse(split[0]), int.parse(split[1])).toDouble().toString();
          print(display);
        }
        else{
          double number = double.parse(display);
          display = number.toFraction().toString();
        }

      }
      else{
        str += val;
      }
      // str = str.replaceAll("x", "*");
    });

  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF0B344F),
      appBar: AppBar(
        title: const Text("Calculator", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Color(0xFF0E2433),
        leading: Icon(Icons.menu_open, color: Colors.white,),
      ),
      body: Container(
        // color: Color(0xFF003366),
        color: Color(0xFF0B344F),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 30),
                color: Color(0xFF0E2433),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(str, style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),),
                    Text(display, style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                  ],
                ),

              ),
            ),
            Container(
              child: Column(
                ///BUTTONS
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          clicked("AC");
                        },
                        child: sampleButton(value: "AC",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("C");
                        },
                        child: sampleButton(value: "C",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("x");
                        },
                        child: sampleButton(value: "x",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("/");
                        },
                        child: sampleButton(value: "/",),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          clicked("(");
                        },
                        child: sampleButton(value: "(",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked(")");
                        },
                        child: sampleButton(value: ")",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("%");
                        },
                        child: sampleButton(value: "%",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("*");
                        },
                        child: sampleButton(value: "*",),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          clicked("1");
                        },
                        child: sampleButton(value: "1",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("2");
                        },
                        child: sampleButton(value: "2",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("3");
                        },
                        child: sampleButton(value: "3",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("-");
                        },
                        child: sampleButton(value: "-",),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          clicked("4");
                        },
                        child: sampleButton(value: "4",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("5");
                        },
                        child: sampleButton(value: "5",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("6");
                        },
                        child: sampleButton(value: "6",),
                      ),
                      GestureDetector(
                        onTap: (){
                          clicked("+");
                        },
                        child: sampleButton(value: "+",),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width*0.75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    clicked("7");
                                  },
                                  child: sampleButton(value: "7",),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    clicked("8");
                                  },
                                  child: sampleButton(value: "8",),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    clicked("9");
                                  },
                                  child: sampleButton(value: "9",),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    clicked("0");
                                  },
                                  child: sampleButton(value: "0",),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    clicked("00");
                                  },
                                  child: sampleButton(value: "00",),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    clicked(".");
                                  },
                                  child: sampleButton(value: ".",),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                            clicked("=");
                          },
                          child: sampleButton(value: "=", buttonColor: Color(0xFF296D98), buttonHeight: 3.02,)
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



