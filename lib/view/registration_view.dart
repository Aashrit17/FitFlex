import 'package:flutter/material.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 40),
                          const Text(
                            "Create an Account",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Register to get started",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          _buildCustomTextField(
                            controller: nameController,
                            label: "Full Name",
                            icon: Icons.person,
                            obscureText: false,
                          ),
                          const SizedBox(height: 20),
                          _buildCustomTextField(
                            controller: emailController,
                            label: "Email",
                            icon: Icons.email,
                            obscureText: false,
                          ),
                          const SizedBox(height: 20),
                          _buildCustomTextField(
                            controller: passwordController,
                            label: "Password",
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          _buildCustomTextField(
                            controller: confirmPasswordController,
                            label: "Confirm Password",
                            icon: Icons.lock_outline,
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          _buildCustomTextField(
                            controller: phoneController,
                            label: "Phone Number",
                            icon: Icons.phone,
                            obscureText: false,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Checkbox(
                                value: termsAccepted,
                                onChanged: (bool? value) {
                                  setState(() {
                                    termsAccepted = value!;
                                  });
                                },
                                activeColor: Colors.purple,
                              ),
                              const Expanded(
                                child: Text(
                                  "I agree to the Terms and Conditions",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 221, 141, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              elevation: 0,
                            ),
                            onPressed: () {
                              String name = nameController.text;
                              String email = emailController.text;
                              String password = passwordController.text;
                              String confirmPassword =
                                  confirmPasswordController.text;
                              String phone = phoneController.text;

                              if (name.isEmpty ||
                                  email.isEmpty ||
                                  password.isEmpty ||
                                  confirmPassword.isEmpty ||
                                  phone.isEmpty ||
                                  !termsAccepted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Please fill in all fields and accept terms."),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else if (password != confirmPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Passwords do not match."),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Registration successful!"),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              "Register",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Back to Login",
                                style: TextStyle(color: Colors.purple),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool obscureText,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[500]),
        prefixIcon: Icon(icon, color: Colors.purple[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey[600]!),
        ),
        filled: true,
        fillColor: Colors.black,
      ),
    );
  }
}
