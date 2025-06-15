import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE2BCB7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Image.asset('assets/images/1A1.png'),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFFEFE0),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)
                      ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8), // 👈 Margin trái 16px
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 40,
                            color: Color(0xFF4E352F),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0), // 👈 Margin trái 16px
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4E352F),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: "example@gmail.com",
                              filled: true,
                              fillColor: Color(0xFFE2BCB7),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0), // 👈 Margin trái 16px
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4E352F),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "●●●●●●●●●●",
                              filled: true,
                              fillColor: Color(0xFFE2BCB7),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 0), // 👈 Margin trái 16px
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4E352F),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFE2BCB7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: Color(0xFF4E352F),
                                    width: 1,
                                  ),
                                ),
                                minimumSize: Size(230, 60)
                            ),
                            child: Text("NEXT", style: TextStyle(letterSpacing: 3, fontSize: 20, color: Color(0xFF4E352F)))
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 12, color: Color(0xFF4E352F)),
                            children: [
                              TextSpan(text: "Don't have an account? "),
                              TextSpan(
                                text: "SIGN UP",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )



                    ],
                  ),
                ),
              ),

            ],
          )
        ),
      )
    );
  }
}