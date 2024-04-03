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
  // {"activity":"Make your own LEGO creation","type":"recreational","participants":1,"price":0,"link":"","key":"1129748","accessibility":0.1}
  final String activity;
  final String type;
  final int participants;
  final int price;
  final String link;
  final String key;
  final double accessibility;

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
