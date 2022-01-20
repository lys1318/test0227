*** Settings ***
Library           SeleniumLibrary    WITH NAME    S
Library           DILog.py    WITH NAME    DILog
Library           DateTime    WITH NAME    DT
Library           GoogleAPI.py    WITH NAME    Google
Library           RequestsLibrary    WITH NAME    Re
Library           String
Library           Collections
Library           ImageRecognition.py    WITH NAME    IR

*** Variables ***
${executable_path}    /Users/youngsung.lee/Desktop/pythonWorkspace/테스트프로젝트/chromedriver
${username}       testys_auto@yanolja.com
${password}       qwer1234!
${totalTime}      30s
${checkTime}      3s
${CGNTID}         ${EMPTY}
${memberNo}       40202024
${GoogleDrive_URL}    https://docs.google.com/spreadsheets/d/1GRjMsn1f8Xv_Kfz9aikRgPDPl4CjdjMYQS_f89gNaIg/edit#gid=1409885317
${WORKSHEET}      PC_Web
${AUTHORIZATION}    eyJtZW1iZXJObyI6NDAyMDIwMjQsImNnbnRJZCI6ImFwLW5vcnRoZWFzdC0yJTNBMWI2YWQ5ZDctNzgxNC00ZTljLThiNWUtYjJhMTI5OTBhMjhlIn0=
${TEST_PHASE}     1

*** Keywords ***
Suite Setup
    로그인 후 cgntId 구하기
    [API_SET] 장바구니 조회 후 모두 삭제
    구글시트 테스트 수행 날짜 업데이트

Suite Teardown
    [API_SET] 오늘 자 장바구니 주문 전체 예약 취소
    sleep    3s
    Close Browser

로그인 후 cgntId 구하기
    이메일로 로그인 화면 오픈
    InputText Element[텍스트 입력하기]    id:username    ${username}
    InputText Element[텍스트 입력하기]    id:password    ${password}
    FOR    ${index}    IN RANGE    5
        ${attr}    Get Element Attribute[속성값 가져오기]    class: RectButton_primary__3O9TH    class
        ${loginBtn}    Run keyword and Ignore error    Should Contain    ${attr}    RectButton_disabled__14E3B
        Run Keyword If    '${loginBtn}[0]' == 'FAIL'    Exit For Loop
        Run Keyword If    '${loginBtn}[0]' == 'PASS'    Reload Page
        Run Keyword If    '${loginBtn}[0]' == 'PASS'    InputText Element[텍스트 입력하기]    id:username    ${username}
        Run Keyword If    '${loginBtn}[0]' == 'PASS'    InputText Element[텍스트 입력하기]    id:password    ${password}
    END
    Click Element[버튼 클릭]    xpath://*[text()='로그인']
    sleep    1s
    ${loginYn}    Get Text[텍스트 가져오기]    xpath://*[@class='MyNick_nickname__2Scd9']/div
    Should Be Equal    ${loginYn}    냐옹냐옹풀향기0001
    Click Element[버튼 클릭]    xpath://*[text()='포인트']
    ${cookie}    Get Cookie    cgntId
    ${cgntId}    Replace String    ${cookie.value}    %3A    :
    Set Global Variable    ${CGNTID}    ${cgntId}
    Log To Console    ${CGNTID}
    sleep    1s

이메일로 로그인 화면 오픈
    Open Browser    https://qa-m.yanolja.com/emaillogin?redirect=/mypage    Chrome    executable_path=${CURDIR}/chromedriver

메인 이동
    go to    https://qa-m.yanolja.com/

현재 시간 구하기
    ${date}    DT.Get Current Date
    [Return]    ${date}

홈 > 국내숙소 추천 위젯
    메인 이동
    Element Visible[요소 표시 여부 체크]    class:HomePlaceRecommend_container__380T6
    sleep    1s

홈 > 모텔 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='https://qa-m.yanolja.com/motel']
    Click Element[버튼 클릭]    xpath://*[@href='https://qa-m.yanolja.com/motel']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    모텔

홈 > 호텔 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='https://qa-m.yanolja.com/hotel']
    Click Element[버튼 클릭]    xpath://*[@href='https://qa-m.yanolja.com/hotel']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    호텔/리조트

홈 > 펜션 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='https://qa-m.yanolja.com/pension']
    Click Element[버튼 클릭]    xpath://*[@href='https://qa-m.yanolja.com/pension']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    펜션/풀빌라

