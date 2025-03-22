import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void _cancelar() {
    Navigator.popAndPushNamed(context, '/');
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img_fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Cadastro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nomeController,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Nome'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Informe seu nome' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value != null && value.contains('@') ? null : 'E-mail inválido',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _cpfController,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('CPF'),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value != null && value.length == 11 ? null : 'CPF inválido',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _senhaController,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Senha'),
                    obscureText: true,
                    validator: (value) =>
                        value != null && value.length >= 6 ? null : 'Senha fraca',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _confirmarSenhaController,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Confirmar Senha'),
                    obscureText: true,
                    validator: (value) =>
                        value == _senhaController.text ? null : 'Senhas não coincidem',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _cancelar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAFAE24), // mesmo amarelo
                          fixedSize: const Size(140, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF031C5F), // azul escuro
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        onPressed: _cadastrar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: const Size(140, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
