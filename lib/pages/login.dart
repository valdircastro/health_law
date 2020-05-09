import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 128),
            SizedBox(
              width: 128,
              height: 128,
              child: Image(
                image: AssetImage('assets/hlver.png')
              )
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'E-mail'
              )
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Senha'
              ),
            ),
            SizedBox(
              height: 24,
            ),
            RaisedButton(
              color: Color(0xFF1bcfb6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                ),
              ),
              elevation: 0,
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/search');
              },
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Login with Facebook',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              elevation: 0,
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/search');
              },
            ),
          ],
        ),
      ),
    );
  }
}
