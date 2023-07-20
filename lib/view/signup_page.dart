import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaki_shop/view/dashboard_page.dart';
import 'package:sizer/sizer.dart';

import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              Text(
                "Welcome to this app 👋",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0.sp),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hello, I guess you are new around here. You can start using the application after sign up.",
                style: TextStyle(color: Colors.blueGrey),
              ),
              SizedBox(
                height: 30,
              ),
              wTextField("Name", Icons.person_2_rounded),
              wTextField("Email", Icons.mail_outline),
              wTextField("Phone", Icons.phone_android),
              wTextField("Password", Icons.lock_outline),
              InkWell(
                onTap: () {
                  Get.off(() => DashboardPage());
                },
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0xffe06d72),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: double.infinity,

              //   child: TextButton(
              //     onPressed: () {
              //       Get.off(() => DashboardPage());
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //         "Sign Up",
              //         style: TextStyle(color: Colors.white, fontSize: 12.0.sp),
              //       ),
              //     ),
              //     style: ButtonStyle(
              //         backgroundColor:
              //             MaterialStateProperty.all(Color(0xff465bd8))),
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Text("Already have an account? Sign In"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget wTextField(String hint, IconData icon) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xfff3f3f3), borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(bottom: 20),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(icon),
              hintText: hint),
          onChanged: (text) {
            // setState(() {
            //   UserName = text;
            //   //you can access nameController in its scope to get
            //   // the value of text entered as shown below
            //   //UserName = nameController.text;
            // });
          },
        ));
  }
}
