class Device {
  int deviceID;
  String name;
  String description;
  bool isOnline;

  Device({this.deviceID, this.name, this.description, isOnline}) {
    if (isOnline == 1) {
      this.isOnline = true;
    } else {
      this.isOnline = false;
    }
  }
}
