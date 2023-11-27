import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 1.0,
        minChildSize: .4,
        controller: _draggableScrollableController,
        builder: (_, controller) {
          return Stack(
            children: [
              ListView(
                controller: controller,
                padding: const EdgeInsets.fromLTRB(8, 32, 8, 8),
                children: [
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
              const _AppBar(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Применить'),
                  ),
                ),
              )
            ],
          );
        });
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        'Фильтр',
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
