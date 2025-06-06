// ignore_for_file: library_private_types_in_public_api

import 'package:json_annotation/json_annotation.dart';
import 'package:sinflix_app/core/network_exception_handler.dart';
part 'movies_schema.g.dart';

@JsonSerializable()
class MoviesSchema extends NetworkSchema<MoviesSchema> {
  List<Movies>? movies;
  int? totalPages;
  int? currentPage;

  MoviesSchema({this.movies, this.totalPages, this.currentPage});
  factory MoviesSchema.fromJson(Map<String, dynamic> json) =>
      _$MoviesSchemaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MoviesSchemaToJson(this);

  @override
  MoviesSchema fromJson(Map<String, dynamic> json) {
    return MoviesSchema.fromJson(json);
  }
}

@JsonSerializable()
class Movies {
  String? id;
  @JsonKey(name: "Title")
  String? title;
  @JsonKey(name: "Plot")
  String? description;
  @JsonKey(name: "Poster")
  String? poster;

  Movies({
    this.id,
    this.title,
    this.description,
    this.poster,
  });
  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
