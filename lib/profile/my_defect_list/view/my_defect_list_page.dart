import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/repositories/auth_rep.dart';
import '../../../common/widgets/failure_widget.dart';
import '../cubit/my_defects_cubit.dart';
import '../data/repository/my_defects_rep.dart';

@RoutePage()
class MyDefectListPage extends StatefulWidget {
  const MyDefectListPage({super.key});

  @override
  State<MyDefectListPage> createState() => _MyDefectListPageState();
}

class _MyDefectListPageState extends State<MyDefectListPage> {
  late final _defectsCubit = MyDefectsCubit(
    myDefectsRep: MyDefectsRep(),
    user: context.read<AuthRep>().user,
  );

  @override
  void dispose() {
    _defectsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _defectsCubit..fetchMyDefects(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Мои заявки'),
        ),
        body: BlocBuilder<MyDefectsCubit, MyDefectsState>(
          builder: (context, state) {
            if (state.failure()) {
              return FailureWidget(
                  onPressed: context.read<MyDefectsCubit>().fetchMyDefects);
            }
            return ListView();
          },
        ),
      ),
    );
  }
}
