*** Settings ***
Documentation     MW Suite Setup (live)
...
...               MW Suite Teardown
Suite Setup       MW_Suite Setup (live)
Suite Teardown    MW_Suite Teardown
Force Tags        LiveBasic
Resource          common.robot

*** Test Cases ***
01.MW_비로그인 상태로 로그인 화면 이동
    1회차 Fail건 재확인_LIVE    1
    MW_홈 > MY야놀자
    MW_MY야놀자 > 로그인
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    1

02.MW_로그인
    1회차 Fail건 재확인_LIVE    2
    MW_로그인 > 이메일로 로그인
    MW_로그인 하기    ${live_username}    ${live_password}    Qatest02
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    2

03.MW_MY 야놀자 > 내 정보 관리 이동
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    3
    MW_MY야놀자 > 내정보관리
    MW_내정보관리 > 비밀번호입력 후 상세 이동
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'NavigationBar_leftWrap')]
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    3

04.MW_MY 야놀자 > 포인트 이동
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    4
    MW_MY야놀자 > 포인트
    Ap.Click Element[버튼 클릭]    //*[@data-testid='back-button']
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    4

05.MW_MY 야놀자 > MY 혜택 이동
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    5
    MW_MY야놀자 > MY혜택
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'NavigationBar_leftWrap')]
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    5

06.MW_MY 야놀자 > 야놀자 코인 이동
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    6
    MW_MY야놀자 > 야놀자코인
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'NavigationBar_leftWrap')]
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    6

07.MW_MY 야놀자 > 쿠폰함 이동
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    7
    MW_MY야놀자 > 쿠폰함
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'toolbar-btn')]
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    7

08.MW_MY 야놀자 > 나의 후기 이동
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    8
    MW_MY야놀자 > 나의후기
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'toolbar-btn')]
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    8

09.MW_MY 야놀자 > 찜 이동
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    9
    MW_MY야놀자 > 찜
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'backButton')]
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    9

