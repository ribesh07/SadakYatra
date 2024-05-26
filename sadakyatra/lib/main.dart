import 'package:flutter/material.dart';
import 'package:sadakyatra/pages/login-page.dart';
import 'package:sadakyatra/setups.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SadakYatra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SadakYatra'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 125, 78, 201),
        title: Container(
          alignment: Alignment.center,
          child: Text(widget.title,)),
      ),
      body:Center(
         child: Column(
           children: [
             const Padding(

               padding: EdgeInsets.only(top: 200),
               child: Text(
                'MainPage',style: textStyle,),
             ),
              const SizedBox(height: 200,),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login_page()));
              },
               child: const Text("Login User",style: textStyle,))
              ,
           ],
         )
         ,
      
         
      )
       );
  }
}
