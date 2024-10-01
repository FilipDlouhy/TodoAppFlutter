import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/data/datasource/dataexport.dart';

final taskDataProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