홈 > 게하 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='https://qa-m.yanolja.com/guest-house']
    Click Element[버튼 클릭]    xpath://*[@href='https://qa-m.yanolja.com/guest-house']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    게하/한옥

홈 > 항공권 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='https://qa-m.yanolja.com/flights']
    Click Element[버튼 클릭]    xpath://*[@href='https://qa-m.yanolja.com/flights']
    ${title}    Get Text[텍스트 가져오기]    class:flights_title__35srd
    Should Be Equal    ${title}    항공권

홈 > 무한쿠폰룸 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='https://qa-m.yanolja.com/motel?myRoom=1']
    Click Element[버튼 클릭]    xpath://*[@href='https://qa-m.yanolja.com/motel?myRoom=1']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    무한쿠폰룸

홈 > 해외숙소 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='https://qa-m.yanolja.com/global/place']
    Click Element[버튼 클릭]    xpath://*[@href='https://qa-m.yanolja.com/global/place']
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[text()='해외숙소'])[1]
    Should Be Equal    ${title}    해외숙소
    sleep    3s

홈 > 지역 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[text()='강원도야놀자']
    Click Element[버튼 클릭]    xpath://*[text()='강원도야놀자']
    ${title}    Get Text[텍스트 가져오기]    class:RegionhomeMain_title__2GftR
    Should Be Equal    ${title}    강원도

홈 > 라이브 방송 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[text()='야놀자라이브']
    Click Element[버튼 클릭]    xpath://*[text()='야놀자라이브']
    ${title}    Get Text[텍스트 가져오기]    class:NavigationBarHeading_title__hHbul
    Should Be Equal    ${title}    야놀자라이브
    sleep    3s

홈 > 검색 버튼 클릭
    메인 이동
    sleep    1s
    Element Visible[요소 표시 여부 체크]    xpath://*[@alt='검색']
    Click Element[버튼 클릭]    xpath://*[@alt='검색']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    검색

홈 > MY야놀자 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='/mypage']
    Click Element[버튼 클릭]    xpath://*[@href='/mypage']
    ${title}    Get Text[텍스트 가져오기]    class:mypage_title__1NaG1
    Should Be Equal    ${title}    MY 야놀자

홈 > KTX 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='https://qa-m.yanolja.com/train']
    Click Element[버튼 클릭]    xpath://*[@href='https://qa-m.yanolja.com/train']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    KTX
    sleep    1s

국내숙소 추천 위젯 > 상품 클릭
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element[버튼 클릭]    class:ThemePlaceItem_image__2_Itg
    Element Visible[요소 표시 여부 체크]    class:_place_no__container__1FhXY
    sleep    1s

서브홈 > 테마형그룹 상품 클릭
    Element Visible[요소 표시 여부 체크]    class:SubhomeThemedItems_container__2BOx-
    Click Element[버튼 클릭]    class:ThemePlaceItem_container__1Clhm
    Element Visible[요소 표시 여부 체크]    class:_place_no__container__1FhXY

서브홈 > 리스트형 상품 클릭
    Element Visible[요소 표시 여부 체크]    class:SubhomeList_container__1WIAh
    Click Element[버튼 클릭]    class:ListItem_container__1z7jK
    Element Visible[요소 표시 여부 체크]    class:_place_no__container__1FhXY

지역 서브홈 > 지도 클릭
    ${listTitle}    Get Text[텍스트 가져오기]    class:RegionhomeMapInfo_active__3ZXSV
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element[버튼 클릭]    xpath://*[@aria-label='Map']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${listTitle}    ${title}

