import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Thuc hanh 1",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String result = "";

  void checkAge() {
    String name = nameController.text;
    int age = int.tryParse(ageController.text) ?? 0;
    String note;

    if (age > 65) {
      note = 'Người già';
    } else if (age >= 6) {
      note = 'Người lớn';
    } else if (age > 2) {
      note = 'Trẻ em';
    } else {
      note = 'Em bé';
    }
    setState(() {
      result = "$name là : $note";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thuc Hanh 1")),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Ho va Ten"),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Tuoi"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: checkAge, child: Text("Kiem tra")),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
