// Encapsulation => private variables & public functions
class Phone {
  String name = '';
  String _os = '';
  double _price = 0;

  Phone();

  Phone.android({
    required this.name,
    required double price,
  }) : _price = price {
    _os = "Android";
  }

  Phone.iOS({
    required this.name,
    required double price,
  }) {
    _os = "iOS";
    _price = price;
  }

  void printData() {
    print('------------------');
    print('Phone name : $name');
    print('Phone os : $_os');
    print('Phone price : $_price EGP');
    print('------------------');
  }

  // getter and setters

  String getOperatingSystem() {
    return _os;
  }

  double getPrice() {
    return _price;
  }

  void setPrice(double price){
    if (price < 1) {
      return;
    }
    _price = price;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  @override
  String toString() {
    return 'Phone{name: $name, _os: $_os, _price: $_price}';
  }

}
