import 'dart:convert';

import 'package:reflectable/reflectable.dart';
import '../reflectable/class_reflectable.dart';

@reflector
class SerializableModel {
  SerializableModel();

  SerializableModel.all();

  Future<dynamic> fromJson(Map<String, dynamic> json, Object obj) async {
    ClassMirror classMirror =
    reflector.reflectType(obj.runtimeType) as ClassMirror;

    Map<Symbol, dynamic> namedArguments = {};
    for (var data in json.keys) {
      namedArguments.addAll({Symbol(data): json[data]});
    }

    Object newObject = classMirror.newInstance('all', [], namedArguments);

    return newObject;
  }

  Future<dynamic> fromRawJson(String str, Object obj) async =>
      await fromJson(json.decode(str), obj);

  Map<String, dynamic> toJson<O>() {
    Map<String, dynamic> json = {};
    ClassMirror classMirror = reflector.reflectType(O) as ClassMirror;
    InstanceMirror instance = reflector.reflect(this);

    Map<String, MethodMirror> members = classMirror.instanceMembers;
    for (var member in members.keys) {
      if (members[member]!.isGetter) {
        json.addAll({member: instance.invokeGetter(member)});
      }
    }
    List<String> deleteCodes = [
      'hashCode',
      'runtimeType'
    ];
    json.removeWhere((key, value) => deleteCodes.contains(key),);

    return json;
  }
}
