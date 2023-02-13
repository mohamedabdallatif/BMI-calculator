import 'dart:math';

import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
var val=18; 
var weight=50;
var color= Colors.grey[400];
var isMale=true;
double height=120.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: 
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
               children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale=true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale? Colors.blue:color
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                            Image(image: AssetImage('assets/images/ma.png',),height: 60,
                            width: 90,),
                            SizedBox(height: 15,),
                            Text('MALE',style: TextStyle(fontSize: 25),),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale=false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale? color:Colors.blue
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const [
                           Image(image: AssetImage('assets/images/fe.png',),height: 60,
                            width: 90,),
                           SizedBox(height: 15,),
                           Text('FEMALE',style: TextStyle(fontSize: 25),),
                        ],
                      ),
                    ),
                  ),
                )
               
               ],
              ),
            ),
          ),
          Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[400]
            ),
            child: Column(
              children: [
                 const Text('HEIGHT',style: TextStyle(fontSize: 25),),
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text('${height.round()}',style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                      const SizedBox(width: 10,),
                     const Text('CM',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ],
                 ),
                 Slider(value: height,
                 min: 80.0,
                 max: 220.0,
                  onChanged:(value){
                    setState(() {
                      height=value;
                    });
                  } )
              ],
            ),
          ),
        )
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[400]
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text('AGE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Text('$val',style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            val-=1;
                          });
                        },
                        heroTag: 'age-'
                        ,mini: true,
                        child: const Icon(Icons.remove),),
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            val+=1;
                          });
                        }
                       , heroTag: 'age+'
                        ,mini: true,
                        child: const Icon(Icons.add),)
                       ],
                       )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[400]
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text('WEIGHT',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Text('$weight',style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            weight-=1;
                          });
                        },
                        heroTag: 'weight-'
                        ,mini: true,
                        child: const Icon(Icons.remove),),
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            weight+=1;
                          });
                        },
                        heroTag: 'weight+'
                        ,mini: true,
                        child: const Icon(Icons.add),)
                       ],
                       )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
      Container(
        width: double.infinity,
        color: Colors.red,
        child: MaterialButton(
          onPressed: (){
            setState(() {
              double result=weight/pow(height/100, 2);
              print(result);
              print(weight);
              print(height);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  Result(val,isMale,result.round()),
              ));
            });
          },
          height: 50,
          child: const Text('CALCULATE',style: TextStyle(color: Colors.white),),
          ),
      )
        ],
      ),
      
    );
  }
}