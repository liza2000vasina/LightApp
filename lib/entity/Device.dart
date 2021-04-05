class Device {
  String name;

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  static Device fromJson(Map<String, dynamic> json) {
    return Device()..name = json['name'];
  }
}
