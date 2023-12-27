import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/data/repositories/auth_rep.dart';
import '../edit_user/view/widgets/user_edit_card.dart';
import 'widgets/avatar.dart';
import 'widgets/logout_button.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthRep>().user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: const [LogoutButton()],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Avatar(user: user),
              const SizedBox(
                height: 24,
              ),
              const UserEditCard()
            ],
          ),
        ),
      ),
    );
  }
}
