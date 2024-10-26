import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@HiveType(typeId: 1)
class UserModel with _$UserModel {
  const factory UserModel({
    @HiveField(0) required String uuid,
    @HiveField(1) required String email,
    @HiveField(2) String? password,
    @HiveField(3) required DateTime createdAt,
    @HiveField(4) required DateTime updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
