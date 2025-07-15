import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'stationlistpage.dart';

class SeatPage extends StatelessWidget {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent[50],
      appBar: AppBar(title: Text('좌석 선택')),

      body: SafeArea(
        child: Column(
          children: [
            Row(
              //출발역도착역
              children: [
                station('수서'),
                Center(
                  child: Icon(Icons.arrow_circle_right_outlined, size: 30),
                ),
                station('부산'),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                //좌석선택박스
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectSeat(),
                  SizedBox(width: 4),
                  Text('선택됨'),
                  SizedBox(width: 20),
                  notselectSeat(),
                  SizedBox(width: 4),
                  Text('선택안됨'),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 10, bottom: 20), //상하패딩
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      rowNum('A'),
                      SizedBox(width: 4),
                      rowNum('B'),
                      SizedBox(width: 4),
                      rowNum(' '),
                      SizedBox(width: 4),
                      rowNum('C'),
                      SizedBox(width: 4),
                      rowNum('D'),
                    ],
                  ),

                  for (int i = 1; i <= 20; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          statefulSeat(),
                          SizedBox(width: 4),
                          statefulSeat(),
                          SizedBox(width: 4),
                          columnNum(i),
                          SizedBox(width: 4),
                          statefulSeat(),
                          SizedBox(width: 4),
                          statefulSeat(),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                child: Text(
                  '예매 하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget columnNum(int num) {
    //열번호
    return Container(
      width: 50,
      height: 50,
      child: Center(child: Text('$num', style: TextStyle(fontSize: 18))),
    );
  }

  Widget rowNum(String alphabet) {
    //행번호
    return Container(
      width: 50,
      height: 50,
      child: Center(child: Text(alphabet, style: TextStyle(fontSize: 18))),
    );
  }

  Expanded station(String stationName) {
    //출발역도착역
    return Expanded(
      child: Center(
        child: Text(
          '$stationName',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Container statefulSeat() {
    //행열좌석
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300]!,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  Container notselectSeat() {
    //선택안된좌석
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.grey[300]!,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  Container selectSeat() {
    //선택된좌석
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
