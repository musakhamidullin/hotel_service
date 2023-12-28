import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/repositories/auth_rep.dart';
import '../../../common/widgets/failure_widget.dart';
import '../../../room/view/widget/issue_card.dart';
import '../cubit/my_defects_cubit.dart';
import '../data/repository/my_defects_rep.dart';
import 'widgets/defects_card.dart';

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
      create: (context) => _defectsCubit..fetchFirstPageMyDefects(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Мои заявки'),
        ),
        body: BlocBuilder<MyDefectsCubit, MyDefectsState>(
          builder: (context, state) {
            if (state.failure()) {
              return FailureWidget(
                  onPressed:
                      context.read<MyDefectsCubit>().fetchFirstPageMyDefects);
            } else if (state.loading()) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (value) {
                if (value.metrics.pixels >= value.metrics.maxScrollExtent &&
                    !value.metrics.outOfRange) {}
                return true;
              },
              child: ListView.builder(
                itemCount: state.myDefects.length,
                itemBuilder: (_, index) {
                  return DefectsCard(
                    issuesModel: state.myDefects[index],
                    index: index,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
