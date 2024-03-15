import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:task/core/helpers/typedefs.dart';

class UserModel extends Equatable {
  const UserModel();

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as DataMap);

  factory UserModel.fromMap(DataMap map) {
    return const UserModel();
  }

  DataMap toMap() {
    return {};
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [];
}
