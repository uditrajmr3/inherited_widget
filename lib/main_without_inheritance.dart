import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    bool isLoading = false;
    return MaterialApp(
      title: "Inherited Widget",
      home: Home(isLoading: isLoading, counter: counter,),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.isLoading, required this.counter}) : super(key: key);
  final bool isLoading;
  final int counter;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isLoading;
  late int counter;

  @override
  void initState() {
    isLoading = widget.isLoading;
    counter = widget.counter;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page (Without Inheritance)"),),
      body: MyCenterWidget(isLoading: isLoading, counter: counter,),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingButtonClicked,
      ),
    );
  }

  void onFloatingButtonClicked() {
    debugPrint("rebuilt Home");
    setState(() {
      counter++;
      if (counter % 2 == 0) {
        isLoading = false;
      } else {
        isLoading = true;
      }
    });
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({Key? key, required this.isLoading, required this.counter}) : super(key: key);
  final bool isLoading;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Center(child: MyCounterWidget(isLoading: isLoading, counter: counter,),);
  }
}

class MyCounterWidget extends StatelessWidget {
  const MyCounterWidget({Key? key, required this.isLoading, required this.counter}) : super(key: key);
  final bool isLoading;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: MyContainerWidget(isLoading: isLoading, counter: counter, ),
    );
  }
}

class MyContainerWidget extends StatelessWidget {
  const MyContainerWidget({Key? key, required this.isLoading, required this.counter}) : super(key: key);
  final bool isLoading;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading ? const CircularProgressIndicator() : Text('$counter'),
    );
  }
}
