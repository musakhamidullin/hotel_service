import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/repositories/auth_rep.dart';

@RoutePage()
class EditUserPage extends StatelessWidget {
  const EditUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthRep>().user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Личные данные'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Имя'),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              initialValue: user.personInfo.firstName,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Фамилия'),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              initialValue: user.personInfo.lastName,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Отчество'),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              initialValue: user.personInfo.patronymic,
            ),
          ],
        ),
      ),
    );
  }
}
