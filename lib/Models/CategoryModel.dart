class CategoryModel {
  String? category;
  String? icon;
  String? image;

  CategoryModel({this.category, this.image, this.icon});
  factory CategoryModel.fromJson(jsonData) {
    return CategoryModel(
        image: jsonData['image'],
        category: jsonData['category'],
        icon: jsonData['icon']);
  }
}
