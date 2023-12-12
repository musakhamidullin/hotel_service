import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/modals.dart';
import '../../cubit/home_cubit.dart';
import 'filter_sheet.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              keyboardType: TextInputType.number,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce = Timer(
                  const Duration(milliseconds: 500),
                  () => context.read<HomeCubit>().search(value),
                );
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(4.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'введите номер',
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final button = IconButton(
              onPressed: () {
                Modals.showBottomSheet(
                  context,
                  FilterSheet(
                    homeCubit: context.read<HomeCubit>(),
                  ),
                  showDragHandle: true,
                );
              },
              icon: const Icon(Icons.filter_alt_rounded),
            );

            if (state.filterValue == null) {
              return button;
            }

            return Stack(
              alignment: Alignment.topRight,
              children: [
                button,
                Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
