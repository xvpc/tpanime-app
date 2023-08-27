import 'package:flutter/material.dart';
import 'package:tpanime/models/collection/dimensions.dart';

class ErrorMessage extends StatelessWidget {
  final message;
  const ErrorMessage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline,
              color: Colors.grey, size: Dimensions.screenSize4),
          const SizedBox(
            height: 12,
          ),
          Text(
            maxLines: 6,
            textAlign: TextAlign.center,
            message.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
