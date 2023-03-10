class CatalogModel {
  // constructor initialize 1
  static List<Item> items = [
    // by making field final you are not able make changes and here you adding more list item so have to make this not a  final
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      // constructor 1
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  // to get the data from the json we make sure that here must be constructor and you initilize it
  // here we do dynamic because variable you have are not same in the json some of the string some of int and some are other so you have to assing it as json
  // factory is type of constructor which is initialize the value with something so can't get error
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );

    // toMap()=>{ // to encoding process
    //   "id":id,
    //   "name":name,
    //   "desc":desc,
    //   "price":price,
    //   "color":color,
    //   "image":image,
    // };
  }
}
