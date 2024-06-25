import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String _usuario = 'admin';
  final String _senha = 'admin';

  String? _textoErroUsuario;

  final TextEditingController _controlaCampoUsuario = TextEditingController();
  final TextEditingController _controlaCampoSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: TextField(
                controller: _controlaCampoUsuario,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'usuário',
                  errorText: _textoErroUsuario,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: TextField(
                // TODO(maurojh): 4. esconder a senha digitada
                controller: _controlaCampoSenha,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'senha',
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Entrar'),
            ),
            ElevatedButton(
              onPressed: onClear,
              child: const Text('Limpar'),
            ),
          ]),
        ],
      ),
    );
  }

  void onPressed() {
    // verificar usuario
    if (_usuario == _controlaCampoUsuario.text) {
      // verificar senha
      if (_senha == _controlaCampoSenha.text) {
        // Ir para home
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        onClear();
      }
    } else {
      // Usuário errou nome
      setState(() {
        _textoErroUsuario = 'Usuário não encontrado!';
      });
      onClear();
    }
  }

  void onClear() {
    _controlaCampoSenha.text = '';
    _controlaCampoUsuario.text = '';
  }
  // TODO(maurojh): 3. limpar
}
