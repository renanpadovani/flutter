
import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import '../data/dummy_users.dart';
import '../models/user.dart';

class Users with ChangeNotifier{
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all{
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(User user){

    if (user.id != null && user.id.toString().trim().isNotEmpty && _items.containsKey(user.id))
    {
      _items.update(user.id.toString(), (_) => user);
    }
    else{

      final id = Random().nextDouble().toString();

      _items.putIfAbsent(id, () => User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ));
    }

    notifyListeners();
  }

  void remove(User user){

    if(user.id.toString().isNotEmpty){

      _items.remove(user.id);
     
      notifyListeners();
    }
  }
}