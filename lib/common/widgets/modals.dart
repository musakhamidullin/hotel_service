import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Modals {
  static Future<T?> showBottomSheet<T>(BuildContext context, Widget child,
      {bool useRootNavigator = true,
      bool showDragHandle = false,
      Color? barrierColor}) async {
    return await showModalBottomSheet<T>(
      useRootNavigator: useRootNavigator,
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: barrierColor,
      showDragHandle: showDragHandle,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  static Future<bool?> showConfirmationDialog(
      BuildContext context, String text) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actionsPadding: const EdgeInsets.all(16),
          actions: <Widget>[
            TextButton(
              child: const Text('Нет'),
              onPressed: () {
                Navigator.pop(context, false); // showDialog() returns false
              },
            ),
            ElevatedButton(
              child: const Text('Да'),
              onPressed: () {
                Navigator.pop(context, true); // showDialog() returns true
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showCupertinoModal(
    BuildContext context,
    Widget widget,
  ) {
    return showCupertinoModalPopup(
        context: context, builder: (context) => widget);
  }

  static late Timer _timer;

  static Future<void> showInformationDialog(
      BuildContext context, String text, IconData iconData) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          _timer = Timer(const Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });

          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.all(24),
            title: Center(
              child: Text(text),
            ),
            children: [
              Icon(
                iconData,
                color: Theme.of(context).iconTheme.color?.withOpacity(0.3) ??
                    Colors.grey,
                size: 96,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: Navigator.of(context).pop, child: const Text('OK'))
            ],
          );
        }).then(
      (_) {
        if (_timer.isActive) {
          _timer.cancel();
        }
      },
    );
  }
}
