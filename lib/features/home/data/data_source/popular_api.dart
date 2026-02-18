import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/core/network/api_urls.dart';
import 'package:movie_app/features/home/data/models/movies_response_dto.dart';

class PopularApi {
  static Future<ApiResult<MoviesResponseDto>> getPopularMovies() async {
    try {
      Uri url = Uri.https(ApiUrls.baseUrl, ApiUrls.popularEndpoint, {
        "api_key": ApiUrls.apiKey,
      });
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      MoviesResponseDto moviesResponse = MoviesResponseDto.fromJson(json);
      return ApiSuccess(moviesResponse);
    } catch (e) {
      log(e.toString());
      return ApiFailure(e.toString());
    }
  }
}
