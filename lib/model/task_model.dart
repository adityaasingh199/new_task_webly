class ProductModel {
  String? title;
  String? image;
  String? description;
  String? color;
  String? category;
  String? brand;
  int id;
  int? discount;
  int price;

  ProductModel({
    required this.id,
    required this.price,
    this.image,
    this.title,
    this.color,
    this.description,
    this.brand,
    this.category,
    this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      price: json["price"],
      color: json["color"],
      brand: json["brand"],
      category: json["category"],
      description: json["description"],
      discount: json["discount"],
      image: json["image"],
      title: json["title"],
    );
  }
}

class ProductDataModel{
  List<ProductModel> products;
  ProductDataModel({required this.products});
  factory ProductDataModel.fromJson(Map<String,dynamic> json){

    List<ProductModel> mData = [];

    for(Map<String,dynamic> eachData in json["products"]){
      mData.add(ProductModel.fromJson(eachData));
    }




    return ProductDataModel(products: mData);
  }
}
