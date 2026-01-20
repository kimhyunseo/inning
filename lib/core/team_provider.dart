import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/data/mock/team_mock.dart';
import 'package:inning/core/model/team.dart';

final teamListProvider = Provider<List<Team>>((ref) {
  return mockTeams;
});
