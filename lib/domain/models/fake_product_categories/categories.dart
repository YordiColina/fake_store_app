import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
@immutable
class Categories {
  final List<String> categories;

  const Categories({required this.categories});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
