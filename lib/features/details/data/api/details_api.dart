import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_urls.dart';
import '../models/details_dto.dart';
import 'package:injectable/injectable.dart';


@injectable
class DetailsApi {
   Future<ApiResult<DetailsDto>> getMovieDetails(int movieId) async {
    try {
      Uri url = Uri.https(ApiUrls.baseUrl, ApiUrls.getMovieDetails(movieId), {
        "api_key": ApiUrls.apiKey,
      });
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      DetailsDto detailsDto = DetailsDto.fromJson(json);
      return ApiSuccess(detailsDto);
    } catch (e) {
      log(e.toString());
      return ApiFailure(e.toString());
    }
  }
}
