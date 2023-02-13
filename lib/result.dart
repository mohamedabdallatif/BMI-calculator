import 'package:flutter/material.dart';
class Result extends StatelessWidget {

  final bool isMale;

  final int result;

  final int age;
  const Result(this.age,this.isMale,this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Result'),
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gender:${isMale?'Male':'Female'}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Text('Result:$result',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Text('Age:$age',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}