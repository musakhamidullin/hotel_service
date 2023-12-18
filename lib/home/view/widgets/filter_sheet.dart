import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home_cubit.dart';
import '../../data/models/filter_value.dart';
import '../../data/repositories/catalog_rep.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({
    Key? key,
    required this.homeCubit,
  }) : super(key: key);

  final HomeCubit homeCubit;

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  late final cleanStatuses = context.read<CatalogRep>().cleanStatuses;
  late final cleanTypes = context.read<CatalogRep>().cleanTypes;
  late final roomStatuses = context.read<CatalogRep>().roomStatuses;
  late var _filter = widget.homeCubit.state.filterValue ?? const FilterValue();

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
        return BlocProvider.value(
          value: widget.homeCubit,
          child: Stack(
            children: [
              ListView(
                controller: controller,
                padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
                children: [
                  const _Header(title: 'Статус номера'),
                  ...roomStatuses.map(
                    (e) => CheckboxListTile(
                      title: Text(e.fullName),
                      value: e == _filter.roomStatusInfo,
                      onChanged: (_) {
                        setState(() {
                          if (_filter.roomStatusInfo == e) {
                            _filter = _filter.copyWith(roomStatusInfo: null);
                          } else {
                            _filter = _filter.copyWith(roomStatusInfo: e);
                          }
                        });
                      },
                    ),
                  ),
                  const _Header(title: 'Уборка номера'),
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
                  const _Header(title: 'Тип уборки'),
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
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.homeCubit.filtered(_filter);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Применить'),
                  ),
                ),
              )
            ],
          ),
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
      padding: const EdgeInsets.only(left: 16, right: 16),
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Фильтр',
            style: theme.textTheme.titleLarge,
          ),
          FilledButton.tonal(
            onPressed: () {
              context.read<HomeCubit>().resetFilter();
              Navigator.of(context).pop();
            },
            child: const Text('Сбросить'),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey[300],
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
