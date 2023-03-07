import 'dart:async';

import 'package:minigym/features/routine/models/routine_model.dart';
import 'package:riverpod/riverpod.dart';

class RoutineViewModel extends AsyncNotifier<List<RoutineModel>> {
  final List<RoutineModel> _list = [];
  @override
  FutureOr<List<RoutineModel>> build() async {
    await Future.delayed(const Duration(seconds: 5));
    return _list;
  }
}

final routineProvider =
    AsyncNotifierProvider<RoutineViewModel, List<RoutineModel>>(
  () => RoutineViewModel(),
);
