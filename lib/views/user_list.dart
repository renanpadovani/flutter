import 'package:app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/users.dart';
import '../widgets/user_tile.dart';

class UserList extends StatelessWidget{
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            }, 
            icon: const Icon(Icons.add),
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        ),
    );
  }
}