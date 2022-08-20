import 'package:hive_flutter/adapters.dart';
part 'local_db_model.g.dart';

@HiveType(typeId: 1)
class LocalModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String website;

  LocalModel({
    required this.id,
    required this.name,
    required this.website,
  });

  factory LocalModel.fromJson(Map<String, dynamic> json) => LocalModel(
        id: json['id'],
        name: json['name'],
        website: json['website'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'website': website,
      };
}
