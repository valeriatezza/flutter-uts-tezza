import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? errorPassword;

  void handleLogin() {
    setState(() {
      errorPassword = null;
    });

    if (_formKey.currentState!.validate()) {
      if (usernameController.text.trim() == "valeria@gmail.com" &&
          passwordController.text.trim() == "12345678") {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        setState(() {
          errorPassword = "Email atau password salah";
        });
      }
    }
  }

  InputDecoration buildInput(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6C63FF), // 
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // ✅ LOGO
                  Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image, size: 80);
                    },
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ✅ EMAIL
                  TextFormField(
                    controller: usernameController,
                    decoration: buildInput("Email", Icons.person),
                    validator: (value) =>
                        value!.isEmpty ? "Email wajib diisi" : null,
                  ),

                  const SizedBox(height: 10),

                  // ✅ PASSWORD
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: buildInput("Password", Icons.lock),
                    validator: (value) =>
                        value!.isEmpty ? "Password wajib diisi" : null,
                  ),

                  if (errorPassword != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        errorPassword!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  // ✅ BUTTON LOGIN
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ✅ LUPA PASSWORD
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot');
                    },
                    child: const Text("Lupa Password?"),
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
