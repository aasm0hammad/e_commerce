class ProductModel {
  String? id;
  String? status;
  String? category_id;
  String? created_at;
  String? image;
  String? name;
  String? price;
  String? updated_at;

  ProductModel(
      {this.id,
      this.status,
      this.name,
      this.price,
      this.category_id,
      this.created_at,
      this.image,
      this.updated_at});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        status: json['status'],
        category_id: json['category_id'],
        created_at: json['created_at'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        updated_at: json['updated_at'],
      );
}

class ProductDataModel{
  bool? status;
  String? message;
  List<ProductModel>? data;

  ProductDataModel({
    this.status,this.data,this.message

});
  factory ProductDataModel.fromJson(Map<String,dynamic> json)=> ProductDataModel(

      message: json['message'],
    status: json['status'],
    data: List<ProductModel>.from(json['data'].map((e)=>ProductModel.fromJson(e))),

  );


}
