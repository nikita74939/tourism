import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/constants.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _obscurePassword = true.obs;
  final _obscureConfirmPassword = true.obs;

  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    _authController = Get.find<AuthController>();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sign up to get started',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Full Name',
                  prefixIcon: Icons.person_outlined,
                  validator: Validators.validateName,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 16),
                Obx(() => CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outlined,
                      obscureText: _obscurePassword.value,
                      validator: Validators.validatePassword,
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () =>
                            _obscurePassword.value = !_obscurePassword.value,
                      ),
                    )),
                const SizedBox(height: 16),
                Obx(() => CustomTextField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock_outlined,
                      obscureText: _obscureConfirmPassword.value,
                      validator: (value) => Validators.validateConfirmPassword(
                          value, _passwordController.text),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureConfirmPassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () => _obscureConfirmPassword.value =
                            !_obscureConfirmPassword.value,
                      ),
                    )),
                const SizedBox(height: 24),
                Obx(() => CustomButton(
                      text: 'Register',
                      onPressed: _register,
                      isLoading: _authController.isLoading.value,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      _authController.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }
}
