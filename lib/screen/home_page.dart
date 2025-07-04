import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_task_webly/bloc/task_state.dart';

import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskBloc>(context).add(TaskInitialEvent());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc,TaskState>(builder: (_,state){
        if(state is LoadingTaskState){
          return Center(child: CircularProgressIndicator(),);
        }
        if(state is LoadedTaskState){
          var mData = state.resData;
          var mProduct = mData.products;
          return ListView.builder(
              itemCount: mProduct.length,
              itemBuilder: (_,index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage(currentModel: mProduct[index])));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Image.network(mProduct[index].image!,width: 150,height: 150,),
                         Expanded(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(mProduct[index].title!,overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Text("${mProduct[index].price.toString()} ₹",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                                  Text("${mProduct[index].discount.toString()}%off",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                                ],
                                                     ),
                           ),
                         ),
                      ],
                    ),
                  ),
                );
              });
        }
        return Container();
      }),
    );
  }
}
