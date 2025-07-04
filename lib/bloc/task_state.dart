import 'package:new_task_webly/model/task_model.dart';

abstract class TaskState{}

class InitialTaskState extends TaskState{}
class LoadingTaskState extends TaskState{}
class LoadedTaskState extends TaskState{
ProductDataModel resData;
LoadedTaskState({required this.resData});
}
class ErrorTaskState extends TaskState{
  String error;
  ErrorTaskState({required this.error});
}