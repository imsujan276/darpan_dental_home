import 'package:darpandentalhome/services/auth.dart';
import 'package:darpandentalhome/shared/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery. of(context). size. width,
                child: Image.asset('assets/images/Illustration.png', fit: BoxFit.contain,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Darpan Dental Home',
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(25,10,20,0),
                        child: Text(
                          'Email:',
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: 18,
                            ),
                          )
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,10,20,10),
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        cursorColor: Colors.black,
                        decoration: textInputDecoration.copyWith(hintText: 'sanjivgurung@gmail.com'),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(25,10,20,0),
                        child: Text(
                          'Password:',
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontSize: 18,
                              ),
                            )
                        )
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,10,20,20),
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            obscureText: true,
                            cursorColor: Colors.black,
                            decoration: textInputDecoration.copyWith(hintText: '**********')
                        ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                height: 55,
                minWidth: 230,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                color: Color(0xff4CBBB9),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if(result==null) {
                    print('Error Sign In');
                  } else {
                    print('Signed In');
                    print(result.uid);
                  }
                },
                child: Text(
                  'Sign In',
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),
                    )
                ),
              ),
              Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        widget.toggleView();
                      },
                      child: Text(
                        'Want a new account?',
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xffCE5B51),
                          ),
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
