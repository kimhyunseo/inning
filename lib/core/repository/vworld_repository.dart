import 'package:dio/dio.dart';
import 'package:inning/core/geolocator_helper.dart';

// 네트워크 통신. 상태관리는 뷰모델에서 해야한다.
class VworldRepository {
  // 공통으로 쓸 수 있는 클라이언트 객체

  final Dio _client = Dio(
    BaseOptions(
      // 설정 안할 시 API 실패 응답오면 throw 던져서 에러가 남
      validateStatus: (status) => true,
    ),
  );

  // 구현 메서드 2가지

  // 1. 이름으로 검색하는 기능
  // Response > result > items >> title
  Future<List<String>> findName(String query) async {
    try {
      final response = await _client.get(
        'https://api.vworld.kr/req/search',

        // map 형태로 줄 수 있어서 편리하다.
        queryParameters: {
          'request': 'search',
          'key': '63F63EA2-EA2C-3A2C-AD0B-DFDA1B329076',
          'query': query,
          'type': 'DISTRICT',
          'category': 'L4',
        },
      );

      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        // Response > result > items >> title
        final items = response.data['response']['result']['items'];
        // List타입으로 바꿔주기
        final itemList = List.from(items);
        final iterable = itemList.map((item) {
          //
          return '${item['title']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  // 2. 위도 경도로 검색하는 기능
  // Respons > result > features >> properties > full_nm
  Future<List<String>> findByLatLog(double lat, double lng) async {
    try {
      final response = await _client.get(
        'https://api.vworld.kr/req/data',
        queryParameters: {
          'request': 'GetFeature',
          'key': '63F63EA2-EA2C-3A2C-AD0B-DFDA1B329076',
          'data': 'LT_C_ADEMD_INFO',
          'geomFilter': 'POINT($lng $lat)',
          'geometry': false,
          'size': 100,
        },
      );
      // print(response.statusCode); // 200 이 잘 옴
      // print(response.data['response']['status']); // 에러
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        // print(response.data);
        // Respons > result > featureCollection >features >> properties > full_nm
        final features = response
            .data['response']['result']['featureCollection']['features'];
        // print(features);
        final featureList = List.from(features);
        // print(featureList);
        final Iterable = featureList.map((feat) {
          return '${feat['properties']['full_nm']}';
        });
        return Iterable.toList();
      }
      // response가 성공이 아닐 때
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}

// 사용자의 현재 위치를 가지고 데이터 조회
class LocationService {
  final VworldRepository _repository = VworldRepository();

  // 현재 위치를 기반으로 시 구 형태의 주소를 가지고 오는 함수
  Future<String?> getCurrentDistrict() async {
    try {
      // 1. gps 위치 가져오기
      final position = await GeolocatorHelper.getPosition();
      if (position == null) return '위치 정보를 가져올 수 없습니다.';

      // 2. V월드 API로 행정동 정보조회
      final List<String> addressList = await _repository.findByLatLog(
        position.latitude,
        position.longitude,
      );

      if (addressList.isNotEmpty) {
        // addressList.first 결과 예시: 서울시 서초구 서초동
        final fullAdress = addressList.first;

        // 서울 서초구 형태로 출력
        final parts = fullAdress.split(' ');
        if (parts.length >= 2) {
          // 서울특별시를 서울로 줄이고 싶을 때
          final city = parts[0].substring(0, 2);
          // 서초구
          final district = parts[1];
          return '$city $district';
        }
        return fullAdress;
      }
      // 주소를 찾을 수 없을 때
      return '알 수 없음';
    } catch (e) {
      print('현재 위치: $e');
      return null;
    }
  }
}
