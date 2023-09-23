class MealModel {
  String? imageUrl;
  String? name;
  List<Content>? content;
  bool isFav = false;
  MealModel(Map map) {
    imageUrl = map["image"];
    name = map["name"];
    List<Map> contenetData = map['content'];
    content = contenetData.map((e) {
      return Content(e);
    }).toList();
  }
}

class Content {
  String? name;
  int? price;
  Content(Map map) {
    name = map["name"];
    price = map["price"];
  }
}
