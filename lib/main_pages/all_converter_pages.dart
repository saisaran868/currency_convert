import 'package:currency_convert/volume_pages/volume_of_sphere_calculator.dart';
import 'package:flutter/material.dart';

import 'converter_types.dart';
import '../currency_page/currency_converter_materialpage.dart';

class AllConverterPages extends StatefulWidget {
  const AllConverterPages({super.key});

  @override
  State<AllConverterPages> createState() => _AllConverterPagesState();
}

class _AllConverterPagesState extends State<AllConverterPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title:  const Text(
        'Converter',
        style: TextStyle(color: Colors.white),
    ),
    ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder : (context) => const  CurrencyConverterMaterialPage()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.currency_exchange,
                  converterName: " Currency  \n ",
                ),
              ),

              GestureDetector(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.document_scanner_outlined,
                  converterName: "Length",
                ),
              ),

              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.balance,
                  converterName: "    Mass   ",
                ),
              ),

              GestureDetector(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder : (context) => const  CurrencyConverterMaterialPage()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.square,
                  converterName: "  Area  ",
                ),
              ),

              GestureDetector(
                onTap: () {
                  //  Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.timer_outlined,
                  converterName: " Time ",
                ),
              ),

            ],
          ),

          Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              GestureDetector(
                onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.money_outlined,
                  converterName: "  Finance  \n ",
                ),
              ),

              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder : (context) => const  CurrencyConverterMaterialPage()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.display_settings,
                  converterName: " Data ",
                ),
              ),

              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.date_range,
                  converterName: "   Date    ",
                ),
              ),

              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.discount_rounded,
                  converterName: "Discount",
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.check_box_outline_blank_sharp,
                  converterName: "Volume",
                ),
              ),

            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.repeat_one,
                  converterName: " Numerical \n   system",
                ),
              ),

              GestureDetector(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.speed,
                  converterName: "Speed ",
                ),
              ),

              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder : (context) => const  CurrencyConverterMaterialPage()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.thermostat,
                  converterName: "Temperature",
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.monitor_weight_outlined,
                  converterName: "  BMI   ",
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder : (context) => const  VolumeOfSphereCalculator()));
                },
                child:const  ConverterTypes(
                  icon1: Icons.book_outlined,
                  converterName: "  GST ",
                ),
              ),
            ],

          ),
        ],
      ),
    );
  }
}
