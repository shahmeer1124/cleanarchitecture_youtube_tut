import 'package:testproj/core/utils/typedef.dart';
import 'package:testproj/src/unbored/domain/entities/bored.dart';

class BoredDataModel extends LocalBoredModel {
  const BoredDataModel({
    required super.activity,
    required super.type,
    required super.participants,
    required super.price,
    required super.link,
    required super.key,
    required super.accessibility,
  });

  BoredDataModel.fromJson(DataMap map)
      : this(
            activity: map['activity'] as String? ?? '',
            type: map['type'] as String? ?? '',
            participants: map['participants'] as int? ?? 1,
            price: _toInt(map['price']),
            link: map['link'] as String? ?? '',
            key: map['key'] as String? ?? '',
            accessibility: _toDouble(map['accessibility']),);
  static int _toInt(dynamic value) {
    if (value == null) {
      return 1; // Default value
    } else if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else if (value is String) {
      return int.tryParse(value) ?? 1; // Default value
    } else {
      return 1; // Default value for any other case
    }
  }

  static double _toDouble(dynamic value) {
    if (value == null) {
      return 0.1; // Default value
    } else if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value) ?? 0.1; // Default value
    } else {
      return 0.1; // Default value for any other case
    }
  }
}
