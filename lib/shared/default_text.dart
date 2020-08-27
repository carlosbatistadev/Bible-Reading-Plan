import 'package:flutter/material.dart';


Padding defaultText({String primaryText, String secundaryText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Text.rich(
      TextSpan(
        text: primaryText, 
        children: <TextSpan>[
          TextSpan(
            text: secundaryText, 
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    )
  );
}