import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homepage.dart';

class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;

  const SeatPage({required this.departure, required this.arrival, Key? key})
    : super(key: key);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  // 좌석 선택 상태를 저장할 리스트
  List<List<bool>> seatSelected = List.generate(
    20,
    (_) => List.generate(4, (_) => false),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent[50],
      appBar: AppBar(title: Text('${widget.departure} → ${widget.arrival}')),
      body: SafeArea(
        child: Column(
          children: [
            // 출발역/도착역
            Row(
              children: [
                station(widget.departure),
                Icon(Icons.arrow_circle_right_outlined, size: 30),
                station(widget.arrival),
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
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                itemCount: 20,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        seatBox(i, 0),
                        SizedBox(width: 4),
                        seatBox(i, 1),
                        SizedBox(width: 4),
                        columnNum(i + 1),
                        SizedBox(width: 4),
                        seatBox(i, 2),
                        SizedBox(width: 4),
                        seatBox(i, 3),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (isAnySeatSelected()) {
                    showCupertinoDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        title: Text("예매 확인"),
                        content: Text("예매를 진행하시겠습니까?"),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("취소"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                            child: Text("확인"),
                            onPressed: () {
                              Navigator.pop(context); // 다이얼로그 닫기

                              // 홈 화면(HomePage)만 남기고 모든 이전 화면 제거
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (_) => HomePage()),
                                (route) => false,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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

  // 좌석 한 칸
  Widget seatBox(int row, int col) {
    bool selected = seatSelected[row][col];
    return GestureDetector(
      onTap: () {
        setState(() {
          seatSelected[row][col] = !seatSelected[row][col];
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: selected ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // 좌석 번호
  Widget columnNum(int num) {
    return Container(
      width: 50,
      height: 50,
      child: Center(child: Text('$num', style: TextStyle(fontSize: 18))),
    );
  }

  // A, B, C, D 열 이름
  Widget rowNum(String alphabet) {
    return Container(
      width: 50,
      height: 50,
      child: Center(child: Text(alphabet, style: TextStyle(fontSize: 18))),
    );
  }

  // 출발/도착역 표시
  Expanded station(String stationName) {
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

  // 좌석 상태 안내 - 선택된 좌석
  Widget selectSeat() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  // 좌석 상태 안내 - 선택 안된 좌석
  Widget notselectSeat() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  // 하나라도 좌석 선택되었는지 확인
  bool isAnySeatSelected() {
    for (var row in seatSelected) {
      if (row.contains(true)) return true;
    }
    return false;
  }
}
