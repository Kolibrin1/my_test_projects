import 'package:calculator_app/config/history_preferences.dart';
import 'package:flutter/material.dart';

class ClaculatorModel extends ChangeNotifier {
  List<String> _list = [];
  List<String> get getList => _list;
  String _textField = '';
  String get getText => _textField;
  String a = '';
  String b = '';
  String res = '=';
  String get getRes => res;
  int positionCursor = 0;

  void clearList() {
    _list.clear();
    setPrefs();
    notifyListeners();
  }

  void setPos(int pos) {
    positionCursor = pos;
  }

  void insertSign(String sign) {
    if (positionCursor < _textField.length) {
      _textField =
          '${_textField.substring(0, positionCursor)}$sign${_textField.substring(positionCursor, _textField.length)}';
    } else if (positionCursor == 0) {
      _textField = '$sign${_textField.substring(0, _textField.length)}';
    } else {
      _textField += sign;
    }
    setPrefs();
  }

  void changeRes() {
    int index = 0;
    String znak = '';
    if (a == '') {
      for (var i = 0; i < _textField.length; i++) {
        if (_textField[i] != '+' &&
            _textField[i] != '-' &&
            _textField[i] != '/' &&
            _textField[i] != 'x') {
          a += _textField[i];
        } else {
          index = i;
          znak = _textField[i];
          break;
        }
      }
    }
    for (var i = index + 1; i < _textField.length; i++) {
      b += _textField[i];
    }

    if (b != '') {
      if (znak == '+') {
        res = '=${double.parse(a) + double.parse(b)}';
      }
      if (znak == '-') {
        res = '=${double.parse(a) - double.parse(b)}';
      }
      if (znak == '/') {
        res = '=${double.parse(a) / double.parse(b)}';
      }
      if (znak == 'x') {
        res = '=${double.parse(a) * double.parse(b)}';
      }
    }
    a = '';
    b = '';
    if (!_list.contains(_textField + res) && res != '=') {
      _list.add(_textField + res);
    }
    if (res == '=') {
      res = '= Ошибка ввода';
    }

    setPrefs();
    notifyListeners();
  }

  void one() {
    insertSign('1');
    positionCursor++;
    notifyListeners();
  }

  void two() {
    insertSign('2');
    positionCursor++;
    notifyListeners();
  }

  void three() {
    insertSign('3');
    positionCursor++;
    notifyListeners();
  }

  void four() {
    insertSign('4');
    positionCursor++;
    notifyListeners();
  }

  void five() {
    insertSign('5');
    positionCursor++;
    notifyListeners();
  }

  void six() {
    insertSign('6');
    positionCursor++;
    notifyListeners();
  }

  void seven() {
    insertSign('7');
    positionCursor++;
    notifyListeners();
  }

  void eight() {
    insertSign('8');
    positionCursor++;
    notifyListeners();
  }

  void nine() {
    insertSign('9');
    positionCursor++;
    notifyListeners();
  }

  void zero() {
    insertSign('0');
    positionCursor++;
    notifyListeners();
  }

  void plus() {
    insertSign('+');
    positionCursor++;
    notifyListeners();
  }

  void sub() {
    insertSign('-');
    positionCursor++;
    notifyListeners();
  }

  void div() {
    insertSign('/');
    positionCursor++;
    notifyListeners();
  }

  void comp() {
    insertSign('*');
    positionCursor++;
    notifyListeners();
  }

  void del() {
    _textField = '';
    res = '=';
    positionCursor = 0;
    notifyListeners();
  }

  void sign() {
    insertSign('.');
    positionCursor++;
    notifyListeners();
  }

  void upAnswer() {
    if (res != '= Ошибка ввода') {
      _textField = res.substring(1);
    }
    res = '=';
    positionCursor = _textField.length;
    setPrefs();
    notifyListeners();
  }

  void remove() {
    if (_textField != '' &&
        _textField.isNotEmpty &&
        positionCursor == _textField.length) {
      _textField = _textField.substring(0, _textField.length - 1);
    } else if (_textField != '' && positionCursor != 0) {
      _textField =
          '${_textField.substring(0, positionCursor - 1)}${_textField.substring(positionCursor, _textField.length)}';
    }
    if (positionCursor != 0) {
      positionCursor--;
    }
    setPrefs();
    notifyListeners();
  }

  void setPrefs() async {
    await HistoryPreferences.setList(_list);
    await HistoryPreferences.setText(_textField);
    await HistoryPreferences.setRes(res);
  }

  void init() {
    _list = HistoryPreferences.getList() ?? [];
    _textField = HistoryPreferences.getText() ?? '';
    res = HistoryPreferences.getRes() ?? '=';
    positionCursor = _textField.length;
  }
}
