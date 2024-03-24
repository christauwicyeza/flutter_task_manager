import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/core/app_export.dart';
import 'package:flutter_task_manager/widgets/custom_elevated_button.dart';
import 'package:flutter_task_manager/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Create Account"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            TextFormField(
              key: const ValueKey("emailTextFieldKey"),
              controller: emailController,
              decoration: const InputDecoration( 
                hintText: "Email",
              prefix: Icon(Icons.email),),
             
            ),
            TextFormField(
              key: const ValueKey("usernameTextFieldKey"),
              controller: userNameController,
              decoration: const InputDecoration( 
                hintText: "Username",
              prefix:  Icon(Icons.person),),
             
            ),

            const SizedBox(height: 20.0),
            TextFormField(
              key: const ValueKey("passwordTextFieldKey"),
              controller: passwordController,
              decoration: const InputDecoration( 
                hintText: "Password",
              prefix:  Icon(Icons.lock),),
             
            ),
            TextFormField(
              key: const ValueKey("confirmPasswordTextFieldKey"),
              controller: confirmPasswordController,
              decoration: const InputDecoration( 
                hintText: "confirmPassword",
              prefix:  Icon(Icons.lock),),
             
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              child: Text("Sign Up"),
              onPressed: () {
                signUp(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void signUp(BuildContext context) async {
    String email = emailController.text.trim();
    String userName = userNameController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || userName.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all fields."),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match."),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateDisplayName(userName);

      Navigator.pushNamed(context, AppRoutes.logiInScreen);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Error signing up. Please try again."),
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error signing up. Please try again."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
