import 'package:bai_kiem_tra_app/card_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
                builder: (context) => const MyHomePage(
                      title: "On Generated Route",
                    ),
                settings: settings);
          case "/cardlist":
            return MaterialPageRoute(
                builder: (context) => CardList(
                      args: settings.arguments as ScreenArgument?,
                    ));
        }
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required String title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  String? userNameTextError;
  String? passWordTextError;
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Đăng nhập",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26, bottom: 30),
                child: Image.asset(
                  'assets/images/techmaster_black.png',
                ),
              ),
              TextField(
                controller: userName,
                decoration: InputDecoration(
                    labelText: 'Username', errorText: userNameTextError),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passWord,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: passWordTextError,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    child: Icon(isShowPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                obscureText: !isShowPassword,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (userName.text.isEmpty ||
                          userName.text.contains(" ")) {
                        setState(() {
                          userNameTextError =
                              "Username không được rỗng hoặc chứa dấu cách";
                        });
                      }
                      if (userName.text == 'phamvanquang' &&
                          passWord.text == "123456") {
                        Navigator.pushNamed(context, "/cardlist",
                            arguments: ScreenArgument(
                              userName: userName.text,
                              passWord: passWord.text,
                            ));
                      }
                    },
                    child: const Text(
                      "Đăng nhập",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
