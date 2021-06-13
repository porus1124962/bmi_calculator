import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'dart:ui' as ui;

import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              fontSize: 18,
              foreground: Paint()
                ..shader = ui.Gradient.linear(
                  const Offset(50, 0),
                  const Offset(130, 30),
                  <Color>[
                    HexColor('#e0004f'),
                    HexColor('#00c8ff'),
                  ],
                )
          ),
        ),

        backgroundColor: HexColor('#090b2b'),
      ),
      body: HomePageBack()
    );
  }
}


class HomePageBack extends StatefulWidget {

  @override
  _HomePageBackState createState() => _HomePageBackState();
}

class _HomePageBackState extends State<HomePageBack> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[HexColor('#e0004f'),
      HexColor('#00c8ff')],
  ).createShader(Rect.fromLTWH(150.0, 0.0, 130.0, 0.0));


  double _currentSliderValue = 5.3;
  int _ageNum= 14;
  int _weightNum= 64;
  late Timer _timer;
  double _bmiTotal = 0;
  bool _btnEffectMale = false;
  bool _btnEffectFemale = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#05061c'),
      child: Center(
        child: Column(
          children: [
            Container(
              color: HexColor('#090b2b'),
              margin:EdgeInsets.symmetric(horizontal: 30,vertical: 25) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Male container start
                          Container(

                            height: 145,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                                HexColor('#e0004f')]),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor('#00c8ff').withOpacity(.5),
                                  spreadRadius: 0.1,
                                  blurRadius: 5,
                                  offset: Offset(-4,3),
                                ),
                              ]
                            ),


                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  _btnEffectMale = true;
                                  _btnEffectFemale = false;
                                });

                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Icon(
                                     Icons.male_rounded,
                                      color: _btnEffectMale?HexColor('#090b2b'):HexColor('#e0004f'),
                                      size: 100.0,
                                    ),
                                    Text('MALE',
                                      style: TextStyle(
                                          color:_btnEffectMale?HexColor('#090b2b'):HexColor("#e0004f"),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                                decoration: BoxDecoration(
                                  color:_btnEffectMale?HexColor('#b50241'):HexColor('#090b2b'),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          //Male container end
                          SizedBox(width: 10),
                          //Female container start

                          Container(
                            height: 145,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                                HexColor('#e0004f')]),

                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor('#00c8ff').withOpacity(.5),
                                    spreadRadius: 0.1,
                                    blurRadius: 5,
                                    offset: Offset(4,3),
                                  ),
                                ]
                            ),
                            child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _btnEffectMale = false;
                                      _btnEffectFemale = true;
                                    });
                                  },
                              child: Container(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.female_rounded,
                                      color: _btnEffectFemale?HexColor('#090b2b'):HexColor('#e0004f'),
                                      size: 100.0,
                                    ),
                                    Text('FEMALE',
                                      style: TextStyle(
                                          color:_btnEffectFemale?HexColor('#090b2b'):HexColor("#e0004f"),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                                decoration: BoxDecoration(
                                  color:_btnEffectFemale?HexColor('#b50241'):HexColor('#090b2b'),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          //Female container end
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                            HexColor('#e0004f')]),

                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                          decoration: BoxDecoration(
                            color: HexColor('#090b2b'),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Text('HEIGHT',
                                style: TextStyle(
                                    color: HexColor("#00c8ff"),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${double.parse((_currentSliderValue).toStringAsFixed(2))
                                    }',
                                    style: TextStyle(
                                      color: HexColor("#e0004f"),
                                      fontSize: 75,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text("Feet",style: TextStyle(
                                      color: HexColor("#00c8ff"),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                  )),
                                ],
                              ),
                              Slider(
                                value: _currentSliderValue,
                                activeColor: HexColor('#00c8ff'),
                                onChanged: (_newSliderCurrentValue){
                                  setState(() => _currentSliderValue = _newSliderCurrentValue );
                                },
                                min: 3.0,
                                max: 8.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  //firstRowFemaleMale end
                  //Second Row Slider  start
                  SizedBox(height: 20),
                  //Second Row Slider  end

                  //3rd Row  Weight and Age Start
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Weight Coloume start
                        Container(
                          height: 190,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                              HexColor('#e0004f')]),
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(height: 7),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text(
                                      'WEIGHT',
                                      style: new TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color:HexColor('#00c8ff')),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.line_weight,
                                      color:HexColor('#e0004f'),
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                                Text(
                                  '$_weightNum',
                                  style: new TextStyle(
                                      fontSize: 70.0,
                                      fontWeight: FontWeight.bold,
                                      color:HexColor('#00c8ff') ),
                                ),
                                SizedBox(height: 5),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style:ButtonStyle(
                                           overlayColor: MaterialStateProperty.resolveWith(
                                            (states) {
                                          return states.contains(MaterialState.pressed)
                                          ? HexColor('#090b2b')
                                              : null;
                                          },
                                          ),
                                          shape: MaterialStateProperty.all<CircleBorder>(
                                              CircleBorder(
                                              )
                                          ),
                                          backgroundColor: MaterialStateProperty.all<Color>(HexColor('#090b2b')),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _weightNum++;
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(360),
                                            gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                                              HexColor('#e0004f')]),
                                          ),
                                           child: Container(
                                            child: Icon(
                                              Icons.add,
                                              color: HexColor('#e0004f'),
                                              size: 20.0,
                                            ),
                                            margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                                            decoration: BoxDecoration(
                                              color: HexColor('#090b2b'),
                                              borderRadius: BorderRadius.circular(360),
                                            ),
                                          ),
                                        ),
                                      ),

                                      ElevatedButton(
                                        style:ButtonStyle(
                                          overlayColor: MaterialStateProperty.resolveWith(
                                                (states) {
                                              return states.contains(MaterialState.pressed)
                                                  ? HexColor('#090b2b')
                                                  : null;
                                            },
                                          ),
                                          shape: MaterialStateProperty.all<CircleBorder>(
                                              CircleBorder(
                                              )
                                          ),
                                          backgroundColor: MaterialStateProperty.all<Color>(HexColor('#090b2b')),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _weightNum--;
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(360),
                                            gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                                              HexColor('#e0004f')]),
                                          ),
                                          child: Container(
                                            child: Icon(
                                              Icons.remove,
                                              color: HexColor('#e0004f'),
                                              size: 20.0,
                                            ),
                                            margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                                            decoration: BoxDecoration(
                                              color: HexColor('#090b2b'),
                                              borderRadius: BorderRadius.circular(360),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                            decoration: BoxDecoration(
                              color: HexColor('#090b2b'),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        //Weight Coloume end
                        //Age Coloume start
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: 190,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                              HexColor('#e0004f')]),
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 7,
                                ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [

                                     Text(
                                      'AGE',
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()..shader = linearGradient),
                                        ),
                                     SizedBox(
                                       width: 15,
                                     ),
                                     Icon(
                                       Icons.calendar_today_rounded,
                                       color: Colors.pink,
                                       size: 30.0,
                                     ),
                                   ],
                                 ),
                                  Text(
                                    '$_ageNum',
                                    style: new TextStyle(
                                        fontSize: 70.0,
                                        fontWeight: FontWeight.bold,
                                        foreground: Paint()..shader = linearGradient),
                                  ),
                              SizedBox(height: 5),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style:ButtonStyle(
                                          overlayColor: MaterialStateProperty.resolveWith(
                                                (states) {
                                              return states.contains(MaterialState.pressed)
                                                  ? HexColor('#090b2b')
                                                  : null;
                                            },
                                          ),
                                          shape: MaterialStateProperty.all<CircleBorder>(
                                              CircleBorder(
                                              )
                                          ),
                                          backgroundColor: MaterialStateProperty.all<Color>(HexColor('#090b2b')),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _ageNum++;
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(360),
                                            gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                                              HexColor('#e0004f')]),
                                          ),
                                          child: Container(
                                            child: Icon(
                                              Icons.add,
                                              color: HexColor('#e0004f'),
                                              size: 20.0,
                                            ),
                                            margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                                            decoration: BoxDecoration(
                                              color: HexColor('#090b2b'),
                                              borderRadius: BorderRadius.circular(360),
                                            ),
                                          ),
                                        ),
                                      ),

                                      ElevatedButton(
                                        style:ButtonStyle(
                                          overlayColor: MaterialStateProperty.resolveWith(
                                                (states) {
                                              return states.contains(MaterialState.pressed)
                                                  ? HexColor('#090b2b')
                                                  : null;
                                            },
                                          ),
                                          shape: MaterialStateProperty.all<CircleBorder>(
                                              CircleBorder(
                                              )
                                          ),
                                          backgroundColor: MaterialStateProperty.all<Color>(HexColor('#090b2b')),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _ageNum--;
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(360),
                                            gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                                              HexColor('#e0004f')]),
                                          ),
                                          child: Container(
                                            child: Icon(
                                              Icons.remove,
                                              color: HexColor('#e0004f'),
                                              size: 20.0,
                                            ),
                                            margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                                            decoration: BoxDecoration(
                                              color: HexColor('#090b2b'),
                                              borderRadius: BorderRadius.circular(360),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                            decoration: BoxDecoration(
                              color: HexColor('#090b2b'),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        //Age Coloume end
                      ],
                    ),
                  ),
                  //3rd Row  Weight and Age Start



                ],

              ),
            ),
            //Bottom button Calculate start
            ElevatedButton(
              style:ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith(
                      (states) {
                    return states.contains(MaterialState.pressed)
                        ? HexColor('#090b2b')
                        : null;
                  },
                ),
                shape: MaterialStateProperty.all<CircleBorder>(
                    CircleBorder(
                    )
                ),
                backgroundColor: MaterialStateProperty.all<Color>(HexColor('#090b2b')),
              ),
              onPressed: (){
                setState(() {
                    _bmiTotal = _weightNum/((_currentSliderValue*0.3048)*(_currentSliderValue*0.3048));

                    Alert(
                      context: context,
                      type: AlertType.info,
                      title: '${double.parse((_bmiTotal).toStringAsFixed(2))
                      }',
                      desc: "You Body Mass Index",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();

                });
              },
              child: Container(
                //margin: EdgeInsets.symmetric(vertical: 50,horizontal: 0),

                height: 60,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(colors: [HexColor('#00c8ff'),
                    HexColor('#e0004f')]),
                ),
                child: Container(

                    margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                    decoration: BoxDecoration(
                      color: HexColor('#090b2b'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Calculate',
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient),
                    )

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

