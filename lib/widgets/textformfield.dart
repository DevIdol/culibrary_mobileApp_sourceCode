import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../color_themes.dart';

dateTimeFormField(double width, _iconColor, themeNotifier, _themeMode,
    _fontColor, labelText, _controller, _format, validate) {
  return SizedBox(
    width: width,
    child: DateTimeField(
      controller: _controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validate,
      format: _format,
      cursorColor: _iconColor,
      onShowPicker: (context, currentValue) async {
        final time = await showTimePicker(
            builder: (context, child) {
              return Theme(
                  data: themeNotifier.isDark
                      ? ThemeData.dark().copyWith(
                          colorScheme: ColorScheme.dark(
                            primary: _iconColor,
                            onPrimary: _themeMode,
                            surface: _themeMode,
                            onSurface: _fontColor,
                          ),
                        )
                      : ThemeData.light().copyWith(
                          colorScheme: ColorScheme.light(
                            primary: _iconColor,
                            onPrimary: _themeMode,
                            surface: _themeMode,
                            onSurface: _fontColor,
                          ),
                        ),
                  child: child!);
            },
            context: context,
            initialTime:
                TimeOfDay.fromDateTime(currentValue ?? DateTime.now()));
        return DateTimeField.convert(time);
      },
      style: TextStyle(
          color: _fontColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lora'),
      decoration: InputDecoration(
        errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lora'),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: secondColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
            color: _iconColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lora'),
      ),
    ),
  );
}

dateFormField(double width, _iconColor, _themeMode, themeNotifier, _fontColor,
    labelText, _controller, _format, validate) {
  return SizedBox(
    width: width,
    child: DateTimeField(
      controller: _controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validate,
      format: _format,
      cursorColor: _iconColor,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            builder: (context, child) {
              return Theme(
                  data: themeNotifier.isDark
                      ? ThemeData.dark().copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: darkModeIconColor,
                            onPrimary: darkMode,
                            surface: darkMode,
                            onSurface: darkFontColor,
                          ),
                        )
                      : ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: lightModeIconColor,
                            onPrimary: lightMode,
                            surface: lightMode,
                            onSurface: lightFontColor,
                          ),
                        ),
                  child: child!);
            },
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(5000));
      },
      style: TextStyle(
          color: _fontColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lora'),
      decoration: InputDecoration(
          errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lora'),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: secondColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
              color: _iconColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lora')),
    ),
  );
}

textFormField(
    _iconColor, _fontColor, labelText, _controller, maxLength, validate) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: TextFormField(
      controller: _controller,
      textCapitalization: TextCapitalization.words,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validate,
      cursorColor: _iconColor,
      maxLines: null,
      showCursor: true,
      style: TextStyle(
          color: _fontColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lora'),
      decoration: InputDecoration(
          errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lora'),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: secondColor),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: secondColor)),
          labelText: labelText,
          labelStyle: TextStyle(
              color: _iconColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lora')),
    ),
  );
}
