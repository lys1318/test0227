*** Settings ***
Documentation     Suite Setup (stage)
...
...               Suite Teardown (stage)
Suite Setup       Suite Setup (stage)
Suite Teardown    Suite Teardown (stage)
Force Tags        StageBasic
Resource          common.robot

*** Test Cases ***
03.비로그인 상태로 로그인 화면 이동
    홈 > MY야놀자 메뉴 클릭 (stage)
    MY야놀자 > 로그인 메뉴 클릭
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    3

04.로그인
    로그인 > 이메일로 로그인 버튼 클릭
    로그인 하기 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    4

05.MY 야놀자 > 내 정보 관리 이동
    MY야놀자 > 내정보관리 메뉴 클릭
    내정보관리 > 비밀번호입력 후 상세 이동
    Click Element[버튼 클릭]    xpath://*[@alt='뒤로가기']
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    5

06.MY 야놀자 > 포인트 이동
    MY야놀자 > 포인트 메뉴 클릭
    Click Element[버튼 클릭]    class:toolbar-btn
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    6

07.MY 야놀자 > MY 혜택 이동
    MY야놀자 > MY혜택 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[@alt='뒤로가기']
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    7

08.MY 야놀자 > 야놀자 코인 이동
    MY야놀자 > 야놀자코인 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[@alt='뒤로가기']
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    8

09.MY 야놀자 > 쿠폰함 이동
    MY야놀자 > 쿠폰함 메뉴 클릭
    Click Element[버튼 클릭]    class:toolbar-btn
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    9

10.MY 야놀자 > 나의 후기 이동
    MY야놀자 > 나의후기 메뉴 클릭
    Click Element[버튼 클릭]    class:toolbar-btn
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    10

11.MY 야놀자 > 찜 이동
    MY야놀자 > 찜 메뉴 클릭
    Click Element[버튼 클릭]    class:CollapsingNavTopButtons_backButton__1NQwd
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    11

13.MY 야놀자 > 공지 사항 이동
    MY야놀자 > 공지사항 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[@alt='뒤로가기']
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    13

14.MY 야놀자 > 자주 묻는 질문 FAQ 이동
    MY야놀자 > 자주묻는질문FAQ 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[@alt='뒤로가기']
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    14

15.모텔 서브홈 이동
    Comment    홈 > 국내숙소탭 클릭 (stage)
    Comment    국내숙소 > 모텔 메뉴 클릭
    국내숙소 > 모텔 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    15

16.모텔 대실 바로예약 결제
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    체크인날짜확인
    PDP > RDP (모텔 대실)
    RDP > 대실 예약
    바로 예약 > 예약
    바로예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    16

17.모텔 숙소 바로예약 결제
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    체크인날짜확인
    PDP > RDP (모텔 숙박)
    RDP > 숙박 예약
    바로 예약 > 예약
    바로예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    17

18.모텔 대실 장바구니 결제
    [Setup]    홈 > 장바구니 유무 체크
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    체크인날짜확인
    PDP > RDP (모텔 대실)
    RDP > 대실 예약
    장바구니 담기
    장바구니 이동
    장바구니 > 예약
    장바구니예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    18

19.모텔 숙소 장바구니 결제
    [Setup]    홈 > 장바구니 유무 체크
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    체크인날짜확인
    PDP > RDP (모텔 숙박)
    RDP > 숙박 예약
    장바구니 담기
    장바구니 이동
    장바구니 > 예약
    장바구니예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    19

20.모텔 취소
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    20

21.호텔 서브홈 이동
    Comment    홈 > 국내숙소탭 클릭 (stage)
    Comment    국내숙소 > 호텔 메뉴 클릭
    국내숙소 > 호텔 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    21

22.호텔 숙소 바로예약 결제
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 호텔TEST
    체크인날짜확인
    PDP > RDP (호텔/게하)
    RDP > 예약
    바로 예약 > 예약
    바로예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    22

23.호텔 숙소 장바구니 결제
    [Setup]    홈 > 장바구니 유무 체크
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 호텔TEST
    체크인날짜확인
    PDP > RDP (호텔/게하)
    RDP > 예약
    장바구니 담기
    장바구니 이동
    장바구니 > 예약
    장바구니예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    23

24.호텔 취소
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    24

25.펜션 서브홈 이동
    Comment    홈 > 국내숙소탭 클릭 (stage)
    Comment    국내숙소 > 펜션 메뉴 클릭
    국내숙소 > 펜션 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    25

26.펜션 숙소 바로예약 결제
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 펜션TEST
    체크인날짜확인
    PDP > RDP (펜션)
    RDP > 예약
    바로 예약 > 예약
    바로예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    26

27.펜션 숙소 장바구니 결제
    [Setup]    홈 > 장바구니 유무 체크
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 펜션TEST
    체크인날짜확인
    PDP > RDP (펜션)
    RDP > 예약
    장바구니 담기
    장바구니 이동
    장바구니 > 예약
    장바구니예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    27

