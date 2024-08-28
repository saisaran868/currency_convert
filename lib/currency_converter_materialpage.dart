import 'package:flutter/material.dart';

class CurrencyConverterMaterialpage extends StatefulWidget{
  const CurrencyConverterMaterialpage({super.key});

  @override
  State<CurrencyConverterMaterialpage> 
  createState() => _CurrencyConverterMaterialpageState();

}

class _CurrencyConverterMaterialpageState 
extends State<CurrencyConverterMaterialpage>{
double result = 0;
final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(Object context) {    
    final border = OutlineInputBorder(
                  borderSide:const BorderSide(
                    color: Colors.black,
                    width: 3.0,
                    style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(5));

    return    Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        title: const Text('Currency Converter',style:TextStyle(
          color: Colors.white
        ),
        ),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("INR: ${ result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0) }",
                 
                 style: const TextStyle(
                 fontSize: 35,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
                  ),
                  ),
               ), 
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter a number in USD',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  prefixIcon: const Icon( Icons.attach_money),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.black,
                  focusedBorder: border,
                  enabledBorder: border,
                  ),
                  keyboardType:const TextInputType.numberWithOptions(
                    decimal: true,
                  ) ,
                  ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed: (){
                setState(() {
                  result = double.parse(textEditingController.text) * 83.94;
                });
              },
              style: TextButton.styleFrom(
                
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize:const Size (double.infinity, 50),
                shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                ),
                
               child:const Text("Convert" ),
               ),
            ),
             
            ],
          ),
        ) ,  
      );
  }

}