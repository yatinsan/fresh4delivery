class Api {
  static const String _baseUrl = 'https://ebshosting.co.in/api';
  static User user = User();
  static Restaurant restaurant = Restaurant();
  static SuperMarket supermarket = SuperMarket();
  static Cart cart = Cart();
  static Order order = Order();
  static Search search = Search();
}

class User {
  User();

  static const String _baseUrl = Api._baseUrl + "/customer";

  String login = _baseUrl + "/login";
  String register = _baseUrl + "/register";
  String checkNumber = _baseUrl + "/check/number";
  String sendotp = _baseUrl + "/sentregisterotp";
  String profile = _baseUrl + "/profile";
  String update = _baseUrl + "/update";
  String home = _baseUrl + "/home";
  String notification = _baseUrl + "/notification";
  String checkPromocode = _baseUrl + "/check/promocode";
}

class Restaurant {
  Restaurant();

  static const String _baseUrl = Api._baseUrl + "/customer/restaurants";

  String viewAll = _baseUrl + "/view/all";
  String viewOne(String id) => _baseUrl + "/${id}";
  // String restaur
}

class SuperMarket {
  SuperMarket();

  static const String _baseUrl = Api._baseUrl + "/customer/restaurants";

  String viewAll = _baseUrl + "view/all";
  String viewOne(String id) => _baseUrl + "/${id}";
}

class Cart {
  Cart();

  static const String _baseUrl = Api._baseUrl + "/cart";

  String cartCheck = _baseUrl + "/check";
  String addtocart = Api._baseUrl + "/addtocart";
  String remove = _baseUrl + "/remove";
  String changeQuantity = _baseUrl + "/changequantity";
  String getcart = Api._baseUrl + "/getcart";
  String placeorder = Api._baseUrl + "/placeorder";
}

class Order {
  Order();

  static const String _baseUrl = Api._baseUrl + '/customer/order';

  String orderupdate = _baseUrl + "/update";
  String orders = Api._baseUrl + "/orders";
  String getoneorder(String id) => _baseUrl + "/${id}";
}

class Address {
  Address();

  static const String _baseUrl = Api._baseUrl + '/customer/address';

  String getAddress = _baseUrl;
  String createAddress = _baseUrl + "/create";
  String getOneAddress(String id) => _baseUrl + "/${id}";
  String removeAddress(String id) => _baseUrl + "/${id}";
  String defaultAddress = _baseUrl + "/default";
}

class Search {
  Search();

  static const String _baseUrl = Api._baseUrl + '/customer/search';

  String searchState = _baseUrl + "/state";
  String searchDistrict = _baseUrl + "/district";
}
