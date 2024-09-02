import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {
  final TextEditingController textEditingControllerFrom = TextEditingController();
  final TextEditingController textEditingControllerTo = TextEditingController();

  // List of currencies
  final List<String> currencies = ['USD', 'INR', 'EUR', 'GBP']; // Add more currencies as needed
  String selectedFromCurrency = 'USD';
  String selectedToCurrency = 'INR';

  // Example exchange rates, ideally should be fetched from an API
  final Map<String, double> exchangeRates = {
    'USD_INR': 83.94,
    'INR_USD': 1 / 83.94,
    'USD_EUR': 0.92, // Example rates
    'EUR_USD': 1 / 0.92,
    'USD_GBP': 0.77,
    'GBP_USD': 1 / 0.77,
    'EUR_INR': 1 / 0.012, // Example rates
    'INR_EUR': 0.012,
    'GBP_EUR': 1 / 1.14, // Example rates
    'EUR_GBP': 1.14,
    'GBP_INR':110.47,
    'INR_GBP':1/110.47,
    // Add more exchange rates as needed
  };

  void _updateConversion(String value) {
    textEditingControllerTo.removeListener(() {});

    double input = double.tryParse(value) ?? 0;
    double rate = exchangeRates['${selectedFromCurrency}_$selectedToCurrency'] ?? 1;
    double result = input * rate;

    textEditingControllerTo.text = result.toStringAsFixed(2);

    textEditingControllerTo.addListener(() {});
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
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
            // Dropdown for selecting currencies
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                 dropdownColor: Colors.black,

                  value: selectedFromCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFromCurrency = newValue!;
                      _updateConversion(textEditingControllerFrom.text);
                    });
                  },
                  items: currencies.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.white,
                        backgroundColor: Colors.black),
                      ),
                    );
                  }).toList(),
                ),


                const Icon(
                  Icons.compare_arrows,
                  size: 35,
                  color: Colors.white,
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.black,
                  value: selectedToCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedToCurrency = newValue!;
                      _updateConversion(textEditingControllerFrom.text);
                    });
                  },
                  items: currencies.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingControllerFrom,
                onChanged: _updateConversion,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter amount in $selectedFromCurrency',
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
                controller: textEditingControllerTo,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Converted amount in $selectedToCurrency',
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
                readOnly: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
