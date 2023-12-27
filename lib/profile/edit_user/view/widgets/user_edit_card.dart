import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../auth/data/repositories/auth_rep.dart';

class UserEditCard extends StatelessWidget {
  const UserEditCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthRep>().user;
    return Card(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: () {
          context.router.push(EditUserRoute());
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(user.personInfo.fullName())),
                  const Icon(Icons.edit),
                ],
              ),
              const Text('руководитель'),
            ],
          ),
        ),
      ),
    );
  }
}
