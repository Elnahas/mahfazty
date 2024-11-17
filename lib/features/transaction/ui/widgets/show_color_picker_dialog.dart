import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<Color?> showColorPickerDialog(BuildContext context) {
  Color categoryColor = Colors.white;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColorPicker(
                pickerColor: categoryColor,
                onColorChanged: (value) {

                  
                  categoryColor = value;
                },
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context , categoryColor);
                      debugPrint("My color is $categoryColor");
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      'Save Color',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )),
              )
            ],
          ),
        );
      });
}
