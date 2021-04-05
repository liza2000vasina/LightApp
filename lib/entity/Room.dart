import 'Device.dart';

class Room {
  String name;
  List<Device> devices;

  void addDevice(Device device) {
    devices.add(device);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'devices': devices.map((e) => e.toJson()).toList(),
      };

  static Room fromJson(Map<String, dynamic> json) {
    return Room()
      ..name = json['name']
      ..devices = json['devices'].map<Device>((e) => Device.fromJson(e)).toList();
  }
}
