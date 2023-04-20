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
      home: Home(
        isLoading: isLoading,
        counter: counter,
        child: const MyCenterWidget(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.isLoading, required this.counter, required this.child})
      : super(key: key);
  final bool isLoading;
  final int counter;
  final Widget child;

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
      appBar: AppBar(
        title: const Text("Home Page (With Inheritance)"),
      ),
      body: MyInheritedWidget(
        isLoading: isLoading,
        counter: counter,
        child: widget.child,
      ),
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
      debugPrint(counter.toString());
    });
  }
}


/// The inherited widget works in conjunction with a stateful widget
/// and allows you to pass that StatefulWidgets state to all of its ancestors.
/// Its a convenience widget.
/// So you don't have to type the code in every class to pass state down to its children.
class MyInheritedWidget extends InheritedWidget {
  final bool isLoading;
  final int counter;

  const MyInheritedWidget(
      {super.key,
      required this.isLoading,
      required this.counter,
      required super.child});
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
/// using only InheritedWidget solves only one problem that
/// we don't need to make identical constructors of every child component in widget tree
/// It will still call unnecessary rebuilds of all the child components in between
/// to resolve this, In the class Home, create a property
/// which is a Widget named child and pass a MyCenterWidget instance as this child’s argument.
/// pass this instance to Home via the widget variable.

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyCounterWidget(),
    );
  }
}

class MyCounterWidget extends StatelessWidget {
  const MyCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const MyContainerWidget(),
    );
  }
}

class MyContainerWidget extends StatelessWidget {
  const MyContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = MyInheritedWidget.of(context); // NEW

    if (myInheritedWidget == null) {
      return const Text('MyInheritedWidget was not found');
    }
    return Container(
      child: myInheritedWidget.isLoading
          ? const CircularProgressIndicator()
          : Text('${myInheritedWidget.counter}'),
    );
  }
}
