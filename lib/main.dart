import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyLoginPage(title: 'Login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});
  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordontroller = TextEditingController();
  String? _errorMessage;

  void _login() {
    String username = usernameController.text;
    String password = usernameController.text;

      if(username.isEmpty || password.isEmpty){
        setState(() {
          _errorMessage = "Campo vázio";
        });
      }
      else{
        setState(() {
          _errorMessage = null;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeTheme(title: "Change theme")));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
       Padding(padding: const EdgeInsets.all(16),
       child:  Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: "usuário",
              border: const OutlineInputBorder(),
              errorText: _errorMessage != null && usernameController.text.isEmpty ? "Campo obrigatório" : null,
            ),
          ),
          const SizedBox(height: 16,),
          TextField(
            controller: passwordontroller,
            decoration: InputDecoration(
              labelText: "senha",
              border: const OutlineInputBorder(),
              errorText: _errorMessage != null && passwordontroller.text.isEmpty ? "Campo obrigatório" : null,
            ),
          ),
          const SizedBox(height: 16,),
          ElevatedButton(onPressed: _login, child: const Text("Entrar")),
        ],
      ),
       ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _login,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



class ChangeTheme extends StatefulWidget{
  const ChangeTheme({super.key, required this.title});

  final String title;


  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}


class _ChangeThemeState extends State<ChangeTheme>{
  Color background = Colors.white;

  void changeColor(){
    setState(() {
      // background = Colors.black45;
        background = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar:  AppBar(title: const Text('tela home')),
      body: Center(
          child: ElevatedButton(
              onPressed: changeColor, child: const Text("Mudar cor")),
      )
    );
  }
}