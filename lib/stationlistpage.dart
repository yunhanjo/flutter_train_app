import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//기본 뒤로가기 버튼 사용 (자동)
//Navigator.push로 화면을 이동한 후, 이전 화면으로 돌아가면 자동으로 뒤로가기 버튼이 나타납니다.


class StationlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent[50],
      appBar: AppBar(title: Text('출발역')),

      body: Column(
        children: [
            station('     수서'),
            station('     동탄'),
            station('     평택지제'),
            station('     천안아산'),
            station('     오송'),
            station('     대전'),
            station('     김천구미'),
            station('     동대구'),
            station('     경주'),
            station('     울산'),
            station('     부산'),
        ],
      ),
    );
  }

  Container station(String name) {
    return Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Text(
                '$name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
  }
}