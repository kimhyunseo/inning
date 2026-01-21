// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UploadTeamsPage extends StatelessWidget {
//   UploadTeamsPage({super.key});

//   final List<Map<String, String>> teams = [
//     {
//       "id": "lg",
//       "name": "엘지 트윈스",
//       "logoAsset": "assets/images/teams/lg_twins/logo.webp",
//       "emblemAsset": "assets/images/teams/lg_twins/emblem.webp",
//     },
//     {
//       "id": "doosan",
//       "name": "두산 베어스",
//       "logoAsset": "assets/images/teams/doosan_bears/logo.webp",
//       "emblemAsset": "assets/images/teams/doosan_bears/emblem.webp",
//     },
//     {
//       "id": "kiwoom",
//       "name": "키움 히어로즈",
//       "logoAsset": "assets/images/teams/kiwoom_heroes/logo.webp",
//       "emblemAsset": "assets/images/teams/kiwoom_heroes/emblem.webp",
//     },
//     {
//       "id": "ssg",
//       "name": "SSG 랜더스",
//       "logoAsset": "assets/images/teams/ssg_landers/logo.webp",
//       "emblemAsset": "assets/images/teams/ssg_landers/emblem.webp",
//     },
//     {
//       "id": "kt",
//       "name": "KT 위즈",
//       "logoAsset": "assets/images/teams/kt_wiz/logo.webp",
//       "emblemAsset": "assets/images/teams/kt_wiz/emblem.webp",
//     },
//     {
//       "id": "kia",
//       "name": "KIA 타이거즈",
//       "logoAsset": "assets/images/teams/kia_tigers/logo.webp",
//       "emblemAsset": "assets/images/teams/kia_tigers/emblem.webp",
//     },
//     {
//       "id": "samsung",
//       "name": "삼성 라이온즈",
//       "logoAsset": "assets/images/teams/samsung_lions/logo.webp",
//       "emblemAsset": "assets/images/teams/samsung_lions/emblem.webp",
//     },
//     {
//       "id": "lotte",
//       "name": "롯데 자이언츠",
//       "logoAsset": "assets/images/teams/lotte_giants/logo.webp",
//       "emblemAsset": "assets/images/teams/lotte_giants/emblem.webp",
//     },
//     {
//       "id": "nc",
//       "name": "NC 다이노스",
//       "logoAsset": "assets/images/teams/nc_dinos/logo.webp",
//       "emblemAsset": "assets/images/teams/nc_dinos/emblem.webp",
//     },
//     {
//       "id": "hanwha",
//       "name": "한화 이글스",
//       "logoAsset": "assets/images/teams/hanwha_eagles/logo.webp",
//       "emblemAsset": "assets/images/teams/hanwha_eagles/emblem.webp",
//     },
//   ];

//   Future<void> uploadTeams() async {
//     final firestore = FirebaseFirestore.instance;
//     for (var team in teams) {
//       await firestore
//           .collection('teams')
//           .doc(team['id'])
//           .set({
//             'name': team['name'],
//             'logoAsset': team['logoAsset'],
//             'emblemAsset': team['emblemAsset'],
//           })
//           .then((_) => print('✅ 업로드 완료: ${team['id']}'))
//           .catchError((e) => print('❌ 업로드 실패: ${team['id']} - $e'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('팀 업로드')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await uploadTeams();
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(const SnackBar(content: Text('모든 팀 업로드 완료!')));
//           },
//           child: const Text('팀 데이터 Firestore 업로드'),
//         ),
//       ),
//     );
//   }
// }
