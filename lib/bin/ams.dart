import 'dart:io';

import 'package:advanced_model_serialization/src/errors_control/errors_control.dart';

void main(List<dynamic> args) async {
  bool isRoot = await _isRoot();
  if (!isRoot) {
    throw AmsCommandException(
        '\nYou are not in the root of the project, please, move to the root of the project to avoid fails\n');
  }

  if (args.isEmpty) {
    args.add('help');
  }

  switch (args[0]) {
    case 'help':
    case 'HELP':
    case 'Help':
      //TODO: Imprimir la ayuda
      break;
    case 'init':
    case 'INIT':
    case 'Init':
      if(args.length < 2) {
        //TODO: Imprimir la ayuda
      }
      //TODO: Crear los archivos necesarios para la reflexión
      break;
    default:
    //TODO: Imprimir la ayuda
  }
}

Future<bool> _isRoot() async {
  bool isRoot = false;

  var dir = Directory.current;
  var file = File('${dir.path}/pubspec.yaml');

  if (await file.exists()) {
    isRoot = true;
  }
  return isRoot;
}
