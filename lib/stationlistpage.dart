import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


//역이름리스트 컴포넌트화하기
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
            Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Text(
                  '     수서',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),          
        ],
      ),
    );
  }
}

class StationList {
  List<String> stationName = [
    '     수서',
    '     동탄',
    '     평택지제',
    '     천안아산',
    '     오송',
    '     대전',
    '     김천구미',
    '     동대구',
    '     경주',
    '     울산',
    '     부산',
  ];
}
