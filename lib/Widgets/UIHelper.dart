import 'package:flutter/material.dart';

class UiHelper{
    static CustomTextField(TextEditingController controller, String text, IconData iconData, bool toHide){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: TextField(
              controller: controller,
              obscureText: toHide,
              decoration: InputDecoration(
                  hintText: text,
                  suffixIcon: Icon(iconData),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                  )
              ),
          ),
        );
    }

    static customButton(VoidCallback function,String text, double height, double width){
        return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

            ),
            child: ElevatedButton(
                onPressed: function,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal
                ),
                child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18),)
            ),
        );
    }

    static alertbox(context, String mssg){
        var message = SnackBar(
            content: Center(
                child: Text(
                    mssg,
                    style:
                    TextStyle(fontSize: 18),
                )),
            duration: Duration(seconds: 2),
        );
        return ScaffoldMessenger.of(context).showSnackBar(message);
    }
}