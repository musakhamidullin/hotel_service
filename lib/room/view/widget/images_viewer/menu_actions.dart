import 'package:flutter/material.dart';

class MenuActions extends StatelessWidget {
  const MenuActions({
    super.key,
    required this.onRemoved,
  });

  final Function() onRemoved;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      minChildSize: 0.2,
      initialChildSize: 0.2,
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                ),
                title: const Text('Удалить фотографию'),
                onTap: onRemoved,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton.tonal(
                  onPressed: Navigator.of(context).pop,
                  child: const Text('Закрыть'),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
