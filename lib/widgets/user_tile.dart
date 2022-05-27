// ignore_for_file: use_key_in_widget_constructors

import 'package:app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../provider/users.dart';

class UserTile extends StatelessWidget{

  final User user;
  
  const UserTile(this.user);

  @override
  Widget build(BuildContext context){
    final avatar = user.avatarUrl.isEmpty
      ? const CircleAvatar(child: Icon(Icons.person))
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      // ignore: sized_box_for_whitespace
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () { 
                Provider.of<Users>(context, listen: false).remove(user); 
              },
            ),
          ]
          ),
      ),
    );
  }
}