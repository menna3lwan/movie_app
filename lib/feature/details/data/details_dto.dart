
import 'package:movie_app/feature/details/domain/entity/details_entity.dart';

class DetailsDto {
  final bool adult;
  final String? backdropPath;
  final BelongsToCollectionDto? belongsToCollection;
  final int budget;
  final List<GenreDto> genres;
  final String homepage;
  final int id;
  final String? imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanyDto> productionCompanies;
  final List<ProductionCountryDto> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguageDto> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  DetailsDto({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory DetailsDto.fromJson(Map<String, dynamic> json) {
    return DetailsDto(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? BelongsToCollectionDto.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'] ?? 0,
      genres: (json['genres'] as List? ?? [])
          .map((e) => GenreDto.fromJson(e))
          .toList(),
      homepage: json['homepage'] ?? '',
      id: json['id'] ?? 0,
      imdbId: json['imdb_id'],
      originCountry:
          (json['origin_country'] as List? ?? []).map((e) => e.toString()).toList(),
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      productionCompanies:
          (json['production_companies'] as List? ?? [])
              .map((e) => ProductionCompanyDto.fromJson(e))
              .toList(),
      productionCountries:
          (json['production_countries'] as List? ?? [])
              .map((e) => ProductionCountryDto.fromJson(e))
              .toList(),
      releaseDate: json['release_date'] ?? '',
      revenue: json['revenue'] ?? 0,
      runtime: json['runtime'] ?? 0,
      spokenLanguages:
          (json['spoken_languages'] as List? ?? [])
              .map((e) => SpokenLanguageDto.fromJson(e))
              .toList(),
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }
  DetailsEntity toEntity() {
  return DetailsEntity(
    adult: adult,
    backdropPath: backdropPath ?? '',
    belongsToCollection: belongsToCollection?.toEntity() ??
        const BelongsToCollectionEntity(),
    budget: budget,
    genres: genres.map((e) => e.toEntity()).toList(),
    homepage: homepage,
    id: id,
    imdbId: imdbId ?? '',
    originCountry: originCountry,
    originalLanguage: originalLanguage,
    originalTitle: originalTitle,
    overview: overview,
    popularity: popularity,
    posterPath: posterPath ?? '',
    productionCompanies:
        productionCompanies.map((e) => e.toEntity()).toList(),
    productionCountries:
        productionCountries.map((e) => e.toEntity()).toList(),
    releaseDate: releaseDate,
    revenue: revenue,
    runtime: runtime,
    spokenLanguages:
        spokenLanguages.map((e) => e.toEntity()).toList(),
    status: status,
    tagline: tagline,
    title: title,
    video: video,
    voteAverage: voteAverage,
    voteCount: voteCount,
  );
}

}

class BelongsToCollectionDto {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  BelongsToCollectionDto({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory BelongsToCollectionDto.fromJson(Map<String, dynamic> json) {
    return BelongsToCollectionDto(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }
  BelongsToCollectionEntity toEntity() {
  return BelongsToCollectionEntity(
    id: id,
    name: name,
    posterPath: posterPath ?? '',
    backdropPath: backdropPath ?? '',
  );
}

}

class GenreDto {
  final int id;
  final String name;

  GenreDto({
    required this.id,
    required this.name,
  });

  factory GenreDto.fromJson(Map<String, dynamic> json) {
    return GenreDto(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
  GenreEntity toEntity() {
  return GenreEntity(
    id: id,
    name: name,
  );
}

}

class ProductionCompanyDto {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompanyDto({
    required this.id,
    required this.name,
    required this.logoPath,
    required this.originCountry,
  });

  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyDto(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logoPath: json['logo_path'],
      originCountry: json['origin_country'] ?? '',
    );
  }
  ProductionCompanyEntity toEntity() {
  return ProductionCompanyEntity(
    id: id,
    name: name,
    logoPath: logoPath ?? '',
    originCountry: originCountry,
  );
}

}

class ProductionCountryDto {
  final String iso31661;
  final String name;

  ProductionCountryDto({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountryDto.fromJson(Map<String, dynamic> json) {
    return ProductionCountryDto(
      iso31661: json['iso_3166_1'] ?? '',
      name: json['name'] ?? '',
    );
  }
  ProductionCountryEntity toEntity() {
  return ProductionCountryEntity(
    iso31661: iso31661,
    name: name,
  );
}

}

class SpokenLanguageDto {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguageDto({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageDto.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageDto(
      englishName: json['english_name'] ?? '',
      iso6391: json['iso_639_1'] ?? '',
      name: json['name'] ?? '',
    );
  }
  SpokenLanguageEntity toEntity() {
  return SpokenLanguageEntity(
    englishName: englishName,
    iso6391: iso6391,
    name: name,
  );
}

}
