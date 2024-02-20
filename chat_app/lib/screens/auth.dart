import 'package:flutter/material.dart';

// Authentication screen widget
class AuthSceen extends StatefulWidget {
  const AuthSceen({super.key});

  @override
  State<AuthSceen> createState() => _AuthSceenState();
}

class _AuthSceenState extends State<AuthSceen> {
  final _fomKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit() {
    final _isValid = _fomKey.currentState!.validate(); // Validate the form

    if (_isValid) {
      _fomKey.currentState!.save();
      print(_enteredEmail);
      print(_enteredPassword);
    }
  }

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
                      key: _fomKey,
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
                            // Validate the email adress
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter a valid email adress.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredEmail = value!;
                            },
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText:
                                true, // Hide the characters as being entered
                            // Validate the password
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'Password must be at leat 6 characters long.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Text(_isLogin ? 'Login' : 'Sigup'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin
                                ? 'Create anaccount'
                                : 'Already have an account? Login.'),
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