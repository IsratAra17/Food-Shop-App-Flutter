class ProductModel {
  int? id;
  String? image;
  String? name;
  String? details;
  double? price;
  int quantity = 1;

  ProductModel({
    this.details,
    this.id,
    this.image,
    this.name,
    this.price,
  });
}

List<ProductModel>productList = [
  ProductModel(
    details:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
    id: 1,
    image:"https://images.unsplash.com/photo-1576618148400-f54bed99fcfd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80",
    name: "Fish Curry",
    price: 120,
  ),
  ProductModel(
    details:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
    id: 2,
    image:
        "https://images.unsplash.com/photo-1559847844-5315695dadae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1158&q=80",
    name: "Shimp with rice",
    price: 120,
  ),
  ProductModel(
    details:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
    id: 3,
    image:
        "https://images.unsplash.com/photo-1601050690597-df0568f70950?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
   name: "Samosa",
    price: 120,
  ),

  ProductModel(
    details:
    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
    id: 4,
    image:
"https://images.unsplash.com/photo-1563805042-7684c019e1cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=327&q=80" ,
    name: "Ice Cream",
    price: 120,
  ),
  ProductModel(
    details:
    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
    id: 5,
    image:"https://images.unsplash.com/photo-1560180474-e8563fd75bab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
    name: "Dessert 1",
    price: 120,
  ),
  ProductModel(
    details:
    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
    id: 6,
image:"https://images.unsplash.com/photo-1579954115545-a95591f28bfc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80" ,
    name: "Strawberry Juice",
    price: 120,
  ),
  ProductModel(
    details:
    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
    id: 7,
image: "https://images.unsplash.com/photo-1534353473418-4cfa6c56fd38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
    name: "Orange juice",
    price: 120,
  ),ProductModel(
    details:
    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
    id: 8,
image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80",
    name: "Orange juice",
    price: 120,
  ),



];
