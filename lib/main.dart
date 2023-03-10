import 'package:flutter/material.dart';
import 'package:anti_cheating/frontend/form_content.dart';
import 'package:anti_cheating/frontend/navigation.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBB0oA0oeu9DSkZjXiTrFq5YpEANWBGmqQ",
        appId: "1:559835403233:web:76eb14a35fffe4ff0df8a0",
        messagingSenderId: "559835403233",
        projectId: "anti-cheating-chrome-ext"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Form(),
    );
  }
}

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0x607D8BFF),
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Header(),
              const SizedBox(
                height: 50,
              ),
              FormContent()
            ],
          ),
        ),
      ),
    );
  }
}
