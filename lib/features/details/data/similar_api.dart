import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/api_urls.dart';
import '../../../features/details/data/similar_dto.dart';
@injectable
class SimilarApi {
   Future<ApiResult<SimilarDto>> getMovieSimilars(int movieId) async {
    try {
      Uri url = Uri.https(ApiUrls.baseUrl, ApiUrls.getMovieSimilars(movieId), {
        "api_key": ApiUrls.apiKey,
      });
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      SimilarDto detailsDto = SimilarDto.fromJson(json);
      return ApiSuccess(detailsDto);
    } catch (e) {
      return ApiFailure(e.toString());
    }
  }
}