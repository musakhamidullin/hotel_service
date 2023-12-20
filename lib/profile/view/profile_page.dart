import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/logout_button.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: const [LogoutButton()],
      ),
    );
  }
}
