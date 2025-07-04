import 'package:flutter/material.dart';

import '../model/task_model.dart';

class ProductDetailPage extends StatelessWidget {
  ProductModel currentModel;
  ProductDetailPage({required this.currentModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF67E7F),
          foregroundColor: Colors.white,
          title: Text("Product Data"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.network(
              currentModel.image!,
            ),
          ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${currentModel.price.toString()} ₹",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                        Text(
                          "  (${currentModel.discount.toString()}% off)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              fontSize: 16),
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 11,),
                Text(
                  '${currentModel.title}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                SizedBox(height: 11,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Category :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.black54, fontSize: 16)),
                      TextSpan(
                          text: ' ${currentModel.category}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.black, fontSize: 16)),

                    ],
                  ),
                ),

                SizedBox(height: 21,),
                Text(
                  'Details:',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87, fontSize: 18),
                ),
                SizedBox(height: 11,),
                Text(
                  '${currentModel.description}',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                SizedBox(height: 11,),


              ],
            ),
          ),
        ));
  }
}
