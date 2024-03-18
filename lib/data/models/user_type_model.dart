import 'package:equatable/equatable.dart';
import 'package:task/core/helpers/typedefs.dart';

class UserTypeModel extends Equatable {
  const UserTypeModel({
    required this.value,
    required this.label,
  });

  factory UserTypeModel.fromMap(DataMap map) {
    return UserTypeModel(
      value: map['value'] as int,
      label: map['label'] as String,
    );
  }

  final int value;
  final String label;

  @override
  List<Object> get props => [value, label];
}

class UserTypes {
  List<UserTypeModel> userTpes = [];
}
