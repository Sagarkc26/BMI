import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var color = Color(0xFF283618);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff98c1d9), Color(0xffcce3de)])),
        child: Center(
          child: Container(
            width: 300,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "BMI",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14)),
                  label: const Text("Enter your Weight(in kg)"),
                  prefixIcon: const Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: const Text("Enter your Heignt(in Feet)"),
                  prefixIcon: const Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: const Text("Enter your Height(in inch)"),
                  prefixIcon: const Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var In = inController.text.toString();

                    if (wt != "" && ft != "" && In != "") {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iIn = int.parse(In);

                      var TIn = (ift * 12) + iIn;
                      var tcm = TIn * 2.54;
                      var tm = tcm / 100;
                      var bmi = iwt / (tm * tm);

                      setState(() {
                        result = "Your BMI is:${bmi.toStringAsFixed(3)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all required value!!";
                      });
                    }
                  },
                  child: const Text("Calculate")),
              Text(result)
            ]),
          ),
        ),
      ),
    );
  }
}
