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

## About
 
- This project library contains two main files named:

1) main_with_inheritance.dart : which showcases how it will bee with Inherited Widget
2) main_without_inheritance.dart : which showcases the problem existing in widget tree without inheritance

## Expected Output

- Both the added configurations will provide the same result.

## Problem Resolved

- Not using Inheritance causes 2 severe problems:
- 
1) We will need to create identical constructors for every child component in the widget tree
2) When we update the passed data, flutter will rebuild every single one of those child classes which is unnecessary and costly