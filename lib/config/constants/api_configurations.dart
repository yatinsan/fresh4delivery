class Api {
  static const String _baseUrl = 'https://ebshosting.co.in/api';
  static User user = User();
  static Restaurant restaurant = Restaurant();
  static SuperMarket supermarket = SuperMarket();
  static Cart cart = Cart();
  static Order order = Order();
  static Search search = Search();
  static Review review = Review();
  static Address address = Address();
}

class User {
  User();

  static const String _baseUrl = Api._baseUrl + "/customer";

  String login = _baseUrl + "/login";
  String register = _baseUrl + "/register";
  String checkNumber = _baseUrl + "/check/number";
  String sendregisterotp = _baseUrl + "/sendregisterotp";
  String profile = _baseUrl + "/profile";
  String update = _baseUrl + "/update";
  String home = _baseUrl + "/home";
  String notification = _baseUrl + "/notification";
  String checkPromocode = _baseUrl + "/check/promocode";
  String forgotOtp = _baseUrl + "/sendforgototpmobile";
  String changePassword = _baseUrl + "/change/number";
}

class Restaurant {
  Restaurant();

  static const String _baseUrl = Api._baseUrl + "/customer/restaurants";

  String viewAll = _baseUrl + "/view/all";
  String viewOne(String id) => _baseUrl + "/${id}";
  String restaurantOneCateogory(String id) => _baseUrl + "/${id}";
}

class SuperMarket {
  SuperMarket();

  static const String _baseUrl = Api._baseUrl + "/customer/supermarkets";

  String viewAll = _baseUrl + "/view/all";
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
  String allorders = Api._baseUrl + "/customer/orders";
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

  String allsearch = _baseUrl;
  String searchState = _baseUrl + "/state";
  String searchDistrict = _baseUrl + "/district";
  String pincodes = Api._baseUrl + "/search/pincode";
}

class Review {
  Review();

  static const String _baseUrl = Api._baseUrl + '/customer';

  String addReview = _baseUrl + "/addreview";
}
