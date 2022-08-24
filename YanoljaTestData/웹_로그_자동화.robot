*** Settings ***
Documentation     Suite Setup
...
...               Suite Teardown
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Force Tags        WEB_LOG
Resource          common.robot

*** Test Cases ***
01_02.라이브방송 shome & 특정 방송 진입
    ${date}    현재 시간 구하기
    홈 > 라이브 방송 메뉴 클릭
    라이브 방송 서브홈 > 특정 방송 진입
    Run Keyword And Continue On Failure    DILog 조회 및 검증    라이브방송    LiveCommerceHome    view    1    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    라이브방송    Broadcast    view    2    ${date}

03~07.장바구니를 통한 국내숙소 예약
    ${date}    현재 시간 구하기
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동 (QA)    QA정지훈DILOG자동화
    PDP > RDP (모텔 숙박)
    RDP > 모텔 숙박 예약 (QA)
    숙소 장바구니 담기
    숙소 장바구니 이동
    장바구니 > 예약
    예약(포인트 결제) > 예약완료 (QA)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    CartOrderComplete    view    3    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    CartOrderPayment    view    4    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    CartOrder    view    5    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    Cart    view    6    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    PlaceHandler    view    7    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    숙소리스트    PlaceList    impr    27    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    숙소리스트    PlaceList    click    28    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내숙소    OrderComplete    view    32    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내숙소    Order    view    33    ${date}
    [Teardown]    TC Teardown

08_11.기차티켓
    ${date}    현재 시간 구하기
    레저티켓 장바구니 담기    [경기] 야놀자 놀이공원
    홈 > 교통/항공탭 클릭
    교통/항공 > KTX 메뉴 클릭
    KTX > 승차권 조건 선택 후 조회 버튼 클릭    부산
    승차권 유무 체크 후 요금조회 버튼 클릭
    바로 예매 > 선택한 승차권 장바구니 담기
    숙소 외 장바구니 이동
    장바구니 > 예약
    InputText Element[텍스트 입력하기]    xpath://*[@name='user.birthDate_']    19850223
    예약(포인트 결제) > 예약완료 (QA)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기차티켓    TrainPayment    view    8    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기차티켓    TrainOrderComplete    view    11    ${date}
    [Teardown]    TC Teardown

09_25.레저티켓(일반) 예약
    ${date}    현재 시간 구하기
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [경기] 야놀자 놀이공원
    레저 상세 > 예약
    예약(포인트 결제) > 예약완료 (QA)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    레저티켓(일반)    LeisureOrderComplete    view    9    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    레저티켓(일반)    LeisureOrder    view    25    ${date}
    [Teardown]    TC Teardown

10_26.레저티켓(모바일) 예약
    ${date}    현재 시간 구하기
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [KFC] 징거버거세트
    레저 상세 > 예약
    예약(포인트 결제) > 예약완료 (QA)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    레저티켓(모바일)    LeisureOrderComplete    view    10    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    레저티켓(모바일)    LeisureOrder    view    26    ${date}
    [Teardown]    TC Teardown

12_13.지역 서브홈 & 지도 페이지뷰
    ${date}    현재 시간 구하기
    홈 > 국내숙소탭 클릭
    국내숙소 > 강원도 메뉴 클릭
    지역 서브홈 > 지도 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    지역홈    RegionMap    view    12    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    지역홈    RegionHome    view    13    ${date}

14~17_기획전
    ${date}    현재 시간 구하기
    홈 > MY야놀자 메뉴 클릭
    MY야놀자 > 기획전 메뉴 클릭
    기획전 > QA로그전용 메뉴 클릭
    기획전 > 숙소 상세
    sleep    3s
    go back
    기획전 > 레저 상세
    sleep    3s
    go back
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    impr    14    ${date}    그룹별, 개별 상품별 노출(국내숙소)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    click    15    ${date}    그룹별, 개별 상품 클릭(국내숙소)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    impr    16    ${date}    그룹별, 개별 상품별 노출(국내레져)    count=2
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    click    17    ${date}    그룹별, 개별 상품 클릭(국내레져)

