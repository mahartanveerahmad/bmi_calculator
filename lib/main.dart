import 'package:bmi_calculator/splash.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI ",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const Splash(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final wtController = TextEditingController();
  final ftController = TextEditingController();
  final inController = TextEditingController();
  var bgColor = Colors.indigo[200];
  var result = "";
  var msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text("Enter the weight (in kg)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  controller: wtController,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: const InputDecoration(
                      label: Text("Enter the height (in fit)"),
                      prefixIcon: Icon(Icons.height)),
                ),
                TextField(
                  controller: inController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter your height (in inches)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    var weight = wtController.text.toString();
                    var heightInFeet = ftController.text.toString();
                    var heightInInches = inController.text.toString();
                    if (weight != "" &&
                        heightInFeet != "" &&
                        heightInInches != "") {
                      var weightInIntiger = int.parse(weight);
                      var heightInFeetInIntiger = int.parse(heightInFeet);
                      var heightInInchesInIntiger = int.parse(heightInInches);

                      var totalInchies = (heightInFeetInIntiger * 12) +
                          heightInInchesInIntiger;

                      var totalCentimeters = totalInchies * 2.54;

                      var totalMeters = totalCentimeters / 100;

                      var bmi = weightInIntiger / (totalMeters * totalMeters);

                      if (bmi > 25) {
                        msg = "Your are Overweight ";
                        bgColor = Colors.orange[200];
                      } else if (bmi < 18) {
                        msg = "Your are Underweight ";
                        bgColor = Colors.red[200];
                      } else {
                        msg = "Your are healthy";
                        bgColor = Colors.green[200];
                      }

                      setState(() {
                        result =
                            "$msg , Your BMI is : ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = " Please fill all the inputs thanks!!";
                      });
                    }
                  },
                  child: const Text("Calculate"),
                ),
                Center(
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 20,
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
