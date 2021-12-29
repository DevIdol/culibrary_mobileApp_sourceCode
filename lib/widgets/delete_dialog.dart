import 'package:culibrary/api/text_api.dart';
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
              fontFamily: fontStyle),
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
              fontFamily: fontStyle),
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
          fontFamily: fontStyle),
    ),
    content: Text(
      content,
      style: TextStyle(fontSize: 12, fontFamily: fontStyle),
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
