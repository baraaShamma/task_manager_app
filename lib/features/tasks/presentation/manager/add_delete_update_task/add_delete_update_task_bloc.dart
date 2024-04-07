import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_delete_update_task_event.dart';
part 'add_delete_update_task_state.dart';

class AddDeleteUpdateTaskBloc extends Bloc<AddDeleteUpdateTaskEvent, AddDeleteUpdateTaskState> {
  AddDeleteUpdateTaskBloc() : super(AddDeleteUpdateTaskInitial()) {
    on<AddDeleteUpdateTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
