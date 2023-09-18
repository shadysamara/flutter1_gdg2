MealDetails mealDetails = MealDetails(
    "Pizza Meal",
    "Italian pizza from altaboon resturant",
    25,
    "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
    [
      MealComponent(
          "Choose The suitable size",
          [
            MealComponentItem(1, "Small", 10),
            MealComponentItem(2, "Medium", 20),
            MealComponentItem(3, "Big", 30),
          ],
          false),
      MealComponent(
          "Choose The suitable Extra",
          [
            MealComponentItem(1, "Cheese", 5),
            MealComponentItem(2, "Fries", 10),
            MealComponentItem(3, "Salat", 7),
            MealComponentItem(4, "Katchup", 1),
          ],
          true)
    ]);

class MealDetails {
  String imageUrl;
  String name;
  int price;
  String description;
  List<MealComponent> mealComponents;
  MealDetails(this.name, this.description, this.price, this.imageUrl,
      this.mealComponents);
}

class MealComponent {
  bool isMultiSelection;
  String title;
  List<MealComponentItem> items;
  MealComponent(this.title, this.items, this.isMultiSelection);
}

class MealComponentItem {
  String name;
  int price;
  int id;
  MealComponentItem(this.id, this.name, this.price);
}
