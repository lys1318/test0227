*** Settings ***
Documentation     Suite Setup
...
...               Suite Teardown
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
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
    검색 > 국내숙소 검색결과 > PDP 이동    테스트
    PDP > RDP
    RDP > 숙박 예약
    장바구니 담기
    장바구니 이동
    장바구니 > 예약
    예약(포인트 결제) > 예약완료
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    CartOrderComplete    view    3    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    CartOrderPayment    view    4    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    CartOrder    view    5    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    Cart    view    6    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    장바구니    PlaceHandler    view    7    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    숙소리스트    PlaceList    impr    26    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    숙소리스트    PlaceList    click    27    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내숙소    OrderComplete    view    31    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내숙소    Order    view    32    ${date}

08_10.기차티켓
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
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기차티켓    TrainPayment    view    8    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기차티켓    TrainOrderComplete    view    10    ${date}

09_25.레저티켓 예약
    ${date}    현재 시간 구하기
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [테스트] 야놀자 놀이공원
    레저 상세 > 예약
    예약(포인트 결제) > 예약완료
    Run Keyword And Continue On Failure    DILog 조회 및 검증    레저티켓(일반)    LeisureOrderComplete    view    9    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    레저티켓(일반)    LeisureOrder    view    25    ${date}

11_12.지역 서브홈 & 지도 페이지뷰
    ${date}    현재 시간 구하기
    홈 > 지역 메뉴 클릭
    지역 서브홈 > 지도 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    지역홈    RegionMap    view    11    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    지역홈    RegionHome    view    12    ${date}

13~16_기획전
    ${date}    현재 시간 구하기
    홈 > MY야놀자 메뉴 클릭
    MY야놀자 > 기획전 메뉴 클릭
    기획전 > QA로그전용 메뉴 클릭
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='국내그룹_수정X']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:place-content
    go back
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='레저그룹_수정X']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:LeisureListItem_body__1iNjJ
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    impr    13    ${date}    그룹별, 개별 상품별 노출(국내숙소)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    impr    14    ${date}    그룹별, 개별 상품별 노출(국내레져)    count=2
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    click    15    ${date}    그룹별, 개별 상품 클릭(국내숙소)
    Run Keyword And Continue On Failure    DILog 조회 및 검증    기획전    Exhibition    click    16    ${date}    그룹별, 개별 상품 클릭(국내레져)

17~21.해외숙소 서브홈 & 상품 클릭 & 예약 & 결제
    ${date}    현재 시간 구하기
    홈 > 해외숙소 메뉴 클릭
    해외숙소 서브홈 > 숙소 검색    시 피닉스 호텔
    해외숙소 상세 > 해외숙소 예약하기 진입
    해외숙소 예약하기 > 해외숙소 결제하기 진입
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GlobalPayment    view    17    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GlobalOrder    view    18    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GlobalOrder    click    19    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GHome    view    20    ${date}
    Run Keyword And Continue On Failure    DILog 조회 및 검증    해외숙소    GPlaceDetail    view    21    ${date}

22.무한쿠폰룸 서브홈 진입
    ${date}    현재 시간 구하기
    홈 > 무한쿠폰룸 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    마이룸    MyRoomHome    view    22    ${date}

23.게하 서브홈 진입
    ${date}    현재 시간 구하기
    홈 > 게하 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    게스트하우스    GHHome    view    23    ${date}

24.모텔 서브홈 진입
    ${date}    현재 시간 구하기
    홈 > 모텔 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내모텔    MTHome    view    24    ${date}

28~30.항공홈 & 검색결과 & 결제처 선택
    ${date}    현재 시간 구하기
    홈 > 항공권 메뉴 클릭
    항공권 검색
    항공권 검색결과 > 결제처 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightSearchList    view    28    ${date}    검색결과 페이지뷰
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightSearchList    click    29    ${date}    가격리스트에서 결제처선택
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightHome    view    30    ${date}

33~35.호텔 서브홈 & 테마형/리스트형 상품 클릭
    ${date}    현재 시간 구하기
    홈 > 호텔 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내호텔    HTHome    view    33    ${date}
    서브홈 > 테마형그룹 상품 클릭
    Go Back
    서브홈 > 리스트형 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내호텔    HTHome    click    34    ${date}    테마형그룹 추천 상품-카테고리별 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내호텔    HTHome    click    35    ${date}    리스트형 추천상품 - 상품 클릭

36~38.펜션 서브홈 & 테마형/리스트형 상품 클릭
    ${date}    현재 시간 구하기
    홈 > 펜션 메뉴 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내펜션    PSHome    view    36    ${date}
    서브홈 > 테마형그룹 상품 클릭
    Go Back
    서브홈 > 리스트형 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내펜션    PSHome    click    37    ${date}    테마형그룹 추천 상품-카테고리별 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    국내펜션    PSHome    click    38    ${date}    리스트형 추천상품 - 상품 클릭

39_40.국내숙소 추천 위젯 테마 & 상품 클릭
    ${date}    현재 시간 구하기
    홈 > 국내숙소 추천 위젯
    국내숙소 추천 위젯 > 상품 클릭
    Run Keyword And Continue On Failure    DILog 조회 및 검증    홈    Home    impr    39    ${date}    국내숙소 추천 위젯 테마(숙소카테고리) 숙소단위 impression    count=4
    Run Keyword And Continue On Failure    DILog 조회 및 검증    홈    Home    click    40    ${date}    국내숙소 추천 위젯 > 호텔/펜션 각 추천 상품 클릭
