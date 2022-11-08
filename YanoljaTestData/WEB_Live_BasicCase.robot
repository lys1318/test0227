*** Settings ***
Documentation     Suite Setup (live)
...
...               Suite Teardown (stage)
Suite Setup       Suite Setup (live)
Suite Teardown    Suite Teardown (stage)
Force Tags        LiveBasic
Resource          common.robot

*** Test Cases ***
01.비로그인 상태로 로그인 화면 이동
    1회차 Fail건 재확인_LIVE    1
    홈 > MY야놀자 메뉴 클릭
    MY야놀자 > 로그인 메뉴 클릭
    sleep    1s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    1

02.로그인
    1회차 Fail건 재확인_LIVE    2
    로그인 > 이메일로 로그인 버튼 클릭
    로그인 하기 (stage)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    2

03.MY 야놀자 > 내 정보 관리 이동
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    3
    MY야놀자 > 내정보관리 메뉴 클릭
    내정보관리 > 비밀번호입력 후 상세 이동
    Click Element[버튼 클릭]    xpath://*[@alt='뒤로가기']
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    3

04.MY 야놀자 > 포인트 이동
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    4
    MY야놀자 > 포인트 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[@data-testid='back-button']
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    4

05.MY 야놀자 > MY 혜택 이동
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    5
    MY야놀자 > MY혜택 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[@alt='뒤로가기']
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    5

06.MY 야놀자 > 야놀자 코인 이동
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    6
    MY야놀자 > 야놀자코인 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[@alt='뒤로가기']
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    6

07.MY 야놀자 > 쿠폰함 이동
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    7
    MY야놀자 > 쿠폰함 메뉴 클릭
    Click Element[버튼 클릭]    class:toolbar-btn
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    7

08.MY 야놀자 > 나의 후기 이동
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    8
    MY야놀자 > 나의후기 메뉴 클릭
    Click Element[버튼 클릭]    class:toolbar-btn
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    8

09.MY 야놀자 > 찜 이동
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    9
    MY야놀자 > 찜 메뉴 클릭
    Click Element[버튼 클릭]    class:CollapsingNavTopButtons_backButton__1NQwd
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    9

