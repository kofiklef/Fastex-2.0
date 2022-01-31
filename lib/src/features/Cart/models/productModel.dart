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
      name: "Nana Ama’s Queens Gɔbɛ",
      imageURL: "assets/images/beans.jpeg",
      description: 'Gari and Beans, Rice, Kɔkɔɔ',
      phone: "024 620 8205",
      dprice: 3,
    ),
    Product(
      name: "Ibiza",
      imageURL: "assets/images/ibiza.jpg",
      description: 'Fried Rice, Jollof Rice',
      phone: "054 488 6003",
      dprice: 3,
    ),
    Product(
      name: "Sankies",
      imageURL: "assets/images/Sankies_Logo.png",
      description: 'Assorted Fried Rice & Chicken Pieces',
      phone: "059-646-4866",
      dprice: 3,
    ),
    Product(
      name: "Enie - Queens",
      imageURL: "",
      description: 'Fried rice, Jollof rice',
      phone: "024 330 8909",
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
      imageURL: "assets/images/fried.jpg",
      description: 'Fried Rice',
      phone: "024 417 1344",
      dprice: 3,
    ),
    Product(
      name: "Happy Home - Conti",
      imageURL: "assets/images/fried.jpg",
      description: 'Ghanaian Local Dishes',
      phone: "024 496 5262",
      dprice: 3,
    ),
    Product(
      name: "Rakho's Fufu",
      imageURL: "assets/images/fufu.png",
      description: 'Fufu',
      phone: "0593026033",
      dprice: 3,
    ),
    Product(
      name: "Sanbra’s Kitchen",
      imageURL: "",
      description: 'Fufu, riceball, banku',
      phone: "024 142 4816",
      dprice: 3,
    ),
    Product(
      name: "Noami’s Queens Gɔbɛ",
      imageURL: "assets/images/beans.jpeg",
      description: 'Gari and Beans, Rice, Kɔkɔɔ',
      phone: "024 496 3022",
      dprice: 3,
    ),
    Product(
      name: "Attaa Gɔbɛ - Ayeduase",
      imageURL: "assets/images/beans.jpeg",
      description: 'Gari and Beans, Rice, Kɔkɔɔ',
      phone: "054 289 0464",
      dprice: 3,
    ),
    Product(
      name: "KAT indomie",
      imageURL: "assets/images/indomie.jpg",
      description: 'Indomie',
      phone: "055 733 8575",
      dprice: 3,
    ),
    Product(
      name: "Aku Sika - Conti",
      imageURL: "",
      description:
          'Ampesi, Kontomire, jollof, rice,beans stew, cabbage stew, tomato stew',
      phone: "024 404 3589",
      dprice: 3,
    ),
  ];
}
