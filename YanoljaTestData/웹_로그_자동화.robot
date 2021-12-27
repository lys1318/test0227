*** Settings ***
Documentation     Suite Setup
...
...               Suite Teardown
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Resource          common.robot

*** Test Cases ***
66_67.라이브방송 shome & 특정 방송 진입
    ${date}    현재 시간 구하기
    홈 > 라이브 방송 메뉴 클릭
    라이브 방송 서브홈 > 특정 방송 진입
    Run Keyword And Continue On Failure    DILog 조회 및 검증    라이브방송    LiveCommerceHome    view    66    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    라이브방송    Broadcast    view    67    ${date}

68~72.장바구니를 통한 국내숙소 예약
    ${date}    현재 시간 구하기
    홈 > 검색 버튼 클릭
    검색 > 국내숙소 검색결과 > PDP 이동    테스트
    PDP > RDP
    RDP > 숙박 예약
    장바구니 담기
    장바구니 이동
    장바구니 > 예약
    예약(포인트 결제) > 예약완료
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    CartOrderComplete    view    68    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    CartOrderPayment    view    69    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    CartOrder    view    70    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    Cart    view    71    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    PlaceHandler    view    72    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    숙소리스트    PlaceList    impr    93    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    숙소리스트    PlaceList    click    94    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내숙소    OrderComplete    view    98    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내숙소    Order    view    99    ${date}

73_76.기차티켓
    ${date}    현재 시간 구하기
    레저티켓 장바구니 담기
    홈 > KTX 메뉴 클릭
    KTX > 승차권 조건 선택 후 조회 버튼 클릭    용산
    승차권 유무 체크 후 요금조회 버튼 클릭
    바로 예매 > 선택한 승차권 장바구니 담기
    장바구니 이동
    장바구니 > 예약
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    xpath://*[@name='user.birthDate_']    19850223
    예약(포인트 결제) > 예약완료
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기차티켓    TrainPayment    view    73    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기차티켓    TrainOrderComplete    view    76    ${date}

74_91.레저티켓 예약
    ${date}    현재 시간 구하기
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [테스트] 야놀자 놀이공원
    레저 상세 > 예약
    예약(포인트 결제) > 예약완료
    Run Keyword And Continue On Failure    DILog 조회 및 검증    레저티켓(일반)    LeisureOrderComplete    view    74    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    레저티켓(일반)    LeisureOrder    view    91    ${date}

77_78.지역 서브홈 & 지도 페이지뷰
    ${date}    현재 시간 구하기
    홈 > 지역 메뉴 클릭
    지역 서브홈 > 지도 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    지역홈    RegionMap    view    77    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    지역홈    RegionHome    view    78    ${date}

79~82_기획전
    ${date}    현재 시간 구하기
    홈 > MY야놀자 메뉴 클릭
    MY야놀자 > 기획전 메뉴 클릭
    기획전 > QA로그전용 메뉴 클릭
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='국내그룹_수정X']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:place-content
    go back
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='레저그룹_수정X']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:LeisureListItem_body__1iNjJ
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    impr    79    ${date}    그룹별, 개별 상품별 노출(국내숙소)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    impr    80    ${date}    그룹별, 개별 상품별 노출(국내레져)    count=2
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    click    81    ${date}    그룹별, 개별 상품 클릭(국내숙소)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    click    82    ${date}    그룹별, 개별 상품 클릭(국내레져)

83~87.해외숙소 서브홈 & 상품 클릭 & 예약 & 결제
    ${date}    현재 시간 구하기
    홈 > 해외숙소 메뉴 클릭
    해외숙소 서브홈 > 해외숙소 상품 클릭
    해외숙소 상세 > 해외숙소 예약하기 진입
    해외숙소 예약하기 > 해외숙소 결제하기 진입
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GlobalPayment    view    83    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GlobalOrder    view    84    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GlobalOrder    click    85    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GHome    view    86    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GPlaceDetail    view    87    ${date}

88.무한쿠폰룸 서브홈 진입
    ${date}    현재 시간 구하기
    홈 > 무한쿠폰룸 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    마이룸    MyRoomHome    view    88    ${date}

89.게하 서브홈 진입
    ${date}    현재 시간 구하기
    홈 > 게하 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    게스트하우스    GHHome    view    89    ${date}

90.모텔 서브홈 진입
    ${date}    현재 시간 구하기
    홈 > 모텔 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내모텔    MTHome    view    90    ${date}

95~97.항공홈 & 검색결과 & 결제처 선택
    ${date}    현재 시간 구하기
    홈 > 항공권 메뉴 클릭
    항공권 검색
    항공권 검색결과 > 결제처 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightSearchList    view    95    ${date}    검색결과 페이지뷰
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightSearchList    click    96    ${date}    가격리스트에서 결제처선택
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightHome    view    97    ${date}

100~102.호텔 서브홈 & 테마형/리스트형 상품 클릭
    ${date}    현재 시간 구하기
    홈 > 호텔 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내호텔    HTHome    view    100    ${date}
    서브홈 > 테마형그룹 상품 클릭
    Go Back
    서브홈 > 리스트형 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내호텔    HTHome    click    101    ${date}    테마형그룹 추천 상품-카테고리별 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내호텔    HTHome    click    102    ${date}    리스트형 추천상품 - 상품 클릭

103~105.펜션 서브홈 & 테마형/리스트형 상품 클릭
    ${date}    현재 시간 구하기
    홈 > 펜션 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내펜션    PSHome    view    103    ${date}
    서브홈 > 테마형그룹 상품 클릭
    Go Back
    서브홈 > 리스트형 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내펜션    PSHome    click    104    ${date}    테마형그룹 추천 상품-카테고리별 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내펜션    PSHome    click    105    ${date}    리스트형 추천상품 - 상품 클릭

106_107.국내숙소 추천 위젯 테마 & 상품 클릭
    ${date}    현재 시간 구하기
    홈 > 국내숙소 추천 위젯
    국내숙소 추천 위젯 > 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    홈    Home    impr    106    ${date}    국내숙소 추천 위젯 테마(숙소카테고리) 숙소단위 impression    count=4
    Run Keyword And Continue On Failure    DILog 조회 및 검증    홈    Home    click    107    ${date}    국내숙소 추천 위젯 > 호텔/펜션 각 추천 상품 클릭
