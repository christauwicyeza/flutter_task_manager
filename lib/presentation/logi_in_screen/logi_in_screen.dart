import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/core/app_export.dart';
import 'package:flutter_task_manager/widgets/custom_elevated_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogiInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcome to Task Manager!",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                // Implement your logic for email validation if needed
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: true,
              onChanged: (value) {
                // Implement your logic for password validation if needed
              },
            ),
            SizedBox(height: 20.0),
            CustomElevatedButton(
              text: "Log in",
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;

                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pushNamed(context, AppRoutes.dashboardScreen);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("No user found for that email."),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else if (e.code == 'wrong-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Wrong password provided for that user."),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Error logging in. Please try again."),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                }
              },
            ),
            SizedBox(height: 20.0),
            Stack(
              alignment: Alignment.center,
              children: [
                CustomElevatedButton(
                  text: "Log in with Google",
                  onPressed: () async {
                    try {
                      final GoogleSignInAccount? googleUser = await GoogleSignIn(
                              clientId:
                                  "137321339537-2ittfgrumuvj18hk16ahvcio2fgh4rmh.apps.googleusercontent.com")
                          .signIn();
                      if (googleUser != null) {
                        final GoogleSignInAuthentication googleAuth =
                            await googleUser.authentication;
                        final AuthCredential credential =
                            GoogleAuthProvider.credential(
                          accessToken: googleAuth.accessToken,
                          idToken: googleAuth.idToken,
                        );
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        Navigator.pushNamed(context, AppRoutes.dashboardScreen);
                      }
                    } catch (e) {
                      print("Error logging in with Google: $e");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Error logging in with Google. Please try again."),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                ),
                // Add CircularProgressIndicator or similar widget here to show loading animation
              ],
            ),
          ],
        ),
      ),
    );
  }
}
