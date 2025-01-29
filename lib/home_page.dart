import 'dart:math';
import 'package:flutter/material.dart';

TextEditingController ageController = TextEditingController();
TextEditingController feetController = TextEditingController();
TextEditingController inchController = TextEditingController();
TextEditingController weightController = TextEditingController();

String resultWord = "";
Color maleButtonTap = Colors.grey;
Color femaleButtonTap = Colors.grey;
Widget healthStatus = SizedBox();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  num age = 0;
  num feet = 0;
  num inch = 0;
  num totalinch = 0;
  num totalcm = 0;
  num totalmeter = 0;
  num Accheight = 0;
  num weight = 0;
  num result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                child: Image.asset(
                  "assets/images/heart.png",
                  color: Colors.redAccent,
                  width: 350,
                ),
              ),
              Positioned(
                  child: Center(child: Text("${result == 0 ? "24.7" : result.toStringAsFixed(1)}", style: TextStyle(
                      fontSize: 65, color: Colors.redAccent),))),
            ]),
        Center(
          child: healthStatus,
        ),
        Text(
          textAlign: TextAlign.center,
            "${(result == 0) ? "Healthy" : resultWord}",
          style: TextStyle(fontSize: 45, color: Color(0xff2EA98D)),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  maleButtonTap = Colors.blue;
                  femaleButtonTap = Colors.grey;
                  setState(() {

                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.male_sharp,
                      size: 60,
                      color: maleButtonTap,
                    ),
                    Text(
                      "Male",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  femaleButtonTap = Colors.pink;
                  maleButtonTap = Colors.grey;
                  setState(() {

                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.female_sharp,
                      size: 60,
                      color: femaleButtonTap,
                    ),
                    Text(
                      "Female",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    child: Text(
                      "Age",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: TextField(
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                      controller: ageController,
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
              Divider(),
              Column(
                children: [
                  Container(
                    child: Text(
                      "Feet",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: 25,
                    child: TextField(
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                      controller: feetController,
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      "Inch",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: 25,
                    child: TextField(
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                      controller: inchController,
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
              Divider(),
              Column(
                children: [
                  Container(
                    child: Text(
                      "Weight",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                      controller: weightController,
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 15,
          ),
        ),
        Container(
          width: 400,
          height: 60,
          child: ElevatedButton(
              onPressed: () {
                CalculateBMI();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  backgroundColor: Color(0xff2EA98D).withOpacity(0.6),
                  foregroundColor: Color(0xffffffff)),
              child: Text(
                "Calculate BMI",
                style: TextStyle(fontSize: 25),
              )),
        ),]
      ),
    );
  }
  void CalculateBMI (){
    if(ageController.text.isNotEmpty && feetController.text.isNotEmpty && weightController.text.isNotEmpty){
      age = int.parse(ageController.text.toString());
      feet = int.parse(feetController.text.toString());
      inch = int.parse(inchController.text.toString());
      weight = double.parse(weightController.text.toString());
      totalinch = ((feet * 12) + inch).toInt();
      totalcm = (totalinch * 2.54);
      totalmeter = totalcm / 100;
      /*Accheight = (feet * 12 + inch) * 2.54 / 100;*/
      result = (weight / pow(totalmeter, 2));
      if (result >= 18 && result <= 25) {
        resultWord = "Healthy";
        healthStatus = Image.asset("assets/images/bg_healthy.png" , width: 30, height: 30, fit: BoxFit.cover,);
      } else if (result < 18) {
        resultWord = "Under Weight";
        healthStatus = Image.asset("assets/images/bg_underWeight.png" , width: 60, height: 60, fit: BoxFit.cover,);
      } else if(result > 24.9){
        resultWord = "Over Weight";
        healthStatus = Image.asset("assets/images/bg_overWeight.png" , width: 30, height: 30, fit: BoxFit.cover,);
      } else {
        print('Null');
      }
      print('$result');

      setState(() {

      });
    }else {
      print("Please Enter the all Mandatory Fields");
      return;
    }
  }
}
