import 'package:flutter/material.dart';

// Authentication screen widget
class AuthSceen extends StatefulWidget {
  const AuthSceen({super.key});

  @override
  State<AuthSceen> createState() => _AuthSceenState();
}

class _AuthSceenState extends State<AuthSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          //Ensure the content is scrollable
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              // The authentication form
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        // Form inputs
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Email Adress'),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false, // Turn off autocorrection
                            textCapitalization: TextCapitalization.none,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText:
                                true, // Hide the characters as being entered
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
