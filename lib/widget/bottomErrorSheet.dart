import 'package:flutter/material.dart';
import 'package:shopping_app/generated/l10n.dart';

class bottomErrorSheet {
  static void showError(BuildContext context, String message) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {

        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), 
                topRight: Radius.circular(20),
              ),
          ),
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).error,
                  style: Theme.of(context).textTheme.headlineMedium
                  ,
                ),
                SizedBox(height: 10),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
