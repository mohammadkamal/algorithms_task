import 'package:algorithms_task/api_functions.dart';
import 'package:algorithms_task/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _textFieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(30));

  Widget _email() {
    return Container(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              hintText: 'ex: johndoe@mail.com', border: _textFieldBorder),
        ));
  }

  Widget _password() {
    return Container(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration:
              InputDecoration(border: _textFieldBorder, hintText: '*********'),
        ));
  }

  Widget _loginButton() {
    return Container(
        padding: EdgeInsets.only(top: 8, right: 8, left: 8),
        child: ElevatedButton(
            onPressed: () {
              login(_emailController.text, _passwordController.text)
                  .then((value) => Navigator.pushReplacementNamed(context, '/'))
                  .onError((error, stack) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(
                            'Error occured. Please try again with correct email and password later.'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () =>
                                  Navigator.pushReplacementNamed(context, '/'),
                              child: Text('Go to main page'))
                        ],
                      );
                    });
              });
            },
            child: Text('Log in')));
  }

  Widget _forgetPassword() {
    return Container(
        alignment: Alignment.centerLeft,
        child: TextButton(onPressed: null, child: Text('Forget password?')));
  }

  Widget _dontHaveAccount() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 8, right: 8, left: 8),
        child: Text("Don't have account?"));
  }

  Widget _registerButton() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF071333))),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterPage(),
            )),
        child: Text(
          'Register',
          style: TextStyle(color: Color(0xFFFFCE00)),
        ));
  }

  Widget _mainForm() {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          _email(),
          _password(),
          _loginButton(),
          _forgetPassword(),
          _dontHaveAccount(),
          _registerButton()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Log in'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
              color: Color(0xFFF8FAFF),
              borderRadius: BorderRadius.circular(30)),
          child: _mainForm(),
        ));
  }
}