10.MY 야놀자 > 공지 사항 이동
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    10
    MY야놀자 > 공지사항 메뉴 클릭
    Click Element[버튼 클릭]    xpath:(//*[@class='css-1ca9sw1'])[1]
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    10

11.MY 야놀자 > 자주 묻는 질문 FAQ 이동
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    11
    MY야놀자 > 자주묻는질문FAQ 메뉴 클릭
    Click Element[버튼 클릭]    xpath:(//*[@class='css-1ca9sw1'])[1]
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    11

12.모텔 서브홈 이동
    1회차 Fail건 재확인_LIVE    12
    홈 > 국내숙소탭 클릭
    국내숙소 > 모텔 메뉴 클릭
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    12

13.모텔 대실 바로예약 결제
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    13
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    체크인날짜확인
    PDP > RDP (모/호/게 대실포함)
    RDP > 대실 예약
    바로 예약 > 예약
    예약(간편결제) > 예약완료 (일반)
    sleep    2s
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    13

14.모텔 숙소 바로예약 결제
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    14
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    체크인날짜확인
    PDP > RDP (모텔 숙박)
    RDP > 모텔 숙박 예약
    바로 예약 > 예약
    예약(간편결제) > 예약완료 (일반)
    sleep    2s
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    14

15.모텔 대실 장바구니 결제
    [Setup]    로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    15
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    체크인날짜확인
    PDP > RDP (모/호/게 대실포함)
    RDP > 대실 예약
    숙소 장바구니 담기
    숙소 장바구니 이동
    장바구니 > 예약
    예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    15

16.모텔 숙소 장바구니 결제
    [Setup]    로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    16
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    체크인날짜확인
    PDP > RDP (모텔 숙박)
    RDP > 모텔 숙박 예약
    숙소 장바구니 담기
    숙소 장바구니 이동
    장바구니 > 예약
    예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    16

17.모텔 취소
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    17
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    17

18.호텔 서브홈 이동
    1회차 Fail건 재확인_LIVE    18
    홈 > 국내숙소탭 클릭
    국내숙소 > 호텔 메뉴 클릭
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    18

19.호텔 숙소 바로예약 결제
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    19
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 호텔TEST
    체크인날짜확인
    PDP > RDP (모/호/게 대실포함)
    RDP > 호/펜/게 예약
    바로 예약 > 예약
    예약(간편결제) > 예약완료 (일반)
    sleep    2s
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    19

20.호텔 숙소 장바구니 결제
    [Setup]    로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    20
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 호텔TEST
    체크인날짜확인
    PDP > RDP (모/호/게 대실포함)
    RDP > 호/펜/게 예약
    숙소 장바구니 담기
    숙소 장바구니 이동
    장바구니 > 예약
    예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    20

21.호텔 취소
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    21
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    21

22.펜션 서브홈 이동
    1회차 Fail건 재확인_LIVE    22
    홈 > 국내숙소탭 클릭
    국내숙소 > 펜션 메뉴 클릭
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    22

23.펜션 숙소 바로예약 결제
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    23
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 펜션TEST
    체크인날짜확인
    PDP > RDP (펜션)
    RDP > 호/펜/게 예약
    바로 예약 > 예약
    예약(간편결제) > 예약완료 (일반)
    sleep    2s
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    23

24.펜션 숙소 장바구니 결제
    [Setup]    로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    24
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 펜션TEST
    체크인날짜확인
    PDP > RDP (펜션)
    RDP > 호/펜/게 예약
    숙소 장바구니 담기
    숙소 장바구니 이동
    장바구니 > 예약
    예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    24

25.펜션 취소
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    25
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    25

26.게하 서브홈 이동
    1회차 Fail건 재확인_LIVE    26
    홈 > 국내숙소탭 클릭
    국내숙소 > 게하/한옥 메뉴 클릭
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    26

27.게하 숙소 바로예약 결제
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    27
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    api test 0003 게하
    체크인날짜확인
    PDP > RDP (모/호/게 대실포함)
    RDP > 호/펜/게 예약
    바로 예약 > 예약
    예약(간편결제) > 예약완료 (일반)
    sleep    2s
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    27

28.게하 숙소 장바구니 결제
    [Setup]    로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    28
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    api test 0003 게하
    체크인날짜확인
    PDP > RDP (모/호/게 대실포함)
    RDP > 호/펜/게 예약
    숙소 장바구니 담기
    숙소 장바구니 이동
    장바구니 > 예약
    예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    28

29.게하 취소
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    29
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    29

30.국내숙소 > 선착순쿠폰
    1회차 Fail건 재확인_LIVE    30
    홈 > 국내숙소탭 클릭
    국내숙소 > 선착순쿠폰
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    30

31.국내숙소 > 무한쿠폰룸
    1회차 Fail건 재확인_LIVE    31
    홈 > 국내숙소탭 클릭
    국내숙소 > 무한쿠폰룸
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    31

32.국내숙소 > 혜택모음
    1회차 Fail건 재확인_LIVE    32
    홈 > 국내숙소탭 클릭
    국내숙소 > 월혜택모음
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    32

33.해외여행 > 여행자보험
    1회차 Fail건 재확인_LIVE    33
    홈 > 해외여행탭 클릭
    해외여행 > 여행자보험
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    33

34.해외여행 > 해외숙소
    1회차 Fail건 재확인_LIVE    34
    홈 > 해외여행탭 클릭
    해외여행 > 해외숙소 메뉴 클릭
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    34

35.해외숙소 결제
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    35
    홈 > 해외여행탭 클릭
    해외여행 > 해외숙소 메뉴 클릭
    여행지 선택 > 오사카
    Comment    해외숙소 검색결과 > 가격 낮은순 정렬
    해외숙소 검색결과 > PDP    1
    해외숙소 날짜 설정    7
    해외숙소 상세 > 예약가능날짜 체크
    해외숙소 PDP 무료취소 가능 체크 > 예약하기 진입
    해외숙소 예약(간편결제) > 예약완료
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    35

36.해외숙소 취소
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    36
    홈 > MY야놀자 메뉴 클릭
    MY야놀자 > 해외여행 통합예약 메뉴 클릭
    해외여행 예약내역 > 예약내역 상세
    해외 예약내역 상세 > 예약취소 요청
    해외 예약취소 요청 > 취소 요청하기
    해외숙소 취소요청 완료 > 예약내역 상세 & 취소완료 체크
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    36

37.레저/티켓 서브홈 이동
    1회차 Fail건 재확인_LIVE    37
    홈 > 즐길거리탭 클릭
    즐길거리 > 레저/티켓 메뉴 클릭
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    37

38.레저/티켓 바로예약 결제
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    38
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    Comment    검색 > 레저티켓 검색결과 > 상품상세 이동    [제주 서귀포시] 본태박물관
    검색 > 키워드 입력 후 돋보기 이동    [제주 서귀포시] 본태박물관
    레저 상세 > 예약
    예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    38

39.레저/티켓 장바구니 결제
    [Setup]    로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    39
    레저티켓 장바구니 담기    [제주 서귀포시] 본태박물관
    숙소 외 장바구니 이동
    장바구니 > 예약
    예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    39

40.레저/티켓 취소
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    40
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    40

41.모바일교환권 서브홈 이동
    1회차 Fail건 재확인_LIVE    41
    홈 > 즐길거리탭 클릭
    즐길거리 > 모바일교환권
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    41

42.렌터카 서브홈 이동
    1회차 Fail건 재확인_LIVE    42
    홈 > 교통/항공탭 클릭
    교통/항공 > 렌터카
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    42

43.렌터카 PDP 이동
    1회차 Fail건 재확인_LIVE    43
    홈 > 교통/항공탭 클릭
    교통/항공 > 렌터카
    렌터카 서브홈 > PDP
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    43

44.KTX 서브홈 이동
    1회차 Fail건 재확인_LIVE    44
    홈 > 교통/항공탭 클릭
    교통/항공 > KTX 메뉴 클릭
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    44

45.KTX 왕복상품 장바구니 결제
    [Setup]    로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    45
    모텔 장바구니 담기
    홈 > 교통/항공탭 클릭
    교통/항공 > KTX 메뉴 클릭
    KTX > 왕복탭 클릭
    KTX > 승차권 조건 선택 후 조회 버튼 클릭 (왕복)    용산
    승차권 유무 체크 후 요금조회 버튼 클릭
    바로 예매 > 오는날 승차권 조회
    승차권 유무 체크 후 요금조회 버튼 클릭
    바로 예매 > 선택한 승차권 장바구니 담기
    숙소 외 장바구니 이동
    장바구니 > 예약
    InputText Element[텍스트 입력하기]    xpath://*[@name='user.birthDate_']    19850223
    예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    45

46.KTX 취소
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    46
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    46

47.고속버스 서브홈 이동
    1회차 Fail건 재확인_LIVE    47
    홈 > 교통/항공탭 클릭
    교통/항공 > 고속버스 메뉴 클릭
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    47

48.항공권 왕복 리스트 확인
    1회차 Fail건 재확인_LIVE    48
    홈 > 교통/항공탭 클릭
    교통/항공 > 항공권 메뉴 클릭
    항공권 왕복 검색    BCN
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    48

49.항공권 편도 리스트 확인
    1회차 Fail건 재확인_LIVE    49
    홈 > 교통/항공탭 클릭
    교통/항공 > 항공권 메뉴 클릭
    항공권 > 편도 클릭
    항공권 편도 검색    BCN
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    49

50.알림함 이동 확인
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    50
    홈 > MY야놀자 메뉴 클릭
    MY야놀자 > 알림함 클릭
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    50

----------TEST용----------
    [Tags]    TEST
    [Setup]    TEST_Setup
    No Operation

국내숙소 키워드 검색
    [Tags]    TEST
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    Go Back
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 호텔TEST
    Go Back
    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 펜션TEST
    Go Back
    검색 > 국내숙소 검색결과 > PDP 이동    (테스트) 게하 스프테스트

레저/티켓 키워드 검색
    [Tags]    TEST
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [제주 서귀포시] 본태박물관
    Go Back
    검색 > 레저티켓 검색결과 > 상품상세 이동    [스타벅스] 카페 아메리카노 T
    Go Back
    검색 > 레저티켓 검색결과 > 상품상세 이동    [전국] 슈퍼윙스 키즈카페 8개지점★
    Go Back
    검색 > 레저티켓 검색결과 > 상품상세 이동    [전국] 플레이타임 키즈카페 17개점

해외숙소 키워드 검색
    [Tags]    TEST
    홈 > 검색 버튼 클릭
    검색 > 해외숙소탭 클릭
    검색 > 해외숙소 검색결과 (테스트용)    도톤보리 크리스탈 호텔
    Go Back
    sleep    3s
    Go Back
    검색 > 해외숙소 검색결과 (테스트용)    노보텔 다낭 프리미어 한 리버
    Go Back
    sleep    3s
    Go Back
    검색 > 해외숙소 검색결과 (테스트용)    리오 호텔 마카오
    Go Back
    sleep    3s
    Go Back
    검색 > 해외숙소 검색결과 (테스트용)    인사이드 파이브 시티 아파트먼츠

42.모바일교환권 바로예약 결제
    [Tags]    TEST
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    42
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [스타벅스] 카페 아메리카노 T
    레저 상세 > 예약
    예약(간편결제) > 예약완료 (일반)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    42

43.모바일교환권 취소
    [Tags]    TEST
    [Setup]    로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    43
    예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    43

44.맛집 서브홈 이동
    [Tags]    TEST
    1회차 Fail건 재확인_LIVE    44
    홈 > 즐길거리탭 클릭
    즐길거리 > 맛집
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    44
