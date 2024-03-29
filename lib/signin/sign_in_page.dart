import 'package:flutter/material.dart';
import '../firebase/auth/auth_service.dart ';

class SignInPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Example: Sign up with email and password
                await _authService.signUpWithEmailAndPassword(
                  'example@email.com',
                  'password123',
                );
              },
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Example: Sign in with email and password
                await _authService.signInWithEmailAndPassword(
                  'example@email.com',
                  'password123',
                );
              },
              child: const Text('Sign In'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Example: Sign out
                await _authService.signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
