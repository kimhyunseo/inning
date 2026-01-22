import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/widgets/common_app_bar.dart';
import 'package:inning/page/home/home_view_model.dart';
import 'package:inning/page/home/stadium_view_model.dart';
import 'package:inning/page/home/team_view_model.dart';
import 'package:inning/page/home/widgets/inside_stadium.dart';
import 'package:inning/page/home/widgets/location_permission_card.dart';
import 'package:inning/page/home/widgets/outside_stadium_card.dart';
import 'package:inning/page/welcome/welcome_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    final setState = ref.read(homeViewModelProvider.notifier);

    Widget card = switch (state.locationState) {
      // 권한요청 팝업 띄우기. 홈페이지에서 함수 전달
      HomeLocationState.permissionRequired => LocationPermissionCard(
        onPermissionRequest: () {
          // 홈뷰모델 홈노티파이어. 위치상태변경. 실제위치요청 로직 홈버튼 눌렀을 때 실행
          ref.read(homeViewModelProvider.notifier).requestLocationAndAdress();
        },
      ),
      HomeLocationState.outsideStadium => const OutsideStadiumCard(),
      HomeLocationState.insideStadium => const InStadium(),
    };

    return Scaffold(
      appBar: CommonAppBar(
        title: "Home",
        actionIcon: Icons.person,
        onActionTap: () {},
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'permission',
            onPressed: () {
              setState.setPermissionRequired();
            },
            child: const Text('권한'),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            heroTag: 'outside',
            onPressed: () {
              setState.setOutsideStadium();
            },
            child: const Text('밖'),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            heroTag: 'inside',
            onPressed: () {
              setState.setInsideStadium();
            },
            child: const Text('안'),
          ),
          const SizedBox(height: 16),
          //임시 경기장 선택 버튼
          FloatingActionButton.small(
            heroTag: 'stadium',
            onPressed: () async {
              final stadiumVM = ref.read(stadiumViewModelProvider.notifier);
              final teamVM = ref.read(teamViewModelProvider.notifier);

              // 데이터를 먼저 가져오기
              await Future.wait([stadiumVM.loadStadiums(), teamVM.loadTeams()]);

              final stadiumState = ref.read(stadiumViewModelProvider);

              if (stadiumState.stadiums.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('경기장 데이터를 불러오지 못했습니다.')),
                );
                return;
              }

              if (mounted) {}
              // 가져온 데이터로 BottomSheet 열기
              showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  final stadiums = stadiumState.stadiums;
                  return ListView(
                    children: stadiums
                        .map(
                          (s) => ListTile(
                            title: Text(s.name),
                            onTap: () {
                              ref
                                  .read(stadiumViewModelProvider.notifier)
                                  .setCurrentStadium(s);
                              Navigator.pop(ctx);
                            },
                          ),
                        )
                        .toList(),
                  );
                },
              );
            },
            child: const Icon(Icons.sports_baseball),
          ),
        ],
      ),

      bottomSheet: state.locationState == HomeLocationState.insideStadium
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16).copyWith(bottom: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomePage();
                        },
                      ),
                    );
                  },
                  child: const Text("입장하기"),
                ),
              ),
            )
          : null,

      body: state.locationState == HomeLocationState.insideStadium
          ? card
          : Align(alignment: const Alignment(0, -0.3), child: card),
    );
  }
}
