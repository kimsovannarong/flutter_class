import 'package:flutter/material.dart';
import 'package:flutter_class/W8-S2/EX-4/Device.dart';
import 'dart:math';
class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  Devicetype type =Devicetype.euro;
  final amountInDollars =TextEditingController();
  // amountIndollars from textfield but it is string
  // amountIndollar is from the converting of amountIndollars to double
  // variable to store the final calculated result
  late double total=0;
  // function conversion which convert based on the device selected ex_riels..
  double conversion(amountIndollar) {
    switch (type) {
      case Devicetype.euro:
        return amountIndollar * 0.95;// dollar to euro
      case Devicetype.riels:
        return amountIndollar * 4000;// dollar to riel
      case Devicetype.dong:
        return amountIndollar * 25000; // dollar to dong
    }
  }
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),

          TextField(
              controller: amountInDollars,
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)
          ),
          const SizedBox(height: 30),
          DropdownButton<Devicetype>(
            value: type,
            onChanged: (selectedDevice) {
              if (selectedDevice != null) {
                setState(() {
                  type = selectedDevice; // to select the Devicetype from dropdown
                  double amountIndollar = double.tryParse(amountInDollars.text) ?? 0.0; // convert to double
                  total = conversion(amountIndollar); // Update total based on new type
                });
              }
            },
            items: Devicetype.values.map((Devicetype category) {
              return DropdownMenuItem<Devicetype>(
                value: category,
                child: Text(
                  category.name.toUpperCase(), // Display enum name
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child:  Text(total.toString())), // total is double type
        ],
      )),
    );
  }
}
