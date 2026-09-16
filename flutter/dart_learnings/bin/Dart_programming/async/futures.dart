Future<String> getData() {
  return Future.delayed(Duration(seconds: 2), () => "Data retrieved");
}

void main() {
  print("starting");

  getData().then((data) {
    print(data);
  });

  print("end");
}
