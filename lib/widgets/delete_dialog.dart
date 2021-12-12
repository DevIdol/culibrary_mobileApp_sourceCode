import 'package:flutter/material.dart';
import 'package:get/get.dart';

deleteDialog(context, dao, _themeMode, _iconColor, title, content) {
  Widget cancelButton = InkWell(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 10, bottom: 10),
        child: Text(
          'No',
          style: TextStyle(
            color: _iconColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));

  Widget okButton = InkWell(
      onTap: () {
        dao();
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 10, bottom: 10),
        child: Text(
          'Yes',
          style: TextStyle(
            color: _iconColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));

  AlertDialog alert = AlertDialog(
    elevation: 100,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: _iconColor, width: 2.0),
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: _themeMode,
    title: Text(
      title,
      style: TextStyle(
        color: _iconColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      content,
      style: const TextStyle(fontSize: 12),
    ),
    actions: [
      cancelButton,
      okButton,
    ],
  );

  showDialog(
      context: context,
      builder: (context) {
        return alert;
      });
}
