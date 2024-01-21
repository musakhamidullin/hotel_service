import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/message_value.dart';

part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(const CommentsState());

  Future<void> sendMessage(MessageValue value) async {
    try {
      emit(state.copyWith(messages: [...state.messages, value]));
    } catch (_) {

    }
  }
}
