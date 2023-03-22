import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spacetonic',debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;
  String _bmiCategory = "";

  void _calculateBMI() {
    double age = double.parse(_ageController.text);
    double height = double.parse(_heightController.text) / 100.0;
    double weight = double.parse(_weightController.text);

    if (age > 0 && height > 0 && weight > 0) {
      double bmi = weight / (height * height);
      setState(() {
        _bmiResult = bmi;
        if (bmi < 18.5) {
          _bmiCategory = "Underweight";
        } else if (bmi < 25) {
          _bmiCategory = "Normal";
        } else if (bmi < 30) {
          _bmiCategory = "Overweight";
        } else {
          _bmiCategory = "Obese";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: "BMI App",
    home: Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(0, 20, 20, 20),
        centerTitle: true,
        title: const Text("Spacetonic",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 25)),
        flexibleSpace: Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width*0.95,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                child: TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                    hintText: "Enter your age",hintStyle: const TextStyle(fontSize: 20)
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width*0.95,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                      hintText: "Enter your height in cm",hintStyle: const TextStyle(fontSize: 20)
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width*0.95,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                      hintText: "Enter your weight in kg",
                      hintStyle: const TextStyle(fontSize: 20,)
                  ),
                ),
              ),
            ),
            const SizedBox(height:30),
            ElevatedButton(style: ElevatedButton.styleFrom(minimumSize: const Size(60,60),
                backgroundColor: Colors.indigo,shape: const StadiumBorder()),
              onPressed: _calculateBMI,
              child: const Text("Calculate BMI",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 20),
            Container( decoration:  BoxDecoration(borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    end: Alignment.bottomLeft,
                    begin: Alignment.topRight,
                    colors: [Colors.indigoAccent, Colors.indigo])),
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Text(
                      "Your BMI: ${_bmiResult.toStringAsFixed(1)}",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Category: $_bmiCategory",
                      style: const TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    ),
    );}
}
