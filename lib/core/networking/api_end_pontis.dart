class ApiEndPontis {
  static const String baseUrl = 'https://accessories-eshop.runasp.net/api/';
  static const String signUp = 'auth/register';
  static const String login = 'auth/login';
  static const String categories = 'categories';
  static const String products = 'products';
  static const String addProductToCart = 'cart/items';
  static const String getCartProduct = 'cart';
  // static const String deleteProduct =  'cart/items/';
static const String deleteProduct = 'cart/items/{id}'; // {id} دي placeholder
  
}
