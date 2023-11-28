import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/filter_value.dart';
import '../../data/repositories/catalog_rep.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  late final cleanStatuses = context.read<CatalogRep>().cleanStatuses;
  late final cleanTypes = context.read<CatalogRep>().cleanTypes;
  var _filter = const FilterValue();

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
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Уборка номера',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                ...cleanStatuses.map(
                  (e) => CheckboxListTile(
                    title: Text(e.longDesc),
                    value: e == _filter.cleanStatus,
                    onChanged: (_) {
                      setState(() {
                        if (_filter.cleanStatus == e) {
                          _filter = _filter.copyWith(cleanStatus: null);
                        } else {
                          _filter = _filter.copyWith(cleanStatus: e);
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Тип уборки',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                ...cleanTypes.map(
                  (e) => CheckboxListTile(
                    title: Text(e.longDesc),
                    value: e == _filter.cleanType,
                    onChanged: (_) {
                      setState(() {
                        if (_filter.cleanType == e) {
                          _filter = _filter.copyWith(cleanType: null);
                        } else {
                          _filter = _filter.copyWith(cleanType: e);
                        }
                      });
                    },
                  ),
                ),
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
                color: theme.canvasColor,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Применить'),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.topCenter,
      child: Text(
        'Фильтр',
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
