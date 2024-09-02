import 'package:flutter/material.dart';

class VolumeOfSphereCalculator extends StatefulWidget {
  const VolumeOfSphereCalculator({super.key});

  @override
  State<VolumeOfSphereCalculator> createState() => _VolumeOfSphereCalculatorState();
}

class _VolumeOfSphereCalculatorState extends State<VolumeOfSphereCalculator> {
  double volume = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 3.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme:const  IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Volume of Sphere',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Volume: ${volume != 0 ? volume.toStringAsFixed(2) : ''}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
                decoration: InputDecoration(
                  hintText: "Enter the radius",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  prefixIcon: const Icon(Icons.numbers, color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    try {
                      final value = double.parse(textEditingController.text);
                      if (value <= 0) {
                        volume = 0; // Handle non-positive radius
                      } else {
                        volume = 4 / 3 * 3.141592653589793 * (value * value * value);
                      }
                    } catch (e) {
                      volume = 0; // Handle parse errors
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                child:   const Text("Calculate Volume",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
