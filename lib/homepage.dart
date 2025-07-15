import 'package:flutter/material.dart';
import 'stationlistpage.dart';
import 'seatpage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departureStation;
  String? arrivalStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('기차 예매'),
        backgroundColor: Colors.purpleAccent[50],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //세로중앙정렬
          children: [
            Container( //whitebox
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => StationlistPage(isDeparture: true),
                            ),
                          );
                          if (result != null && result is String) {
                            setState(() {
                              departureStation = result;
                            });
                          }
                        } catch (e) {
                          _showError(context, '출발역 선택 중 오류가 발생했습니다.');
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('출발역',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            departureStation ?? '선택',
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 2, height: 50, color: Colors.grey[400]),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => StationlistPage(isDeparture: false),
                            ),
                          );
                          if (result != null && result is String) {
                            setState(() {
                              arrivalStation = result;
                            });
                          }
                        } catch (e) {
                          _showError(context, '도착역 선택 중 오류가 발생했습니다.');
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('도착역',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            arrivalStation ?? '선택',
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // 예외 처리: 출발역/도착역 선택 여부 확인
                  if (departureStation == null || arrivalStation == null) {
                    _showSnackBar(context, '출발역과 도착역을 모두 선택하세요');
                    return;
                  }

                  // 예외 처리: 출발역과 도착역이 동일한 경우
                  if (departureStation == arrivalStation) {
                    _showSnackBar(context, '출발역과 도착역은 달라야 합니다');
                    return;
                  }

                  // 정상 이동
                  try {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SeatPage(
                          departure: departureStation!,
                          arrival: arrivalStation!,
                        ),
                      ),
                    );
                  } catch (e) {
                    _showError(context, '좌석 선택 화면으로 이동 중 오류가 발생했습니다.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),),
                child: Text(
                  '좌석 선택',
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
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}

void _showError(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('오류'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('확인'),
        ),
      ],
    ),
  );
}
