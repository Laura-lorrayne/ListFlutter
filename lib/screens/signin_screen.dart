import 'package:coffe_shop/Routes/routes_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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

  Future<bool> _login() async {
    String email = _emailController.text;
    String senha = _senhaController.text;
    setState(() {
      _isLoading = true;
    });
    try {
      final singIn = _auth.signInWithEmailAndPassword;
      UserCredential userCredential =
          await singIn(email: email, password: senha);
      User? user = userCredential.user;
      showSnackBar('Usuario Logado: ${user?.email}');
    } catch (e) {
      showSnackBar('Erro ao fazer login: $e');
    }
    setState(() {
      _isLoading = false;
    });
    return _isLoading;
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
                      child: const Text('Login'),
                      onPressed: () {
                        _login().then((isAuth) => {
                              if (isAuth)
                                {
                                  Navigator.of(context)
                                      .pushNamed(RoutePaths.PRODUCT_SCREEN)
                                }
                            });
                      },
                    ),
                  ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RoutePaths.SIGNUP_SCREEN);
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Cadastar-se',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
