import 'package:flutter/material.dart';

class UiHelper{
    static CustomTextField(TextEditingController controller, String text, double width, IconData? iconData, bool toHide){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: SizedBox(
              width: width,
            child: TextField(
                controller: controller,
                obscureText: toHide,
                decoration: InputDecoration(
                    hintText: text,
                    suffixIcon: iconData!=null? Icon(iconData): null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                    )
                ),
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

    static DashboardText(BuildContext context,TextEditingController controller, String key,String value, bool isEdit){
      double w = MediaQuery.of(context).size.width;
      return Row(
        children: [
          Text(key + ": ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
          SizedBox(width: w*.001,),
          isEdit ? TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: hint,
              counterText: value
            ),
          ) : Text(
            value,
            style: TextStyle(
              fontSize: 18
            ),),
        ],
      );
    }
}