import 'package:flutter/material.dart';
class ConverterTypes extends StatelessWidget {
  final IconData icon1;
  final String converterName;
  const ConverterTypes({super.key,
    required this.icon1,
    required this.converterName,
  });

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      child:  Padding(
        padding: const  EdgeInsets.all(8.0),
        child:  Column(
          children: [

            Icon(icon1, size: 25,color: Colors.white,
            ),
            const SizedBox(height: 8,
            ),

            Text(converterName ,style: const TextStyle(
              fontSize: 17,
              color:Colors.white,
              fontWeight: FontWeight.w500,
            ),
            ),

          ],
        ),
      ),
    );
  }
}
