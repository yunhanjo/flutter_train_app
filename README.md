<h1 align="center"> 🚄 flutter_train_app </h1> 

<div align="center">
  <img width="508" height="338" alt="트슈1" src="https://github.com/user-attachments/assets/540938a9-13f3-4d3a-8de2-5b7d3a9268bb" />
  <img width="508" height="538" alt="스크린샷 2025-07-16 20 59 36" src="https://github.com/user-attachments/assets/88ed9e70-9416-4781-a477-936b719785f3" />
</div>
<br>

<h3 align="center"> [Flutter 기초] 개인 과제 - 기차 예매 서비스 </h3>
<p align="center"> 프로젝트 일정 [ 25/07/07 ~ 25/07/16 ] </p>
<br>
<br>
<br>

## 프로젝트 개요
💡 기차 출발역과 도착역을 선택해 좌석을 예매하는 어플
- 실무처럼 UI 명세서와 앱 화면 flow를 보고 정확하게 화면 구성하기  
- 예외 처리를 통해 특수 상황에서 프로그램이 종료되지 않도록 하기  
- 코드의 재사용성과 가독성을 높이기 위해 함수와 클래스를 적절히 활용하기
<br>

## ✅ 완료한 필수 기능
### 1. HomePage
- 출발역 및 도착역 선택 가능
- StationListPage로 이동하여 역 선택
- 출발역/도착역 선택 후 → SeatPage로 이동
- 미선택 상태일 경우 예외 처리(SnackBar 알림)

### 2. StationListPage
- AppBar에 "출발역" 또는 "도착역" 출력
- 고정 역 리스트:<br>
수서, 동탄, 평택지제, 천안아산, 오송, 대전, 김천구미, 동대구, 경주, 울산, 부산
- 역 선택 시 이전 페이지로 돌아가면서 선택된 역 전달
- 뒤로가기 시 선택 없이 복귀 가능

### 3. SeatPage
- 출발역 / 도착역 정보를 상단에 출력
- 좌석 선택 UI 제공 (20줄 × 4칸)
- 좌석 선택 시 회색 → 보라색 변경
- [예매하기] 버튼 :
  - 좌석 선택 없으면 무반응
  - 좌석 선택 시 CupertinoDialog로 확인
    - "확인" 클릭 시 → HomePage로 이동 (pop 2번 or pushAndRemoveUntil)
    - "취소" 클릭 시 → Dialog만 닫힘
<br>

## 🚀 완료한 도전 기능
### 1. 위젯 컴포넌트화
- 반복 UI 요소 (버튼, 좌석 등) 별도 위젯으로 분리
- 가독성과 유지보수성 향상

### 2. UX 개선: 출발역/도착역 중복 방지
- 출발역 선택 후 → 도착역 선택 시 동일 역 제외
- 도착역 선택 후 → 출발역 선택 시 동일 역 제외
<br>

## 📌 기타 기술 사항
- Flutter 기본 위젯 활용
- 상태관리: setState
- 페이지 간 데이터 전달: Navigator.push + async/await
- 예외 처리: null 체크 및 SnackBar/AlertDialog 사용
- UI 개선: BoxDecoration, Alignment, Expanded 등 활용
<br>

## 🔥Trouble Shooting
### 1. Container에서 아래쪽 테두리만 색 지정하기
- 문제:
Container에 decoration 속성을 사용해 아래쪽 테두리만 색을 넣으려고 했으나, child 위치가 잘못되어 오류가 발생함.

- 해결책:
child를 항상 decoration 뒤에 배치해야 오류가 발생하지 않음. 즉, Container의 decoration을 먼저 정의하고, child를 그 다음에 배치.  
Container(  
  height: 50,  
  decoration: BoxDecoration(  
    border: Border(  
      bottom: BorderSide(color: Colors.grey[300]!),  
    ),  
  ),  
  child: Text(  
    '수서',  
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),  
  ),  
)  
- 개선점:
child 위치를 바꾸어 코드 오류를 해결하고, Container 위젯의 설정을 더 깔끔하게 작성할 수 있음.
<br>

### 2. Container 안 텍스트 위치 조정 (왼쪽 위 → 왼쪽 중앙으로)
- 문제: Container 내부에서 텍스트를 왼쪽 위에서 왼쪽 중앙으로 이동하고 싶음.

- 해결책: Container의 alignment 속성에 Alignment.centerLeft 값을 설정하여 텍스트를 왼쪽 중앙에 배치.  
Container(  
  height: 50,  
  alignment: Alignment.centerLeft, // 왼쪽 중앙 정렬  
  child: Text('수서'),  
)  
- 개선점: 텍스트가 의도한 위치에 정확히 배치되어 UI 레이아웃이 직관적으로 개선됨.
<br>

### 3. Column 안 ListView에서 높이 관련 런타임 에러
- 문제: Column 안에 ListView를 직접 넣으면 "Vertical viewport was given unbounded height" 런타임 오류가 발생함.

- 해결책: ListView를 Expanded 또는 SizedBox로 감싸 높이를 제한하여 오류를 방지.  
Expanded(  
  child: ListView(  
    padding: EdgeInsets.symmetric(vertical: 20),  
    children: [...],  
  ),  
)  
- 개선점: 스크롤 가능한 영역을 명확하게 제한함으로써 오류를 방지하고, 화면 크기 제약을 설정해 안정적인 UI 구성이 가능함.
<br>

### 4. 반복문으로 위젯 나열 시 Dart 문법 오류
- 문제: for 문을 중괄호 {}와 함께 사용하면 Dart 문법 오류가 발생함.

- 해결책: for 문을 사용할 때 중괄호 없이 collection for 문법을 사용해야 함.  
for (int i = 1; i < 20; i++)  
  rowSeat(i), // 중괄호 없이 한 줄씩 위젯 반환  
- 개선점: 코드가 간결해지고, 반복문을 활용하여 위젯 목록을 효율적으로 처리할 수 있음.
<br>

### 5. ElevatedButton에 borderRadius 지정하기
- 문제: ElevatedButton의 테두리가 명세서와 달리 둥글지 않음.

- 해결책: styleFrom의 shape 속성에 RoundedRectangleBorder와 BorderRadius.circular(20)를 설정하여 버튼의 모서리를 둥글게 만들기.  
SizedBox(  
  height: 50,  
  width: double.infinity,  
  child: ElevatedButton(  
    onPressed: () {},  
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
)  
- 개선점: 버튼 UI의 일관성이 맞춰졌고, 명세서에 맞는 디자인을 쉽게 적용할 수 있음.
<br>
<br>
<br>