라이브 방송 서브홈 > 특정 방송 진입
    Select Frame[프레임 선택]    id:iFrameResizer0
    sleep    3s
    ${listTitle}    Get Text[텍스트 가져오기]    xpath:(//*[@class='info-title'])[1]
    sleep    3s
    Click Element[버튼 클릭]    class:card_wrapper
    Select Frame[프레임 선택]    id:live-commerce-broadcast
    ${title}    Get Text[텍스트 가져오기]    class:HeaderTitle_title__3SXU4
    Should Be Equal    ${listTitle}    ${title}

항공권 검색
    ${date}    현재 시간 구하기
    sleep    3s
    Click Element[버튼 클릭]    xpath://*[text()='편도']
    Click Element[버튼 클릭]    xpath://*[text()='도착']
    InputText Element[텍스트 입력하기]    class:FlightSearchAirportModal_searchInput__3oy24    BCN
    Click Element[버튼 클릭]    class:FlightSearchAirportBody_searchResultRow__3e7KX
    Click Element[버튼 클릭]    xpath://*[contains(text(), '여행 날짜')]
    Click Element[버튼 클릭]    xpath://*[text()='오늘']
    Click Element[버튼 클릭]    xpath://*[contains(text(), '적용')]
    Click Element[버튼 클릭]    xpath://*[text()='항공권 검색']
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightSearchList    view    30    ${date}    검색결과 페이지뷰
    FOR    ${index}    IN RANGE    2    10
        sleep    3s
        ${status}    Get Element[요소 가져오기]    class:FlightListEmpty_noSearchResult__24Glb
        IF    '${status}[0]' == 'PASS'
        Click Element[버튼 클릭]    class:CollapsingNavTopButtons_backButton__1NQwd
        Click Element[버튼 클릭]    class:FlightSearchFormBody_optionHasValue__2A08R
        Click Element[버튼 클릭]    xpath:(//div[contains(@class, 'DatePicker_calendarDaySelector__2_Ftx') and not(contains(@class, 'DatePicker_outsideRangeStyle__O4dXX'))])[${index}]
        Click Element[버튼 클릭]    xpath://*[contains(text(), '적용')]
        Click Element[버튼 클릭]    xpath://*[text()='항공권 검색']
        ELSE
        Exit For Loop
    END
    END

항공권 검색결과 > 결제처 클릭
    Click Element[버튼 클릭]    class:FlightListItem_container__23txc
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    항공권 정보
    Click Element[버튼 클릭]    class:FlightDetailProviders_providerAnchor__1t5eR
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    sleep    3s
    Close Window
    Switch Window    ${windows}[0]

해외숙소 서브홈 > 해외숙소 상품 클릭
    Click Element[버튼 클릭]    class:CurationItem_price__DJzAz
    Element Visible[요소 표시 여부 체크]    class:GlobalPlaceDetailBody_container__emEX3
    sleep    1s

해외숙소 서브홈 > 숙소 검색
    [Arguments]    ${keyword}
    Click Element[버튼 클릭]    class:GlobalPlaceHomeSearch_input__xqhtJ
    ${title}    Get Text[텍스트 가져오기]    xpath://*[text()='검색']
    Should Be Equal    ${title}    검색
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    sleep    1s
    Click Element[버튼 클릭]    class:KeywordHighlighted_text__gX5_U
    ${title}    Get Text[텍스트 가져오기]    class:GlobalPlaceListItem_title__3vXxU
    Should Be Equal    ${title}    시 피닉스 호텔
    Click Element[버튼 클릭]    class:GlobalPlaceListItem_title__3vXxU
    Element Visible[요소 표시 여부 체크]    class:GlobalPlaceDetailBody_container__emEX3
    sleep    1s

해외숙소 상세 > 해외숙소 예약하기 진입
    FOR    ${index}    IN RANGE    10
        sleep    3s
        ${btn}    Get Text[텍스트 가져오기]    xpath:(//*[@class='RectButton_label__WcAp7'])[1]
        IF    '${btn}' == '날짜 변경하기'
        Execute Javascript    window.scrollTo(0, 500)
        Click Element[버튼 클릭]    class:GlobalPlaceCommonUnbookableInfo_changeDateBtn__2A0ra
        ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
        Should Be Equal    ${title}    날짜 선택
        Click Element[버튼 클릭]    xpath:(//*[text()='체크아웃'])[2]
        Click Element[버튼 클릭]    xpath://*[contains(text(), '체크인 검색')]
        ELSE
        Exit For Loop
    END
    END
    Click Element[버튼 클릭]    class:RectButton_label__WcAp7
    Click Element[버튼 클릭]    xpath://*[text()='예약하기']
    ${title}    Get Text[텍스트 가져오기]    class:toolbar-title
    Should Be Equal    ${title}    해외숙소 예약

해외숙소 예약하기 > 해외숙소 결제하기 진입
    InputText Element[텍스트 입력하기]    id:성명    이영성
    InputText Element[텍스트 입력하기]    id:이메일    ${username}
    InputText Element[텍스트 입력하기]    id:성(영문)    test
    InputText Element[텍스트 입력하기]    id:이름(영문)    test
    Click Element[버튼 클릭]    xpath://*[text()='전체 동의']
    Click Element[버튼 클릭]    class:radius-md
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    sleep    3s
    Close Window
    Switch Window    ${windows}[0]

하단 메뉴 홈 클릭
    Click Element[버튼 클릭]    class:TabIcon_home__1SIsl

검색 > 국내숙소 검색결과 > PDP 이동
    [Arguments]    ${keyword}
    sleep    1s
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    Click Element[버튼 클릭]    xpath://*[@alt='검색']
    Click Element[버튼 클릭]    xpath:(//*[@class='PlaceListItemText_container__fUIgA text-unit'])[1]
    Element Visible[요소 표시 여부 체크]    class:_place_no__container__1FhXY

검색 > 레저/티켓탭 클릭
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='레저/티켓']

PDP > RDP
    sleep    1s
    Click Element[버튼 클릭]    class:RectButton_label__WcAp7
    Click Element[버튼 클릭]    class:RoomItem_roomItemContainerStyle__3XjIR
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    객실상세

RDP > 숙박 예약
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='숙박 예약하기']
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
    Should Be Equal    ${title}    숙박 예약

숙박 예약 > 예약
    Click Element[버튼 클릭]    xpath://*[text()='바로 예약하기']
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    ${title}    Get Text[텍스트 가져오기]    class:center
    Should Be Equal    ${title}    예약

예약(포인트 결제) > 예약완료
    Click Element[버튼 클릭]    xpath://*[text()='전액 사용하기']
    ${amount}    Get Text[텍스트 가져오기]    class:css-128od1m
    Should Be Equal    ${amount}    0원 결제하기
    Click Element[버튼 클릭]    class:css-128od1m
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    ${title}    Get Text[텍스트 가져오기]    class:title
    Should Be Equal    ${title}    예약 완료되었습니다.
    sleep    3s
    Close Window
    Switch Window    ${windows}[0]

예약(신한카드 결제) > 예약완료
    Click Element[버튼 클릭]    xpath://*[@alt='카드 아이콘']
    Click Element[버튼 클릭]    class:css-128od1m
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Select Frame    id:naxIfr
    ${title}    Get Text[텍스트 가져오기]    id:spay_logo_t
    Should Be Equal    ${title}    야놀자_TEST
    Click Element[버튼 클릭]    xpath://*[@for='chk_all']
    Click Element[버튼 클릭]    id:CCLG
    Click Element[버튼 클릭]    id:cardNext
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Select Frame    id:CARD_CERT_IFR
    ${title}    Get Text[텍스트 가져오기]    class:npm-logo
    Should Be Equal    ${title}    ShinhanCard
    Click Element[버튼 클릭]    xpath:(//*[text()='다른 결제'])[1]
    Click Element[버튼 클릭]    xpath://*[text()='일반 결제']
    InputText Element[텍스트 입력하기]    id:cardNum1    3562
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan9.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan7.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan4.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan6.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan0.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan4.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan9.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan7.png
    InputText Element[텍스트 입력하기]    id:cardNum4    4758
    Click Element[버튼 클릭]    id:inputCVC
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan4.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan1.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan6.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan입력완료.png
    Click Element[버튼 클릭]    class:btn-primary
    Click Element[버튼 클릭]    id:authPassword
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhanㄷ.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhanㅐ.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhanㅎ.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhanㅕ.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhanㄴ.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan_1.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan_0.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan_1.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan_4.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan#+=.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan!.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan@.png
    IR.Image Click    ${CURDIR}/Images/shinhan/shinhan_입력완료.png
    Click Element[버튼 클릭]    class:btn-primary
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Select Frame    id:naxIfr
    Click Element[버튼 클릭]    id:cardNext
    ${title}    Get Text[텍스트 가져오기]    class:title
    Should Be Equal    ${title}    예약 완료되었습니다.
    sleep    3s
    Close Window
    Switch Window    ${windows}[0]

예약(간편계좌 결제) > 예약완료
    Click Element[버튼 클릭]    xpath://*[@alt='간편 계좌 결제 아이콘']
    Click Element[버튼 클릭]    class:css-128od1m
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Select Frame[프레임 선택]    name:yanoljapay_view
    Click Element[버튼 클릭]    id:081
    IR.Image Click    ${CURDIR}/Images/easy/간편8.png
    IR.Image Click    ${CURDIR}/Images/easy/간편5.png
    IR.Image Click    ${CURDIR}/Images/easy/간편1.png
    IR.Image Click    ${CURDIR}/Images/easy/간편3.png
    IR.Image Click    ${CURDIR}/Images/easy/간편1.png
    IR.Image Click    ${CURDIR}/Images/easy/간편8.png
    ${title}    Get Text[텍스트 가져오기]    class:title
    Should Be Equal    ${title}    예약 완료되었습니다.
    sleep    3s
    Close Window
    Switch Window    ${windows}[0]

검색 > 레저티켓 검색결과 > 상품상세 이동
    [Arguments]    ${keyword}
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    Click Element[버튼 클릭]    class:AutocompleteSection_entry__iDjdk
    ${title}    Get Text[텍스트 가져오기]    class:LeisureDetailTitle_title__39CSC
    Should Be Equal    ${title}    ${keyword}

레저 상세 > 예약
    sleep    1s
    Click Element[버튼 클릭]    class: RectButton_primary__3O9TH
    Click Element[버튼 클릭]    xpath://*[text()='+']
    Click Element[버튼 클릭]    class: RectButton_primary__3O9TH
    ${title}    Get Text[텍스트 가져오기]    class:center
    Should Be Equal    ${title}    예약

장바구니 담기
    Click Element[버튼 클릭]    class: RectButton_secondary__3qOVd
    Element Visible[요소 표시 여부 체크]    class:PageTitleRightButton_cartCount__1WJxk

장바구니 이동
    Click Element[버튼 클릭]    xpath://*[@alt='장바구니']
    ${title}    Get Text[텍스트 가져오기]    xpath://*[text()='장바구니']
    Should Be Equal    ${title}    장바구니

장바구니 > 예약
    Click Element[버튼 클릭]    class:primary
    ${title}    Get Text[텍스트 가져오기]    xpath://*[text()='예약']
    Should Be Equal    ${title}    예약

MY야놀자 > 기획전 메뉴 클릭
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element[버튼 클릭]    //*[@href='/exhibition']
    ${title}    Get Text[텍스트 가져오기]    (//*[@class='ExhibitionListNav_normal__1ha2N'])[1]
    Should Be Equal    ${title}    기획전

기획전 > QA로그전용 메뉴 클릭
    IR.Image MoveTo    ${CURDIR}/Images/Home.png
    Scroll Wheel Click[휠로 스크롤하여 요소 클릭]    xpath://*[text()='QA 로그 전용']
    ${title}    Get Text[텍스트 가져오기]    //*[@class='ExhibitionDetailNav_title__1NE43']
    Should Be Equal    ${title}    QA 로그 전용

KTX > 승차권 조건 선택 후 조회 버튼 클릭
    [Arguments]    ${arrival}
    Click Element[버튼 클릭]    class:TrainSHomeStationDisplay_placeholder__3yNbY
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
    Should Be Equal    ${title}    도착역 선택
    InputText Element[텍스트 입력하기]    class:TrainSHomeStationModalTitle_input__573Rb    ${arrival}
    Click Element[버튼 클릭]    class:TrainSHomeStationModal_suggestion__24s5l
    Click Element[버튼 클릭]    class:TrainSHomeBody_datePlaceholder__hCwn1
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
    Should Be Equal    ${title}    날짜 선택
    Click Element[버튼 클릭]    xpath://div[contains(@class, 'TrainSHomeCalendarModal_calendarDaySelector__uXOSA') and not(contains(@class, 'TrainSHomeCalendarModal_outsideRangeStyle___ZYRF'))]
    Click Element[버튼 클릭]    xpath://*[contains(text(), '적용')]
    Click Element[버튼 클릭]    class:RectButton_label__WcAp7

승차권 유무 체크 후 요금조회 버튼 클릭
    ${status}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Get WebElement    xpath://*[text()='재시도 하기']
    Run Keyword If    '${status}[0]' == 'PASS'    Click Element[버튼 클릭]    xpath://*[text()='재시도 하기']
    FOR    ${index}    IN RANGE    30
        ${status}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Get WebElement    xpath://*[text()='요금조회']
        Run Keyword If    '${status}[0]' == 'FAIL'    Click Element[버튼 클릭]    xpath://*[@class='TrainTicketsNavButtons_changeDate__ualU1']
        Run Keyword If    '${status}[0]' == 'FAIL'    Continue For Loop
        Run Keyword If    '${status}[0]' == 'PASS'    Click Element[버튼 클릭]    xpath://*[text()='요금조회']
        Run Keyword If    '${status}[0]' == 'PASS'    Exit For Loop
    END

바로 예매 > 선택한 승차권 장바구니 담기
    Click Element[버튼 클릭]    xpath://*[text()='바로 예매']
    Click Element[버튼 클릭]    xpath://*[text()='확인']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    선택한 승차권
    Click Element[버튼 클릭]    xpath://*[text()='장바구니 담기']

레저티켓 장바구니 담기
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [테스트] 야놀자 놀이공원
    sleep    1s
    Click Element[버튼 클릭]    class: RectButton_primary__3O9TH
    Click Element[버튼 클릭]    xpath://*[text()='+']
    장바구니 담기

[API] 장바구니 조회
    [Arguments]    ${r_authorization}
    ${headers}    Create Dictionary    authorization=${r_authorization}
    ${response}    Re.GET    http://shopping-cart-api.qa.yanolja.in/cart/v1/options    headers=${headers}
    Log    ${response.json()}
    Get Length    ${response.json()}
    @{test_list}    Create List
    FOR    ${index}    IN    @{response.json()}
    FOR    ${test}    IN    @{index}[options]
        Append To List    ${test_list}    ${test}[id]
    END
    END
    Log    ${test_list}
    [Return]    ${test_list}

[API] 장바구니 상품 삭제
    [Arguments]    ${r_authorization}    ${option_ids}
    ${headers}    Create Dictionary    authorization=${r_authorization}
    ${params}    Create Dictionary    option_ids=${option_ids}
    ${response}    Re.DELETE    http://shopping-cart-api.qa.yanolja.in/cart/v1/options    headers=${headers}    params=${params}
    Re.Status Should Be    200    ${response}
    [Return]    ${response}

[API_SET] 장바구니 조회 후 모두 삭제
    ${id_list}    [API] 장바구니 조회    ${AUTHORIZATION}
    ${len}    Get Length    ${id_list}
    Return From Keyword If    ${len} == 0
    ${response}    [API] 장바구니 상품 삭제    ${AUTHORIZATION}    ${id_list}

[API] 장바구니 주문 조회 API_건별예약번호
    [Arguments]    ${r_authorization}
    ${headers}    Create Dictionary    authorization=${r_authorization}
    ${date}    DT.Get Current Date    result_format=%Y%m%d
    ${params}    Create Dictionary    page=1    size=100    from=${date}    to=${date}    categoryGroup=ALL
    ${response}    Re.GET    http://order-coordinator.qa.yanolja.in/cart/v1/orders    headers=${headers}    params=${params}
    Log    ${response.json()}
    Get Length    ${response.json()}
    @{motel_reservationNo_list}    Create List
    @{train_reservationNo_list}    Create List
    @{reisure_reservationNo_list}    Create List
    FOR    ${index}    IN    @{response.json()}[orders]
    FOR    ${category}    IN    @{index}[categoryOrders]
        Run Keyword And Ignore Error    Continue For Loop If    '${category}[statusGroupCode]' == 'CANCEL'
        Run Keyword And Ignore Error    Continue For Loop If    '${category}[tickets][0][status]' == 'CANCELED'
        Run Keyword And Ignore Error    Continue For Loop If    '${category}[items][0][status]' == 'CANCEL_REQUESTED'
        Run Keyword And Ignore Error    Continue For Loop If    '${category}[items][0][status]' == 'USER_CANCEL_COMPLETED'
        Run Keyword If    '${category}[category]' == 'DOMESTIC_RESERVATION'    Append To List    ${motel_reservationNo_list}    ${category}[id]
        Run Keyword If    '${category}[category]' == 'DOMESTIC_TRAIN'    Append To List    ${train_reservationNo_list}    ${category}[id]
        Run Keyword If    '${category}[category]' == 'DOMESTIC_LEISURE'    Append To List    ${reisure_reservationNo_list}    ${category}[id]
    END
    END
    Log    ${motel_reservationNo_list}
    Log    ${train_reservationNo_list}
    Log    ${reisure_reservationNo_list}
    [Return]    ${motel_reservationNo_list}    ${train_reservationNo_list}    ${reisure_reservationNo_list}

[API] 장바구니 관리자 예약 취소 API
    [Arguments]    ${r_authorization}    ${motel_reservationNo_list}    ${train_reservationNo_list}    ${reisure_reservationNo_list}
    [Documentation]    https://confluence.yanolja.in/pages/viewpage.action?pageId=255388906
    Comment    ${headers}    Create Dictionary    authorization=${r_authorization}
    # MOTEL 예약 취소
    ${headers}    Create Dictionary    X-Caller=qa
    ${params}    Create Dictionary    adminCancelType=T_ALL    category=ETC    code=ET03    reason=QAAuto    adminUserName=youngsung.lee    adminUserId=youngsung.lee
    FOR    ${reservationNo}    IN    @{motel_reservationNo_list}
        ${response}    Re.POST    http://reservation-api.qa.yanolja.in/v2/cart/reservation/${reservationNo}/admin-cancel    headers=${headers}    json=${params}
        Comment    Continue For Loop If    ${index}[id]
        Log    ${response}
    END
    # 기차 예약 취소
    ${headers}    Create Dictionary    authorization=${r_authorization}
    FOR    ${reservationNo}    IN    @{train_reservationNo_list}
    ${response1}    Re.GET    http://train-order-api.qa.yanolja.in/domestic-train/v2/orders/${reservationNo}    headers=${headers}
    ${temp_list}    Set Variable    ${EMPTY}
    FOR    ${ticket}    IN    @{response1.json()}[tickets]
        ${temp_list}    Set Variable If    '${temp_list}' == '${EMPTY}'    ${ticket}[id]    ${temp_list},${ticket}[id]
    END
    ${params}    Create Dictionary    tickets=${temp_list}
    ${response}    Re.DELETE    http://train-order-api.qa.yanolja.in/domestic-train/v2/orders/${reservationNo}    headers=${headers}    params=${params}
    Comment    Continue For Loop If    ${index}[id]
    Log    ${response}
    END
    # 레저 예약 취소
    ${headers}    Create Dictionary    authorization=${r_authorization}
    FOR    ${reservationNo}    IN    @{reisure_reservationNo_list}
    ${response1}    Re.GET    http://order-api.qa.yanolja.in/domestic-leisure/v2/orders/${reservationNo}    headers=${headers}
    ${temp_list}    Set Variable    ${EMPTY}
    FOR    ${item}    IN    @{response1.json()}[items]
        ${temp_list}    Set Variable If    '${temp_list}' == '${EMPTY}'    ${item}[id]    ${temp_list},${item}[id]
    END
    ${params}    Create Dictionary    items=${temp_list}
    ${response}    Re.DELETE    http://order-api.qa.yanolja.in/domestic-leisure/v2/orders/${reservationNo}    headers=${headers}    params=${params}
    Comment    Continue For Loop If    ${index}[id]
    Log    ${response}
    END

[API] 장바구니 주문 조회 API_통합주문번호
    [Arguments]    ${r_authorization}
    ${headers}    Create Dictionary    authorization=${r_authorization}
    ${date}    DT.Get Current Date    result_format=%Y%m%d
    ${params}    Create Dictionary    page=1    size=100    from=${date}    to=${date}    categoryGroup=ALL
    ${response}    Re.GET    http://order-coordinator.qa.yanolja.in/cart/v1/orders    headers=${headers}    params=${params}
    Log    ${response.json()}
    Get Length    ${response.json()}
    @{test_list}    Create List
    FOR    ${index}    IN    @{response.json()}[orders]
        Comment    Continue For Loop If    ${index}[id]
        Append To List    ${test_list}    ${index}[id]
    END
    Log    ${test_list}
    [Return]    ${test_list}

[API_SET] 장바구니 주문 조회 후 모두 예약 취소
    ${motel_reservationNo_list}    ${train_reservationNo_list}    ${reisure_reservationNo_list}    [API] 장바구니 주문 조회 API_건별예약번호    ${AUTHORIZATION}
    [API] 장바구니 관리자 예약 취소 API    ${AUTHORIZATION}    ${motel_reservationNo_list}    ${train_reservationNo_list}    ${reisure_reservationNo_list}

[API_SET] 오늘 자 장바구니 주문 전체 예약 취소
    [API_SET] 장바구니 주문 조회 후 모두 예약 취소

DILog 조회 및 검증
    [Arguments]    ${class}    ${page_name}    ${event_type}    ${case_no}    ${date}    ${desc}=${EMPTY}    ${count}=1
    ${status}    ${response}    DILog.Get Log Page Name Event Type    ${page_name}    ${event_type}    ${date}    ${desc}    ${count}    ${CGNTID}
    Run Keyword If    ${status}    Set Test Message    설명 : ${response}[desc]\n페이지명 : ${response}[pageName]\n이벤트타입 : ${response}[eventType]\n버전 : ${response}[version] \n야놀자 앱 버전 : ${response}[app_ver]\nOS 이름 : ${response}[os_name]\n로그 기록 시간 : ${response}[time]
    Comment    구글 스프레드 시트 결과 업데이트    ${status}    ${WORKSHEET}    ${case_no}
    Run Keyword If    '${TEST_PHASE}' == '1'    구글 스프레드 시트 결과 업데이트_플러스    ${status}    ${WORKSHEET}    ${case_no}    ${response}    ${class}    ${page_name}    ${event_type}
    Run Keyword Unless    '${TEST_PHASE}' == '1'    구글 스프레드 시트 결과 업데이트    ${status}    ${WORKSHEET}    ${case_no}    ${response}
    Should Be True    ${status}

구글 스프레드 시트 결과 업데이트
    [Arguments]    ${status}    ${work_sheet}    ${case_no}    ${response}
    ${status}    Set Variable If    ${status}    Pass    Fail
    ${cell}    Evaluate    ${case_no} + 13
    # 결과 업데이트
    Google.Write Value On Cell    ${GoogleDrive_URL}    ${work_sheet}    L${cell}    ${status}
    # 응답 업데이트
    Google.Write Value On Cell    ${GoogleDrive_URL}    ${work_sheet}    O${cell}    ${response}

구글 스프레드 시트 결과 업데이트_플러스
    [Arguments]    ${status}    ${work_sheet}    ${case_no}    ${response}    ${class}    ${page_name}    ${event_type}
    ${status}    Set Variable If    ${status}    Pass    Fail
    ${cell}    Evaluate    ${case_no} + 13
    @{update_value}    Run Keyword If    '${status}' == 'Pass'    Create List    ${case_no}    ${response}[priority]    ${class}    ${response}[pageName]    ${response}[desc] (v${response}[version])    ${response}[eventType]    ${status}    ${response}
    ...    ELSE    Create List    ${case_no}    ${EMPTY}    ${class}    ${page_name}    ${EMPTY}    ${event_type}    ${status}    ${EMPTY}
    Google.Batch Update    ${GoogleDrive_URL}    ${work_sheet}    B${cell}:P${cell}    @{update_value}

구글시트 테스트 수행 날짜 업데이트
    ${date}    DT.Get Current Date    result_format=%Y.%m.%d
    Google.Write Value On Cell    ${GoogleDrive_URL}    ${WORKSHEET}    Q7    ${date}

Click Element[버튼 클릭]
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    ${element}

InputText Element[텍스트 입력하기]
    [Arguments]    ${element}    ${input_text}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    ${element}    ${input_text}

Get Element Attribute[속성값 가져오기]
    [Arguments]    ${element}    ${attribute}
    ${get_attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Element Attribute    ${element}    ${attribute}
    [Return]    ${get_attr}

Get Text[텍스트 가져오기]
    [Arguments]    ${element}
    ${get_text}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    ${element}
    [Return]    ${get_text}

Element Visible[요소 표시 여부 체크]
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    ${element}

Get Element[요소 가져오기]
    [Arguments]    ${element}
    ${get_element}    Run keyword and Ignore error    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get WebElement    ${element}
    [Return]    ${get_element}

Select Frame[프레임 선택]
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Select Frame    ${element}

Scroll Click[스크롤하여 요소 클릭]
    [Arguments]    ${element}
    FOR    ${index}    IN RANGE    100
        ${status}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Element Should Be Visible    ${element}
        Run Keyword If    '${status}[0]' == 'FAIL'    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
        Run Keyword If    '${status}[0]' == 'PASS'    Click Element[버튼 클릭]    ${element}
        Run Keyword If    '${status}[0]' == 'PASS'    Exit For Loop
    END

Scroll Wheel Click[휠로 스크롤하여 요소 클릭]
    [Arguments]    ${element}
    FOR    ${index}    IN RANGE    5
        ${status}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Element Should Be Visible    ${element}
        Run Keyword If    '${status}[0]' == 'FAIL'    IR.Mouse Scroll
        ${status2}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Click Element    ${element}
        Run Keyword If    '${status2}[0]' == 'FAIL'    IR.Mouse Scroll
        Run Keyword If    '${status2}[0]' == 'PASS'    Click Element[버튼 클릭]    ${element}
        Run Keyword If    '${status2}[0]' == 'PASS'    Exit For Loop
    END
