import 'package:flutter/material.dart';
import 'package:flutter_1/shared/components/component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  defaultInput(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    text: "Email Adress",
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!value.contains('@')) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    prefix: Icon(Icons.email),
                  ),

                  SizedBox(height: 15.0),
                  defaultInput(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    text: "Password",
                    validate: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'password cannot be less than six char';
                      }
                      return null;
                    },
                    prefix: Icon(Icons.lock),
                    // suffix: Icon(Icons.visibility_off_outlined),
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        isPassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    isPassword: isPassword,
                  ),
                  SizedBox(height: 15.0),
                  defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController);
                      }
                    },
                    buttonText: 'Login',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don\'t have an account ?"),
                      TextButton(onPressed: () {}, child: Text('Register')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
