// mixin Fly {
//   void fly() {
//     print("I can fly");
//   }
// }

// class Bird with Fly {}

// void main() {
//   Bird b = Bird();
//   b.fly(); // Output: I can fly
// }

mixin Fly {
  void fly() {
    print("flying");
  }
}

mixin swim {
  void Swim() {
    print("swimming");
  }
}

class Duck with Fly, swim {}

void main() {
  Duck d = Duck();
  d.fly(); // Output: flying
  d.Swim(); // Output: swimming
}
