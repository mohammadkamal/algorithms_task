import 'package:algorithms_task/account.dart';
import 'package:algorithms_task/api_functions.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  final _textFieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(30));

  final _boxDecor = BoxDecoration(
    color: Color(0xFFF8FAFF),
    borderRadius: BorderRadius.circular(30),
  );

  Widget _fullNameField() {
    return Container(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: _fullNameController,
          decoration:
              InputDecoration(hintText: 'Full name', border: _textFieldBorder),
        ));
  }

  Widget _emailField() {
    return Container(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: _emailController,
          decoration:
              InputDecoration(hintText: 'Email', border: _textFieldBorder),
        ));
  }

  Widget _passwordField() {
    return Container(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration:
              InputDecoration(hintText: 'Password', border: _textFieldBorder),
        ));
  }

  Widget _confirmPasswordField() {
    return Container(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Confirm password', border: _textFieldBorder),
        ));
  }

  Widget _registerButton() {
    return Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
            onPressed: () {
              var _account = Account(
                  name: _fullNameController.text,
                  email: _emailController.text,
                  address: _addressController.text,
                  phone: _phoneController.text,
                  password: _passwordController.text,
                  passwordConfirmation: _confirmPasswordController.text);
              register(_account)
                  .then((value) => Navigator.pushReplacementNamed(context, '/'))
                  .onError((error, stackTrace) => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'Error occured. Please try again with correct data later.'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel')),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pushReplacementNamed(
                                          context, '/'),
                                  child: Text('Go to main page'))
                            ],
                          )));
            },
            child: Text('Sign up')));
  }

  Widget _mainUserInfo() {
    return Container(
      decoration: _boxDecor,
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _fullNameField(),
          _emailField(),
          _passwordField(),
          _confirmPasswordField()
        ],
      ),
    );
  }

  Widget _addressField() {
    return Container(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: _addressController,
          decoration:
              InputDecoration(hintText: 'Address', border: _textFieldBorder),
        ));
  }

  Widget _phoneField() {
    return Container(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: _phoneController,
          decoration:
              InputDecoration(hintText: 'Phone', border: _textFieldBorder),
        ));
  }

  Widget _additionalUserInfo() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      decoration: _boxDecor,
      child: Column(
        children: [_addressField(), _phoneField()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create an account'),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              _mainUserInfo(),
              _additionalUserInfo(),
              _registerButton()
            ])));
  }
}
