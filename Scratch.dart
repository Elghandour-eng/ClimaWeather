import 'dart:io';

import 'package:flutter/cupertino.dart';

void main() {
  performTasks();
}

void performTasks()  {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2()  {
  Duration three = Duration( seconds: 3);


  Future.delayed(three,(){print('Task 2 complete');});

}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}