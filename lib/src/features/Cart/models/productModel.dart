class Product {
  final String name, imageURL, phone, description;
  final double dprice;

  const Product({
    required this.name,
    required this.description,
    required this.imageURL,
    required this.phone,
    required this.dprice,
  });

  static const List<Product> products = [
    Product(
      name: "Ibiza",
      imageURL: "",
      description: 'Fried Rice, Jollof Rice',
      phone: "054 488 6003",
      dprice: 3,
    ),
    Product(
      name: "Sankees",
      imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fviewghana.com%2Frestaurants%2Fsankies-restaurant%2F&psig=AOvVaw3d0OF8V6vbhosc5tfvjD38&ust=1643105332986000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPDm0MGSyvUCFQAAAAAdAAAAABAD",
      description: '',
      phone: "059-646-4866",
      dprice: 3,
    ),
    Product(
      name: "Stakeman Food Services",
      imageURL: "",
      description: '',
      phone: "024-609-0282",
      dprice: 3,
    ),
    Product(
      name: "Helenus - Conti",
      imageURL: "",
      description: '0',
      phone: "024 417 1344",
      dprice: 3,
    ),
    Product(
      name: "Happy Home - Conti",
      imageURL: "",
      description: 'Ghanaian Local Dishes',
      phone: "024 496 5262",
      dprice: 3,
    ),
    Product(
      name: "Rakho's Fufu",
      imageURL: "",
      description: 'Fufu',
      phone: "0593026033",
      dprice: 3,
    ),
    Product(
      name: "Sanbra’s Kitchen",
      imageURL: "",
      description: '10',
      phone: "024 142 4816",
      dprice: 3,
    ),
    Product(
      name: "Noami’s Queens Gɔbɛ",
      imageURL: "",
      description: 'Gari and Beans, Rice, Kɔkɔɔ',
      phone: "024 496 3022",
      dprice: 3,
    ),
    Product(
      name: "Nana Ama’s Queens Gɔbɛ",
      imageURL: "",
      description: 'Gari and Beans, Rice, Kɔkɔɔ',
      phone: "024 620 8205",
      dprice: 3,
    ),
    //
    Product(
      name: "Attaa Gɔbɛ - Ayeduase",
      imageURL: "",
      description: 'Gari and Beans, Rice, Kɔkɔɔ',
      phone: "054 289 0464",
      dprice: 3,
    ),
    Product(
      name: "KAT indomie",
      imageURL: "",
      description: 'Indomie',
      phone: "055 733 8575",
      dprice: 3,
    ),
    Product(
      name: "Enie - Queens",
      imageURL: "Fried rice, Jollof rice",
      description: '0',
      phone: "024 330 8909",
      dprice: 3,
    ),
    Product(
      name: "Aku Sika - Conti",
      imageURL: "",
      description: '0',
      phone: "024 404 3589",
      dprice: 3,
    ),
  ];
}
