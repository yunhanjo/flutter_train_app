import 'package:flutter/material.dart';

class StationlistPage extends StatelessWidget {
  final bool isDeparture;

  StationlistPage({required this.isDeparture, Key? key}) : super(key: key);

  final List<String> stations = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent[50],
      appBar: AppBar(
        title: Text(isDeparture ? '출발역' : '도착역'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: ListView.separated(
        itemCount: stations.length,
        separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
        itemBuilder: (context, index) {
          final stationName = stations[index];
          return Container(
            height: 50,
            child: ListTile(
                title: Text(
                  stationName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context, stationName); // 역 선택 시 값 반환
                },
              
            ),
          );
        },
      ),
    );
  }
}