28.펜션 취소
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    28

29.게하 서브홈 이동
    Comment    홈 > 국내숙소탭 클릭 (stage)
    Comment    국내숙소 > 게하/한옥 메뉴 클릭
    국내숙소 > 게하 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    29

30.게하 숙소 바로예약 결제
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    (테스트) 게하 스프테스트
    체크인날짜확인
    PDP > RDP (호텔/게하)
    RDP > 예약
    바로 예약 > 예약
    바로예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    30

31.게하 숙소 장바구니 결제
    [Setup]    홈 > 장바구니 유무 체크
    홈 > 검색 버튼 클릭 (stage)
    검색 > 국내숙소 검색결과 > PDP 이동    (테스트) 게하 스프테스트
    체크인날짜확인
    PDP > RDP (호텔/게하)
    RDP > 예약
    장바구니 담기
    장바구니 이동
    장바구니 > 예약
    장바구니예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    31

32.게하 취소
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    32

33.해외숙소 결제
    Comment    홈 > 해외여행탭 클릭 (stage)
    Comment    해외여행 > 해외숙소 메뉴 클릭
    해외숙소 > 여행지 선택 (stage)
    여행지 선택 > 베트남
    해외숙소 검색결과 > 가격 낮은순 정렬
    해외숙소 검색결과 > PDP    1
    해외숙소 날짜 설정 (stage)    5
    해외숙소 상세 > 해외숙소 예약하기 진입
    해외숙소 무료취소 가능 체크 (stage)
    해외숙소 예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    33

34.해외숙소 취소
    홈 > MY야놀자 메뉴 클릭 (stage)
    MY야놀자 > 해외여행 통합예약 메뉴 클릭
    해외여행 예약내역 > 예약내역 상세
    해외 예약내역 상세 > 예약취소 요청
    해외 예약취소 요청 > 취소 요청하기
    해외숙소 취소요청 완료 > 예약내역 상세 & 취소완료 체크
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    34

35.레저/티켓 서브홈 이동
    Comment    홈 > 즐길거리탭 클릭 (stage)
    Comment    즐길거리 > 레저/티켓 메뉴 클릭
    즐길거리 > 레저/티켓 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    35

36.레저 일반 바로예약 결제
    홈 > 검색 버튼 클릭 (stage)
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [여수] 여수예술랜드 미디어아트 / 조각공원 / 트릭아트
    레저 상세 > 예약
    장바구니예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    36

37.레저 모바일 바로예약 결제
    홈 > 검색 버튼 클릭 (stage)
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [스타벅스] 카페 아메리카노 T
    레저 상세 > 예약
    장바구니예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    37

38.레저 일반 장바구니 결제
    [Setup]    홈 > 장바구니 유무 체크
    레저티켓 장바구니 담기 (stage)
    장바구니 이동
    장바구니 > 예약
    장바구니예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    38

39.레저 취소
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    39

40.KTX 서브홈 이동
    Comment    홈 > 교통/항공탭 클릭 (stage)
    Comment    교통/항공 > KTX 메뉴 클릭
    교통/항공 > KTX (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    40

41.KTX 왕복상품 장바구니 결제
    [Setup]    홈 > 장바구니 유무 체크
    모텔 장바구니 담기 (stage)
    Comment    홈 > 교통/항공탭 클릭 (stage)
    Comment    교통/항공 > KTX 메뉴 클릭
    교통/항공 > KTX (stage)
    KTX > 왕복탭 클릭
    KTX > 승차권 조건 선택 후 조회 버튼 클릭 (왕복)    용산
    승차권 유무 체크 후 요금조회 버튼 클릭
    바로 예매 > 오는날 승차권 조회
    승차권 유무 체크 후 요금조회 버튼 클릭
    바로 예매 > 선택한 승차권 장바구니 담기
    장바구니 이동
    장바구니 > 예약
    InputText Element[텍스트 입력하기]    xpath://*[@name='user.birthDate_']    19850223
    장바구니예약(포인트 결제) > 예약완료 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    41

42.KTX 취소
    예약내역 취소 (stage)
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    42

43.고속버스 서브홈 이동
    Comment    홈 > 교통/항공탭 클릭 (stage)
    Comment    교통/항공 > 고속버스 메뉴 클릭
    교통/항공 > 고속버스 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    43

47.항공권 왕복 리스트 확인
    Comment    홈 > 교통/항공탭 클릭 (stage)
    Comment    교통/항공 > 항공권 메뉴 클릭
    교통/항공 > 항공권 (stage)
    항공권 왕복 검색 (stage)    BCN
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    47

48.항공권 편도 리스트 확인
    Comment    홈 > 교통/항공탭 클릭 (stage)
    Comment    교통/항공 > 항공권 메뉴 클릭
    교통/항공 > 항공권 (stage)
    항공권 > 편도 클릭
    항공권 편도 검색 (stage)    BCN
    [Teardown]    구글 스프레드 시트 결과 업데이트[StageBasic]    ${TEST_STATUS}    48
