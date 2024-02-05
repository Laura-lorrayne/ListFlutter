// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
    ));
  }

  Future<bool> _register() async {
    String email = _emailController.text;
    String senha = _senhaController.text;
    setState(() {
      _isLoading = true;
    });
    try {
      final singUp = _auth.createUserWithEmailAndPassword;
      UserCredential userCredential =
          await singUp(email: email, password: senha);
      User? user = userCredential.user;
      showSnackBar('Usuario Cadastrado: ${user?.email}');
      return true;
    } catch (e) {
      showSnackBar('Erro ao realizar cadastro: $e');
    }
    setState(() {
      _isLoading = false;
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _senhaController,
              decoration: const InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 16.0,
            ),
            _isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Cadastar'),
                      onPressed: () {
                        _register().then((isCreated) => {
                              if (isCreated) {Navigator.of(context).pop()}
                            });
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
