import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inning/core/data/mock/stadiums_mock.dart';

class UploadStadiumsPage extends StatelessWidget {
  const UploadStadiumsPage({super.key});

  Future<void> uploadMockStadiums() async {
    final firestore = FirebaseFirestore.instance;

    for (final stadium in mockStadiums) {
      await firestore
          .collection('stadiums')
          .doc(stadium.id)
          .set(stadium.toJson());
      print('✅ ${stadium.name} 업로드 완료');
    }

    print('🎉 모든 stadiums 업로드 완료!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stadiums 업로드')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await uploadMockStadiums();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('모든 stadiums 업로드 완료!')));
          },
          child: Text('업로드 실행'),
        ),
      ),
    );
  }
}
