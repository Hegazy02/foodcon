import 'dart:io';

import 'package:flutter/material.dart';

class AddNewRecipePro extends ChangeNotifier {
  String? _amountValue = 'ملقعة صغيرة';
  String? _defficultyValue = 'سهلة';
  List<bool> _ingredientsNumbers = [true];
  List<bool> _processNumbers = [true];
  File? _recipePic;
  get recipePic => _recipePic;
  set recipePic(val) {
    _recipePic = val;
    notifyListeners();
  }

  String? get amountValue => _amountValue;
  String? get defficultyValue => _defficultyValue;
  List get ingredientsNumbers => _ingredientsNumbers;
  List get processNumbers => _processNumbers;

  set amountValue(val) {
    _amountValue = val;
    notifyListeners();
  }

  set defficultyValue(val) {
    _defficultyValue = val;
    notifyListeners();
  }

  set AddingredientsNumbers(bool val) {
    _ingredientsNumbers.add(val);
    notifyListeners();
  }

  set removeingredientsNumbers(index) {
    _ingredientsNumbers.removeAt(index);
    notifyListeners();
  }

  set AddprocessNumbers(bool val) {
    _processNumbers.add(val);
    notifyListeners();
  }

  set removeprocessNumbers(index) {
    _processNumbers.removeAt(index);
    notifyListeners();
  }
}