10.MW_MY 야놀자 > 공지 사항 이동
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    10
    MW_MY야놀자 > 공지사항
    Ap.Click Element[버튼 클릭]    xpath=(//*[@class='css-1ca9sw1'])[1]
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    10

11.MW_MY 야놀자 > 자주 묻는 질문 FAQ 이동
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    11
    MW_MY야놀자 > 자주묻는질문FAQ
    Ap.Click Element[버튼 클릭]    xpath=(//*[@class='css-1ca9sw1'])[1]
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    11

12.MW_모텔 서브홈 이동
    1회차 Fail건 재확인_LIVE    12
    MW_홈 > 국내숙소탭
    MW_국내숙소 > 모텔
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    12

13.MW_모텔 대실 바로예약 결제
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    13
    MW_홈 > 검색
    Comment    MW_검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    신규테스트 AUTO
    MW_체크인날짜확인
    MW_PDP > RDP (모/호/게 대실포함)
    MW_RDP > 대실 예약
    MW_바로 예약 > 예약
    MW_예약(간편결제) > 예약완료 (일반)
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    13

14.MW_모텔 숙소 바로예약 결제
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    14
    MW_홈 > 검색
    Comment    MW_검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    신규테스트 AUTO
    MW_체크인날짜확인
    MW_PDP > RDP (모텔 숙박)
    MW_RDP > 모텔 숙박 예약
    MW_바로 예약 > 예약
    MW_예약(간편결제) > 예약완료 (일반)
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    14

15.MW_모텔 대실 장바구니 결제
    [Setup]    MW_로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    15
    MW_홈 > 검색
    Comment    MW_검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    신규테스트 AUTO
    MW_체크인날짜확인
    MW_PDP > RDP (모/호/게 대실포함)
    MW_RDP > 대실 예약
    MW_숙소 장바구니 담기
    MW_숙소 장바구니 이동
    MW_장바구니 > 예약
    MW_예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    15

16.MW_모텔 숙소 장바구니 결제
    [Setup]    MW_로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    16
    MW_홈 > 검색
    Comment    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    신규테스트 AUTO
    MW_체크인날짜확인
    MW_PDP > RDP (모텔 숙박)
    MW_RDP > 모텔 숙박 예약
    MW_숙소 장바구니 담기
    MW_숙소 장바구니 이동
    MW_장바구니 > 예약
    MW_예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    16

17.MW_모텔 취소
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    17
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    17

18.MW_호텔 서브홈 이동
    1회차 Fail건 재확인_LIVE    18
    MW_홈 > 국내숙소탭
    MW_국내숙소 > 호텔
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    18

19.MW_호텔 숙소 바로예약 결제
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    19
    MW_홈 > 검색
    Comment    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 호텔TEST
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    QA Auto 호텔TEST
    MW_체크인날짜확인
    MW_PDP > RDP (모/호/게 대실포함)_호텔 임시
    MW_RDP > 호/펜/게 예약
    MW_바로 예약 > 예약
    MW_예약(간편결제) > 예약완료 (일반)
    sleep    2s
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    19

20.MW_호텔 숙소 장바구니 결제
    [Setup]    MW_로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    20
    MW_홈 > 검색
    Comment    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 호텔TEST
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    QA Auto 호텔TEST
    MW_체크인날짜확인
    MW_PDP > RDP (모/호/게 대실포함)_호텔 임시
    MW_RDP > 호/펜/게 예약
    MW_숙소 장바구니 담기
    MW_숙소 장바구니 이동
    MW_장바구니 > 예약
    MW_예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    20

21.MW_호텔 취소
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    21
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    21

22.MW_펜션 서브홈 이동
    1회차 Fail건 재확인_LIVE    22
    MW_홈 > 국내숙소탭
    MW_국내숙소 > 펜션
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    22

23.MW_펜션 숙소 바로예약 결제
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    23
    MW_홈 > 검색
    Comment    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 펜션TEST
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    QA Auto 펜션TEST
    MW_체크인날짜확인
    MW_PDP > RDP (펜션)
    MW_RDP > 호/펜/게 예약
    MW_바로 예약 > 예약
    MW_예약(간편결제) > 예약완료 (일반)
    sleep    2s
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    23

24.MW_펜션 숙소 장바구니 결제
    [Setup]    MW_로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    24
    MW_홈 > 검색
    Comment    검색 > 국내숙소 검색결과 > PDP 이동    QA Auto 펜션TEST
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    QA Auto 펜션TEST
    MW_체크인날짜확인
    MW_PDP > RDP (펜션)
    MW_RDP > 호/펜/게 예약
    MW_숙소 장바구니 담기
    MW_숙소 장바구니 이동
    MW_장바구니 > 예약
    MW_예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    24

25.MW_펜션 취소
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    25
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    25

26.MW_게하 서브홈 이동
    1회차 Fail건 재확인_LIVE    26
    MW_홈 > 국내숙소탭
    MW_국내숙소 > 게하/한옥
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    26

27.MW_게하 숙소 바로예약 결제
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    27
    MW_홈 > 검색
    Comment    검색 > 국내숙소 검색결과 > PDP 이동    api test 0003 게하
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    api test 0003 게하
    MW_체크인날짜확인
    MW_PDP > RDP (모/호/게 대실포함)
    MW_RDP > 호/펜/게 예약
    MW_바로 예약 > 예약
    MW_예약(간편결제) > 예약완료 (일반)
    sleep    2s
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    27

28.MW_게하 숙소 장바구니 결제
    [Setup]    MW_로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    28
    MW_홈 > 검색
    Comment    검색 > 국내숙소 검색결과 > PDP 이동    api test 0003 게하
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    api test 0003 게하
    MW_체크인날짜확인
    MW_PDP > RDP (모/호/게 대실포함)
    MW_RDP > 호/펜/게 예약
    MW_숙소 장바구니 담기
    MW_숙소 장바구니 이동
    MW_장바구니 > 예약
    MW_예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    28

29.MW_게하 취소
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    29
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    29

30.MW_국내숙소 > 선착순쿠폰
    1회차 Fail건 재확인_LIVE    30
    MW_홈 > 국내숙소탭
    MW_국내숙소 > 선착순쿠폰
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    30

31.MW_국내숙소 > 무한쿠폰룸
    1회차 Fail건 재확인_LIVE    31
    MW_홈 > 국내숙소탭
    MW_국내숙소 > 무한쿠폰룸
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    31

32.MW_국내숙소 > 혜택모음
    1회차 Fail건 재확인_LIVE    32
    MW_홈 > 추천탭
    MW_월혜택모음
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    32

33.MW_해외여행 > 여행자보험
    1회차 Fail건 재확인_LIVE    33
    MW_홈 > 해외여행탭
    MW_해외여행 > 여행자보험
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    33

34.MW_해외여행 > 해외숙소
    1회차 Fail건 재확인_LIVE    34
    MW_홈 > 해외여행탭
    MW_해외여행 > 해외숙소
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    34

35.MW_해외숙소 결제
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    35
    MW_홈 > 해외여행탭
    MW_해외여행 > 해외숙소
    MW_여행지 선택 > 오사카
    Comment    해외숙소 검색결과 > 가격 낮은순 정렬
    MW_해외숙소 검색결과 > PDP    1
    MW_해외숙소 날짜 설정    7
    MW_해외숙소 상세 > 예약가능날짜 체크
    MW_해외숙소 PDP 무료취소 가능 체크 > 예약하기 진입
    MW_해외숙소 예약(간편결제) > 예약완료
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    35

36.MW_해외숙소 취소
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    36
    MW_홈 > MY야놀자
    MW_MY야놀자 > 해외여행 통합예약
    MW_해외여행 예약내역 > 예약내역 상세
    MW_해외 예약내역 상세 > 예약취소 요청
    MW_해외 예약취소 요청 > 취소 요청하기
    MW_해외숙소 취소요청 완료 > 예약내역 상세 & 취소완료 체크
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    36

37.MW_레저/티켓 서브홈 이동
    1회차 Fail건 재확인_LIVE    37
    MW_홈 > 즐길거리탭
    MW_즐길거리 > 레저/티켓
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    37

38.MW_레저/티켓 바로예약 결제
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    38
    MW_홈 > 검색
    MW_검색 > 레저/티켓탭
    MW_검색 > 레저티켓 검색결과 > 상품상세 이동    [제주 서귀포시] 본태박물관
    Comment    MW_검색 > 키워드 입력 후 돋보기 이동 (레저)    [제주 서귀포시] 본태박물관
    MW_레저 상세 > 예약
    MW_예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    38

39.MW_레저/티켓 장바구니 결제
    [Setup]    MW_로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    39
    MW_레저티켓 장바구니 담기    [제주 서귀포시] 본태박물관
    MW_레저 장바구니 이동
    MW_장바구니 > 예약
    MW_예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    39

40.MW_레저/티켓 취소
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    40
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    40

41.MW_모바일교환권 서브홈 이동
    1회차 Fail건 재확인_LIVE    41
    MW_홈 > 즐길거리탭
    MW_즐길거리 > 모바일교환권
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    41

42.MW_렌터카 서브홈 이동
    1회차 Fail건 재확인_LIVE    42
    MW_홈 > 교통/항공탭
    MW_교통/항공 > 렌터카
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    42

43.MW_렌터카 PDP 이동
    1회차 Fail건 재확인_LIVE    43
    MW_홈 > 교통/항공탭
    MW_교통/항공 > 렌터카
    MW_렌터카 서브홈 > PDP
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    43

44.MW_KTX 서브홈 이동
    1회차 Fail건 재확인_LIVE    44
    MW_홈 > 교통/항공탭
    MW_교통/항공 > 기차
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    44

45.MW_KTX 왕복상품 장바구니 결제
    [Setup]    MW_로그인 여부 & 장바구니 유무 체크
    1회차 Fail건 재확인_LIVE    45
    MW_모텔 장바구니 담기
    MW_홈 > 교통/항공탭
    MW_교통/항공 > 기차
    MW_기차 > 왕복탭
    MW_기차 > 승차권 조건 선택 후 조회 (왕복)    용산
    MW_승차권 유무 체크 후 요금조회
    MW_바로 예매 > 오는날 승차권 조회
    MW_승차권 유무 체크 후 요금조회
    MW_바로 예매 > 선택한 승차권 장바구니 담기
    MW_기차 장바구니 이동
    MW_장바구니 > 예약
    Ap.InputText Element[텍스트 입력하기]    //*[@name='user.birthDate_']    19850223
    sleep    1s
    Execute script    window.scrollTo(0, 0)
    MW_예약(간편결제) > 예약완료 (장바구니)
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    45

46.MW_KTX 취소
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    46
    MW_예약내역 취소
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    46

47.MW_고속버스 서브홈 이동
    1회차 Fail건 재확인_LIVE    47
    MW_홈 > 교통/항공탭
    MW_교통/항공 > 고속버스
    sleep    2s
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    47

48.MW_항공권 왕복 리스트 확인
    1회차 Fail건 재확인_LIVE    48
    MW_홈 > 교통/항공탭
    MW_교통/항공 > 항공권
    MW_항공권 왕복 검색    BCN
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    48

49.MW_항공권 편도 리스트 확인
    1회차 Fail건 재확인_LIVE    49
    MW_홈 > 교통/항공탭
    MW_교통/항공 > 항공권
    MW_항공권 > 편도
    MW_항공권 편도 검색    BCN
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    49

50.MW_알림함 이동 확인
    [Setup]    MW_로그인 여부 체크_LIVE
    1회차 Fail건 재확인_LIVE    50
    MW_홈 > MY야놀자
    MW_MY야놀자 > 알림함
    [Teardown]    구글 스프레드 시트 결과 업데이트[LiveBasic]    ${TEST_STATUS}    50

테스트
    [Tags]    TEST
