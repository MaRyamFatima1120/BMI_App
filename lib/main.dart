import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodySmall: TextStyle(
                fontSize: 14,
              ))),
      home: const MyHomePage(title: 'BMI APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = " ";
  var bgColor=Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                )),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SizedBox(
            width: 300,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight(in kg)",
                        style: Theme.of(context).textTheme.bodySmall),
                    prefixIcon: const Icon(
                      Icons.line_weight,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter your Height(in feet)",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    prefixIcon: const Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter your Height(in Inch)",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    prefixIcon: const Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    var weight = wtController.text.toString();
                    var feet = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (weight != "" && feet != "" && inch != "") {
                      //BMI Calculation
                      var intWeight=int.parse(weight);
                      var intFeet=int.parse(feet);
                      var intInch=int.parse(inch);

                      var totalInch= (intFeet*12) + intInch;
                      var totalCM = totalInch * 2.54;
                      var totalMeter = totalCM/100;
                      var bmi=intWeight/(totalMeter * totalMeter);

                      var msg="";
                      if(bmi>25){
                        msg="You are OverWeight";
                        bgColor=Colors.deepOrange.shade200;


                      }else if(bmi<18){
                      msg="You're UnderWeight";
                      bgColor=Colors.red.shade200;
                      }
                      else{
                        msg="You're Healthy!!!";
                        bgColor=Colors.green.shade200;
                      }

                      setState(() {
                        result = "$msg\nYour BMI is:${bmi.toStringAsFixed(2)}";
                      });

                    } else {
                      setState(() {
                        result="Please Fill all required blanks!!";
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
