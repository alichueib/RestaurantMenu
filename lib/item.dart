class Item{
  //this item should have a name and a price
  //and later we will add an image
  //and most probably a boolean value to test whether the checkbox is checked
  final String _name;
  final double _price;
  final String _image;
  bool _selected=false;

  Item(this._name,this._price,this._image);

  //getters
  String get name => _name;
  double get price => _price;
  String get image => _image;
  bool get selected =>_selected;
  set selected(bool val){
    _selected=val;
  }

  //toString Method:
  @override
  String toString(){
    return 'Price: \$$_price $_name';
  }
}


