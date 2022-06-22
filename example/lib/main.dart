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
