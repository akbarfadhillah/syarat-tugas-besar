import 'package:dio/dio.dart';
import 'package:appsi/model/data/photo_list.dart';
import '../core/api_provider.dart';

class PhotoRepository extends ApiProvider {
  Future<List<Photo>> photos({
    required int page,
  }) async {
    try {
      Response response = await dio.get('photos?page=$page',
          options: Options(responseType: ResponseType.json));
      List<dynamic> listData = response.data;
      return listData.map((e) => Photo.fromJson(e)).toList();
    } on DioError catch (e) {
      Map<String, dynamic> res = e.response?.data;
      final photoError = Photo.error(
        errorMessage: res['error'].toString(),
      );
      return [photoError];
    }
  }
}
