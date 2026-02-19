import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../core/network/api_urls.dart';
import 'movies_response_dto.dart';

@injectable
class TopRatedApi {
  static Future<MoviesResponseDto> getTopRatedMovies() async {
    try {
      final url = Uri.https(ApiUrls.baseUrl, ApiUrls.topRatedEndpoint, {
        'api_key': ApiUrls.apiKey,
      });
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      return MoviesResponseDto.fromJson(json);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
