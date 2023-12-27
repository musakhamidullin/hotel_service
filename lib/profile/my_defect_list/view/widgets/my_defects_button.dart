import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/router.gr.dart';

class MyDefectsButton extends StatelessWidget {
  const MyDefectsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: () {
          context.router.push(const MyDefectListRoute());
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(child: Text('Мои заявки')),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
