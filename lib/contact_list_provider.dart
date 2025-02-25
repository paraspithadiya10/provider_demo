import 'package:flutter/material.dart';

class ContactListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> contactData = [];

  List<Map<String, dynamic>> getData() => contactData;

  void addData(Map<String, dynamic> data) {
    contactData.add(data);
    notifyListeners();
  }

  void updateData(Map<String, dynamic> data, int index) {
    contactData[index] = data;
    notifyListeners();
  }

  void removeData(int index) {
    contactData.removeAt(index);
    notifyListeners();
  }
}
