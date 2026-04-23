import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text('data'));
  }
}
