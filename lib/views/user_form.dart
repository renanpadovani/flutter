import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../provider/users.dart';

class UserForm extends StatelessWidget{
  UserForm({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user){

      _formData['id'] = user.id != null ? user.id.toString() : "";
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatar'] = user.avatarUrl;
    
  }

  @override
  Widget build(BuildContext context){

    final user = (ModalRoute.of(context)?.settings.arguments != null ? 
                    ModalRoute.of(context)?.settings.arguments as User : 
                    const User(name: "", email: "", avatarUrl: ""));
                    
    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () { 
              final isValid = _form.currentState?.validate();

              if(isValid != null && isValid){

                _form.currentState?.save();

                Provider.of<Users>(context, listen: false).put(User(
                    id: _formData['id'].toString(),
                    name: _formData['name'].toString(),
                    email: _formData['email'].toString(),
                    avatarUrl: _formData['avatar'].toString(),
                  ),
                );

                Navigator.of(context).pop();
              }

             }), 
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Informe um nome';
                  }
                },
                onSaved: (value) => _formData['name'] = value.toString(),
              ),
            TextFormField(
              initialValue: _formData['email'],
              decoration: const InputDecoration(labelText: 'E-mail'),
              onSaved: (value) => _formData['email'] = value.toString(),
            ),
            TextFormField(
              initialValue: _formData['avatar'],
              decoration: const InputDecoration(labelText: 'Avatar'),
              onSaved: (value) => _formData['avatar'] = value.toString(),
            ),
          ],
          ),
        ),
      ),
    );
  }
}