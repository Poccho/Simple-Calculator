import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int result = 0;

  void add() {
    setState(() {
      result = int.parse(firstNumController.text) + int.parse(secondNumCotroller.text);
    });
  }
  void subtract() {
    setState(() {
      result = int.parse(firstNumController.text) - int.parse(secondNumCotroller.text);
    });
  }
  void multiply() {
    setState(() {

      result = int.parse(firstNumController.text) * int.parse(secondNumCotroller.text);
    });
  }
  void divide() {
    setState(() {

      result = int.parse(firstNumController.text) ~/ int.parse(secondNumCotroller.text);
    });
  }


  TextEditingController firstNumController = TextEditingController();
  TextEditingController secondNumCotroller = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'C:/Users/USER/desktop/catjam.gif', // Replace with the URL of your GIF
              width: 250,
              height: 250,),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              child: TextField(
                controller: firstNumController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: "Enter First Number",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              child: TextField(
                controller: secondNumCotroller,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: "Enter Second Number",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              child: Text( "ANSWER ${result}",
                ),
              ),
          ],
        ),

      ),

      floatingActionButton: Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned(
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: add,
                    tooltip: "Add",
                    child: const Icon(Icons.add),
                  )),
              Positioned(
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: subtract,
                    tooltip: "Deduct",
                    child: const Icon(Icons.remove),
                  )),
              Positioned(
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: multiply,
                    tooltip: "Multiply",
                    child: const Icon(Icons.close),
                  )),
              Positioned(
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: divide,
                    tooltip: "Divide",
                    child: const Icon(Icons.percent),
                  )),
            ],
          )
      ),
    );
  }
}
