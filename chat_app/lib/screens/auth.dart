import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

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
  File? _selectedImage;
  var _isAuthenticationg = false;
  var _enteredUsername = '';

  void _submit() async {
    final _isValid = _fomKey.currentState!.validate(); // Validate the form

    if (!_isValid || !_isLogin && _selectedImage == null) {
      // TODO: Show an error message
      return;
    }

    _fomKey.currentState!.save();

    try {
      setState(() {
        _isAuthenticationg = true;
      });
      if (_isLogin) {
        // Log users in
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        // print(userCredentials);
      } else {
        // Signup users
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        // print(userCredentials);

        // Store the picked image on firebase storage
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userCredentials.user!.uid}.jpg');

        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();
        print(imageUrl);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
          'username': _enteredUsername,
          'email': _enteredEmail,
          'image_url': imageUrl,
        });
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {}
      // Error handling
      ScaffoldMessenger.of(context).clearSnackBars(); // Clear exesting Snacks
      ScaffoldMessenger.of(context).showSnackBar(
        // Show error message
        SnackBar(
          content: Text(error.message ?? 'Authenticaiton failed.'),
        ),
      );
      setState(() {
        _isAuthenticationg = false;
      });
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
                          if (!_isLogin)
                            UserImagePicker(onPickImage: (pickedIamge) {
                              _selectedImage = pickedIamge;
                            }),
                          if (!_isLogin)
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Username'),
                              enableSuggestions: false,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.trim().length < 4) {
                                  return 'Please entre at least 4 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredUsername = value!;
                              },
                            ),
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
                          if (_isAuthenticationg)
                            const CircularProgressIndicator(),
                          if (!_isAuthenticationg)
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                              child: Text(_isLogin ? 'Login' : 'Sigup'),
                            ),
                          if (!_isAuthenticationg)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(_isLogin
                                  ? 'Create an account'
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
