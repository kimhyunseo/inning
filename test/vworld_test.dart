import 'package:flutter_test/flutter_test.dart';
import 'package:inning/core/repository/vworld_repository.dart';

void main() {
  final vworld = VworldRepository();

  test('Vworld : findName test', () async {
    final result = await vworld.findName('연희동');
    expect(result.isEmpty, false);

    final result2 = await vworld.findName('ddd');
    expect(result2.isEmpty, true);
  });

  test('Vworld : findByLatLog test', () async {
    final result = await vworld.findByLatLog(36.547641, 126.6666066);
    print(result);
    expect(result.isEmpty, false);

    final result2 = await vworld.findByLatLog(36.547641, 126.6666066);
    print(result2);
    expect(result2.isEmpty, false);
  });
}
