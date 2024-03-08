import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_one/controller/login_controller.dart';

class PageInput extends StatefulWidget {
  const PageInput({super.key});

  @override
  State<PageInput> createState() => _PageInputState();
}

class _PageInputState extends State<PageInput> {
  final globalKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: usernameController,
                onChanged: (value) {
                  globalKey.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username cant be empty !';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Username',
                  label: const Text('Login Form'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: isObsecure,
                onChanged: (value) {
                  globalKey.currentState?.validate();
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Password',
                  label: const Text('Password Form'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => setState(() {
                      isObsecure = !isObsecure;
                    }),
                    child: Icon(isObsecure
                        ? Icons.visibility_off
                        : Icons.remove_red_eye),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  if (globalKey.currentState!.validate() == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please input username or password'),
                      ),
                    );
                  }
                  loginProv.login(
                    username: usernameController.text,
                    password: passwordController.text,
                  );
                  Navigator.pushNamed(context, '/homepage');
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
