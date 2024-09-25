import 'package:reflectable/reflectable.dart';

class ClassReflectable extends Reflectable{
  const ClassReflectable() : super(invokingCapability, declarationsCapability, newInstanceCapability);
}

const reflector = ClassReflectable();