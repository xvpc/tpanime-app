import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void dialog(context, String? text) {
  // ignore: avoid_single_cascade_in_expression_statements
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    // title: 'Error',
    body: Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        text ?? "Something Went wrong!",
        maxLines: 10,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ),

    btnCancelOnPress: () {},
  )..show();
}
