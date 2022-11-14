import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayyid_themoviedb/Service/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;

  Future<void> _loginGoogle() async {
    setState(() {
      _isLoading = true;
    });
    await AuthService().signInWithGoogle();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     title: const Text('Google Login'),
    //   ),
    //   body: Container(
    //     width: size.width,
    //     height: size.height,
    //     padding: EdgeInsets.only(
    //         left: 20, right: 20, top: size.height * 0.2, bottom: size.height * 0.5
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         const Text("Hello, \nGoogle Sign In",
    //             style: TextStyle(
    //                 fontSize: 30
    //             )),
    //         GestureDetector(
    //           onTap: () {
    //             AuthService().signInWithGoogle();
    //           },
    //           child: const Image(width: 100,image: AssetImage('assets/images/google.png')),
    //         )
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4196E3),
              Color(0xFF373598),
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            stops: [0, 0.8],
          ),
        ),
        child: _isLoading
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Processing',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                _loginGoogle();
              },
              child: Container(
                height: 50,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      size: 30,
                      color: Colors.red[700],
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    const Text(
                      'Login With Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}