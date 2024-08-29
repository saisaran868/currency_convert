import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {
  final TextEditingController textEditingControllerUSD = TextEditingController();
  final TextEditingController textEditingControllerINR = TextEditingController();
 final exchangeRate = 83.94;
  void _updateFromUSD(String value) {
    textEditingControllerINR.removeListener(() {});

    double input = double.tryParse(value) ?? 0;
    double result = input * exchangeRate;

    textEditingControllerINR.text = result.toStringAsFixed(2);

    textEditingControllerINR.addListener(() {});
  }

  void _updateFromINR(String value) {
    textEditingControllerUSD.removeListener(() {});

    double input = double.tryParse(value) ?? 0;
    double result = input / exchangeRate;

    textEditingControllerUSD.text = result.toStringAsFixed(2);

    textEditingControllerUSD.addListener(() {});
  }

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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "USD",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.compare_arrows,
                  size: 35,
                ),
                Text(
                  "IND",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingControllerUSD,
                onChanged: _updateFromUSD,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(

                  helperText:'USD',
                  helperStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: 'Enter a number in USD',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  prefixIcon: const Icon(Icons.attach_money),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingControllerINR,
                onChanged: _updateFromINR,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  helperText:'IND',
                  helperStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: 'Enter a number in INR',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  prefixIcon: const Icon(Icons.money),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
