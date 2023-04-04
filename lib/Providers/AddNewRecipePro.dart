import 'dart:io';

import 'package:flutter/material.dart';

class AddNewRecipePro extends ChangeNotifier {
  String? _amountValue = 'ملعقة صغيرة';
  String? _defficultyValue = 'سهلة';
  List<TextEditingController> _ingredientsNumbers = <TextEditingController>[
    TextEditingController()
  ];
  List<TextEditingController> _processNumbers = <TextEditingController>[
    TextEditingController(),
  ];

  File? _recipePic;

  get recipePic => _recipePic;
  set recipePic(val) {
    _recipePic = val;
    notifyListeners();
  }

  String? get amountValue => _amountValue;
  String? get defficultyValue => _defficultyValue;
  List<TextEditingController> get ingredientsNumbers => _ingredientsNumbers;
  List<TextEditingController> get processNumbers => _processNumbers;

  set amountValue(val) {
    _amountValue = val;
    notifyListeners();
  }

  set defficultyValue(val) {
    _defficultyValue = val;
    notifyListeners();
  }

  set AddingredientsNumbers(TextEditingController val) {
    _ingredientsNumbers.add(val);
    notifyListeners();
  }

  set removeingredientsNumbers(TextEditingController val) {
    _ingredientsNumbers.remove(val);
    notifyListeners();
  }

  set AddprocessNumbers(TextEditingController val) {
    _processNumbers.add(val);
    notifyListeners();
  }

  set removeprocessNumbers(TextEditingController con) {
    _processNumbers.remove(con);
    notifyListeners();
  }
}
