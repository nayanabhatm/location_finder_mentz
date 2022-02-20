import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String type;
  final int quality;
  final String placeName;

  const Location({
    required this.name,
    required this.type,
    required this.quality,
    required this.placeName,
  });

  @override
  List<Object> get props => [
        name,
        type,
        quality,
        placeName,
      ];

  static Location fromJson(dynamic json) {
    return Location(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      quality: json['matchQuality'] ?? 0,
      placeName: json['disassembledName'] ?? '',
    );
  }
}
