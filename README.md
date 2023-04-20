# Inherited Widget

This project showcase how to simplify code with inherited widget

## Implementation

- Create a new flutter project 
- change distributionUrl from 7.5 to 7.6 in android/gradle/wrapper/gradle-wrapper.properties
- delete existing main.dart file
- create 2 new files with the names main_with_inheritance.dart and main_without_inheritance.dart respectively or any name you would prefer.
- add the code from the provided gists into respective dart files
- if you are using android studio, go to edit configuration and make 2 new configurations with new names and data entry points
- now, run them simultaneously.

## Implemented CodeBase 

```
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
```

* The inherited widget works in conjunction with a stateful widget and allows you to pass that StatefulWidgets state to all of its ancestors. Its a convenience widget. So you don't have to type the code in every class to pass state down to its children. *

```
final myInheritedWidget = MyInheritedWidget.of(context); // NEW

    if (myInheritedWidget == null) {
      return const Text('MyInheritedWidget was not found');
    }
    return Container(
      child: myInheritedWidget.isLoading
          ? const CircularProgressIndicator()
          : Text('${myInheritedWidget.counter}'),
    );
```
## About
 
- This project library contains two main files named:

1) main_with_inheritance.dart : which showcases how it will bee with Inherited Widget
2) main_without_inheritance.dart : which showcases the problem existing in widget tree without inheritance

## Expected Output

- Both the added configurations will provide the same result.

## Problem Resolved

- Not using Inheritance causes 2 severe problems:

1) We will need to create identical constructors for every child component in the widget tree
2) When we update the passed data, flutter will rebuild every single one of those child classes which is unnecessary and costly