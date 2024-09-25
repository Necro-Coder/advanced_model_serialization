class Init {
  Future<String> init(String arg) async {
    String response = '';
    try {
      switch (arg) {
        case '-r':
          response = await _createReflectorFiles();
          break;
        case '-m':
          response = await _modifyMain();
          break;
        case '-d':
          response = await _createDirectory();
          break;
        case '-a':
          response = await _addReflectorPackage();
          break;
        default:
          response = '$response${await _addReflectorPackage()}\n\n';
          response = '$response${await _createReflectorFiles()}\n\n';
          response = '$response${await _createDirectory()}\n\n';
          response = '$response${await _modifyMain()}\n\n';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _createReflectorFiles() async {}

  Future<String> _createDirectory() async {}

  Future<String> _modifyMain() async {}

  Future<String> _addReflectorPackage() async {}
}
