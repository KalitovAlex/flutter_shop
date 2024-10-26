import 'package:freezed_annotation/freezed_annotation.dart';

part 'concert_model.freezed.dart';
part 'concert_model.g.dart';

@freezed
class ConcertModel with _$ConcertModel {
  const factory ConcertModel({
    required String uuid,
    required String title,
    required String date,
    required List<String> images,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String place, // Добавлено поле "place"
    required int price, // Добавлено поле "price"
  }) = _ConcertModel;

  factory ConcertModel.fromJson(Map<String, dynamic> json) =>
      _$ConcertModelFromJson(json);
}
