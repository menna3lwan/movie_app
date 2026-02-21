import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/core/network/api_urls.dart';
import 'package:movie_app/features/search/data/models/search_movie_dto.dart';

@injectable
class SearchApi {
  Future<ApiResult<SearchResponseDto>> searchMovies(String query) async {
    try {
      Uri url = Uri.https(
        ApiUrls.baseUrl,
        ApiUrls.searchMoviesEndpoint,
        {
          "api_key": ApiUrls.apiKey,
          "query": query,
        },
      );

      var response = await http.get(url);
      var json = jsonDecode(response.body);

      SearchResponseDto responseDto =
          SearchResponseDto.fromJson(json);

      return ApiSuccess<SearchResponseDto>(responseDto);
    } catch (e) {

      return ApiFailure<SearchResponseDto>(e.toString());
    }
  }
}