18~21.해외숙소 서브홈 & 상품 클릭 & 예약 & 결제
    ${date}    현재 시간 구하기
    홈 > 해외여행탭 클릭
    해외여행 > 해외숙소 메뉴 클릭
    해외숙소 서브홈 > 숙소 검색    시 피닉스 호텔
    해외숙소 상세 > 해외숙소 예약하기 진입 (QA)
    해외숙소 예약하기 > 해외숙소 결제하기 진입
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GlobalPayment    view    18    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GlobalOrder    view    19    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GlobalOrder    click    20    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GPlaceDetail    view    21    ${date}

22.무한쿠폰룸 서브홈 진입
    ${date}    현재 시간 구하기
    추천 > 무한쿠폰룸 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    마이룸    MyRoomHome    view    22    ${date}

23.게하 서브홈 진입
    ${date}    현재 시간 구하기
    홈 > 국내숙소탭 클릭
    국내숙소 > 게하/한옥 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    게스트하우스    GHHome    view    23    ${date}

24.모텔 서브홈 진입
    ${date}    현재 시간 구하기
    홈 > 국내숙소탭 클릭
    국내숙소 > 모텔 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내모텔    MTHome    view    24    ${date}

29~31.항공홈 & 검색결과 & 결제처 선택
    ${date}    현재 시간 구하기
    홈 > 교통/항공탭 클릭
    교통/항공 > 항공권 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightHome    view    31    ${date}
    항공권 > 편도 클릭
    항공권 검색    BCN
    항공권 검색결과 > 결제처 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightSearchList    click    30    ${date}    가격리스트에서 결제처선택

34~36.호텔 서브홈 & 테마형/리스트형 상품 클릭
    ${date}    현재 시간 구하기
    홈 > 국내숙소탭 클릭
    국내숙소 > 호텔 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내호텔    HTHome    view    34    ${date}
    서브홈 > 테마형그룹 상품 클릭
    sleep    1s
    go back
    서브홈 > 리스트형 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내호텔    HTHome    click    35    ${date}    테마형그룹 추천 상품-카테고리별 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내호텔    HTHome    click    36    ${date}    리스트형 추천상품 - 상품 클릭

37~39.펜션 서브홈 & 테마형/리스트형 상품 클릭
    ${date}    현재 시간 구하기
    홈 > 국내숙소탭 클릭
    국내숙소 > 펜션 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내펜션    PSHome    view    37    ${date}
    서브홈 > 테마형그룹 상품 클릭
    sleep    1s
    Go Back
    서브홈 > 리스트형 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내펜션    PSHome    click    38    ${date}    테마형그룹 추천 상품-카테고리별 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내펜션    PSHome    click    39    ${date}    리스트형 추천상품 - 상품 클릭

40_41.국내숙소 추천 위젯 테마 & 상품 클릭
    ${date}    현재 시간 구하기
    홈 > 국내숙소탭 클릭
    국내숙소 추천 위젯 > 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    홈    Home    impr    40    ${date}    국내숙소 추천 위젯 테마(숙소카테고리) 숙소단위 impression    count=4
    Run Keyword And Continue On Failure    DILog 조회 및 검증    홈    Home    click    41    ${date}    국내숙소 추천 위젯 > 호텔/펜션 각 추천 상품 클릭

42.홈 내 특정 Tab 화면 진입(노출)
    ${date}    현재 시간 구하기
    홈 > 추천탭 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    홈    Home    impr    42    ${date}    홈 내 특정 Tab 화면 진입(노출)

43_44.홈 추천 위젯 내 상품/아티클 노출 & 클릭
    ${date}    현재 시간 구하기
    메인 이동
    홈 추천 위젯 > 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    홈    Home    impr    43    ${date}    홈 추천 위젯 내, 상품(숙소, 레저 등)/아티클 노출    count=10
    Run Keyword And Continue On Failure    DILog 조회 및 검증    홈    Home    click    44    ${date}    홈 추천 위젯 내, 상품(숙소, 레저 등)/아티클 클릭
