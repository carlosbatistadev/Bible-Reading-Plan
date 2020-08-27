import 'package:flutter/material.dart';



Widget tileWidget({
  BuildContext context, 
  bool selected, 
  IconData icon, 
  String title, 
  Function onTap

}) {
  return Container(
    decoration: BoxDecoration(
      color: selected ? Theme.of(context).accentColor.withOpacity(0.03)
      : Colors.transparent,

      gradient: LinearGradient(
        colors: <Color>[
          Colors.white,
          Colors.red[50],
          Colors.red[100],
          Colors.red[200],
          Theme.of(context).accentColor,
        ],
      ),
    ),
    child: ListTile(
      leading: Icon(
        icon,
        color: selected ? Theme.of(context).accentColor : Colors.grey,
      ),
      trailing: Icon(
        Icons.arrow_forward,
        color: selected ? Theme.of(context).accentColor : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          color: selected ? Theme.of(context).accentColor : Colors.grey,
        ),
      ),
      onTap: onTap,
    )
  );
}