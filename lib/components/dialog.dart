import 'package:flutter/material.dart';

void showDiaqDone(BuildContext context, String jsonName, String message) {
  showGeneralDialog(context: context,
    pageBuilder: (BuildContext context, Animation<double> animation1,
        Animation<double> animation2) {
      return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      );
    },
    transitionBuilder: (BuildContext context, Animation<double> animation1,
        Animation<double> animation2, Widget child) {
      var curve = Curves.linear.transform(animation1.value);
      return Transform.scale(
        scale: curve,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 270),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('please take a selfie to login'),
              ],
            ),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
  );
  finishDialog(context, 2);
}

Future finishDialog(BuildContext context, int duration) async {
  Future.delayed(Duration(seconds: duration), () {
    Navigator.of(context).pop();
  });
}
