class RecipeModel {
  String? title;
  String? image;
  String? category;
  String? chefName;
  String? chefAvatar;
  String? desc;
  String? level;
  double? star;
  int? min;
  DateTime? posted;
  bool? isLiked = false;
  // String? desc;
  RecipeModel(
      {this.title,
      this.image,
      this.category,
      this.chefName,
      this.chefAvatar,
      this.desc,
      this.level,
      this.star,
      this.min,
      this.posted,
      this.isLiked});
  factory RecipeModel.fromJson(jsonData) {
    return RecipeModel(
      title: jsonData['title'],
      image: jsonData['image'],
      category: jsonData['category'],
      chefName: jsonData['chefName'],
      chefAvatar: jsonData['chefAvatar'],
      desc: jsonData['desc'],
      level: jsonData['level'],
      star: jsonData['star'],
      min: jsonData['min'],
      posted: jsonData['posted'],
      isLiked: jsonData['isLiked'],
    );
  }
}
