import 'package:equatable/equatable.dart';

class LocalBoredModel extends Equatable {
  const LocalBoredModel(
      {required this.activity,
      required this.type,
      required this.participants,
      required this.price,
      required this.link,
      required this.key,
      required this.accessibility,});

  final String activity;
  final String type;
  final String participants;
  final int price;
  final String link;
  final String key;
  final String accessibility;

  @override
  List<Object?> get props =>
      [activity, type, participants, price, link, key, accessibility];

  @override
  String toString() {
    return 'LocalBoredModel{activity: $activity, type: $type, participants:'
        ' $participants, price: $price, link: $link, key: $key, accessibility:'
        ' $accessibility}';
  }
}
