
import '../../../../core/constants/common_strings.dart';

class DetailsEntity {
  final bool adult;
  final String backdropPath;
  final BelongsToCollectionEntity belongsToCollection;
  final int budget;
  final List<GenreEntity> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompanyEntity> productionCompanies;
  final List<ProductionCountryEntity> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguageEntity> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const DetailsEntity({
    this.adult = false,
    this.backdropPath = "",
    this.belongsToCollection = const BelongsToCollectionEntity(),
    this.budget = 0,
    this.genres = const [],
    this.homepage = '',
    this.id = 0,
    this.imdbId = '',
    this.originCountry = const [],
    this.originalLanguage = '',
    this.originalTitle = CommonStrings.notAvailable,
    this.overview = CommonStrings.notAvailable,
    this.popularity = 0.0,
    this.posterPath = "",
    this.productionCompanies = const [],
    this.productionCountries = const [],
    this.releaseDate = '',
    this.revenue = 0,
    this.runtime = 0,
    this.spokenLanguages = const [],
    this.status = '',
    this.tagline = '',
    this.title = CommonStrings.notAvailable,
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });
}
class BelongsToCollectionEntity {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  const BelongsToCollectionEntity({
    this.id = 0,
    this.name = '',
    this.posterPath = "",
    this.backdropPath ="",
  });
}
class GenreEntity {
  final int id;
  final String name;

  const GenreEntity({
    this.id = 0,
    this.name = CommonStrings.notAvailable,
  });
}
class ProductionCompanyEntity {
  final int id;
  final String name;
  final String logoPath;
  final String originCountry;

  const ProductionCompanyEntity({
    this.id = 0,
    this.name = CommonStrings.notAvailable,
    this.logoPath = "",
    this.originCountry = CommonStrings.notAvailable,
  });
}
class ProductionCountryEntity {
  final String iso31661;
  final String name;

  const ProductionCountryEntity({
    this.iso31661 = '',
    this.name = CommonStrings.notAvailable,
  });
}
class SpokenLanguageEntity {
  final String englishName;
  final String iso6391;
  final String name;

  const SpokenLanguageEntity({
    this.englishName = CommonStrings.notAvailable,
    this.iso6391 = '',
    this.name = CommonStrings.notAvailable,
  });
}
