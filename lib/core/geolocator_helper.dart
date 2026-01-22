import 'package:geolocator/geolocator.dart';

// 홈화면 위치권한요청 버튼과 연결하기
/// 유저의 현재 위치 위도 경도를 가져온다.
class GeolocatorHelper {
  // 메서드. 클래스 생성없이 바로 접근
  static Future<Position?> getPosition() async {
    final permmision = await Geolocator.checkPermission();
    // 1. 권한이 허용되지 않았을 때 권한 요청하기
    if (permmision == LocationPermission.denied ||
        permmision == LocationPermission.deniedForever) {
      // 2. 권한요청 후 결과가 거부일 때 리턴하기
      final permission2 = await Geolocator.requestPermission();
      if (permission2 == LocationPermission.denied ||
          permission2 == LocationPermission.deniedForever) {
        return null;
      }
    }

    // 3. Geolocator로 위치 가져와서 리턴
    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        // 배터리 소모. 정확도를 중간으로 낮춤
        accuracy: LocationAccuracy.medium,
        // 몇 미터 이동마다 값을 갱신하라는 뜻. 효율면에서 분 단위 보다는 위치에 따라 GPS를 갱신하는 방법이 낫다.
        distanceFilter: 200,
      ),
    );
    return position;
  }
}
