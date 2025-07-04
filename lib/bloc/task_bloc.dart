import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_task_webly/bloc/task_event.dart';
import 'package:new_task_webly/bloc/task_state.dart';
import 'package:new_task_webly/model/task_model.dart';

import '../api_helper/api_helper.dart';

class TaskBloc extends Bloc<TaskEvent,TaskState>{
  ApiHelper apiHelper;

  TaskBloc({required this.apiHelper}) : super(InitialTaskState()){

    on<TaskInitialEvent>((event,emit)async{

      emit(LoadingTaskState());
      var resJson = await apiHelper.getAPI();
      if(resJson!=null){
        var mResData = ProductDataModel.fromJson(resJson);

        emit(LoadedTaskState(resData: mResData));
      }else{
        emit(ErrorTaskState(error: "Error Occurs"));
      }
    });

  }

}