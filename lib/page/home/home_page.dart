import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/widgets/common_app_bar.dart';
import 'package:inning/page/home/home_view_model.dart';
import 'package:inning/page/home/widgets/inside_stadium.dart';
import 'package:inning/page/home/widgets/location_permission_card.dart';
import 'package:inning/page/home/widgets/outside_stadium_card.dart';

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
      HomeLocationState.permissionRequired => const LocationPermissionCard(),
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
            onPressed: () {
              setState.setPermissionRequired();
            },
            child: const Text('권한'),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            onPressed: () {
              setState.setOutsideStadium();
            },
            child: const Text('밖'),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            onPressed: () {
              setState.setInsideStadium();
            },
            child: const Text('안'),
          ),
        ],
      ),

      bottomSheet: state.locationState == HomeLocationState.insideStadium
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16).copyWith(bottom: 32),
                child: ElevatedButton(
                  onPressed: () {},
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
