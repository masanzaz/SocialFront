class HobbyViewModel {
    int _id = 0;
    String _image = "";
    String _name = "";

    HobbyViewModel(this._id, this._image, this._name);

    int get id => _id;
    set setId(int value){
        _id = value;
    }
    String get image => _image;
    set setImage(String value){
        _image = value;
    }
    String get name => _name;
    set setName(String value){
        _name = value;
    }

    Map<String,dynamic> toMap(){
        var map = Map<String,dynamic>();
        map["Id"] = _id;
        map["Image"] = _image;
        map["Name"] = _name;
        return map;
    }

    HobbyViewModel.fromObject(dynamic o){
        this._id = o["Id"];
        this._image = o["Image"];
        this._name = o["Name"];
    }
}