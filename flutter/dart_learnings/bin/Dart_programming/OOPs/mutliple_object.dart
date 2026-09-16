class car {
  String brand = "";
  String model = "";

  void showDetails() {
    print("Brand: $brand, Model: $model");
  }
}

void main() {
  car car1 = car();
  car1.brand = "Toyota";
  car1.model = "Camry";
  car1.showDetails();

  car car2 = car();
  car2.brand = "Honda";
  car2.model = "Civic";
  car2.showDetails();
}