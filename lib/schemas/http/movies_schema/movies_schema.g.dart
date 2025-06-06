// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesSchema _$MoviesSchemaFromJson(Map<String, dynamic> json) => MoviesSchema(
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => Movies.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MoviesSchemaToJson(MoviesSchema instance) =>
    <String, dynamic>{
      'movies': instance.movies,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
    };

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      id: json['id'] as String?,
      title: json['Title'] as String?,
      description: json['Plot'] as String?,
      poster: json['Poster'] as String?,
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'id': instance.id,
      'Title': instance.title,
      'Plot': instance.description,
      'Poster': instance.poster,
    };
