
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 69,
      child: OutlinedButton(
          style: ButtonStyle(
              side: const WidgetStatePropertyAll(
                  BorderSide(
                      color: Colors.green)),
              shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              10))),
              backgroundColor:
                  const WidgetStatePropertyAll(
                      Colors.white)),
          onPressed: () {},
          child: const Text(
            "Add",
            style: TextStyle(
                color: Colors.green,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
