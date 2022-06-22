import 'package:flutter/material.dart';
import 'package:prefix_provider/prefix_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Prefix Provider",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Example Prefix Provider"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _etController = TextEditingController();
  String? selectOperator;

  // List<Operator> data = [
  //   Operator(name: "telkomsel", value: ["0812", "0813", "0821", "0822", "0852", "0853", "0823", "0851"]),
  //   Operator(name: "indosat", value: ["0814", "0815", "0816", "0855", "0856", "0857", "0858"]),
  //   Operator(name: "tri", value: ["0895", "0896", "0897", "0898", "0899"]),
  //   Operator(name: "smartfren", value: ["0881", "0882", "0883", "0884", "0885", "0886", "0887", "0888", "0889"]),
  //   Operator(name: "xl", value: ["0817", "0818", "0819", "0859", "0877", "0878"]),
  //   Operator(name: "axis", value: ["0838", "0831", "0832", "0833"]),
  //   Operator(name: "bolt", value: ["0999", "0998"]),
  // ];

  // /// METHOD PARSE OPERATOR
  // void parseOperator(int? phone) {
  //   if (phone == null) {
  //     selectOperator = null;
  //     setState(() {});
  //   } else if (phone.toString().length < 3) {
  //     selectOperator = null;
  //     setState(() {});
  //   } else {
  //     for (Operator item in data) {
  //       if (item.value!.contains("0$phone".toString().substring(0, 4))) {
  //         setState(() {
  //           selectOperator = item.name;
  //         });
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 50),
          Text("Provider: ${selectOperator ?? ""}", style: const TextStyle(fontSize: 23)),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _etController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  contentPadding: const EdgeInsets.only(left: 20),
                ),
                onChanged: (String val) {
                  var result = parseOperator(int.tryParse(val));
                  selectOperator = result;
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// CLASS OPERATOR
class Operator {
  String? name;
  List<String>? value;

  Operator({this.name, this.value});
}
