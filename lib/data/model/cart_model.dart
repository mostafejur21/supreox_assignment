class MenuModel {
  List<Menu>? menu;
  int? vat;
  String? note;

  MenuModel({this.menu, this.vat, this.note});

  MenuModel.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(Menu.fromJson(v));
      });
    }
    vat = json['vat'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (menu != null) {
      data['menu'] = menu!.map((v) => v.toJson()).toList();
    }
    data['vat'] = vat;
    data['note'] = note;
    return data;
  }
}

class Menu {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? description;
  int? price;
  int? discountPrice;

  Menu(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.description,
      this.price,
      this.discountPrice});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    return data;
  }
}

class Items{
  Menu menu;
  int quantity;
  Items({required this.menu, required this.quantity});

  Items.fromJson(Map<String, dynamic> json)
      : menu = Menu.fromJson(json['menu']),
        quantity = json['quantity'];
}