*** Settings ***
Library           DILog.py    WITH NAME    DILog
Library           DateTime    WITH NAME    DT
Library           GoogleAPI.py    WITH NAME    Google
Library           RequestsLibrary    WITH NAME    Re
Library           String
Library           Collections
Library           ImageRecognition.py    WITH NAME    IR
Library           OperatingSystem    WITH NAME    OS
Library           SeleniumLibrary

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
${stage_username}    qa_test02@yanolja.com
${stage_password}    qwert12345@
${GoogleDrive_URL_StageBasic}    https://docs.google.com/spreadsheets/d/1esDCuZK5eO4fT0XDrDjRc3l4DS3WMxJHnBCMIv0Pes0/edit#gid=0
${WORKSHEET_StageBasic}    v.8.13.0 기준
${QAMain}         https://qa-m.yanolja.com
${StageMain}      https://stage-m.yanolja.com
${LiveMain}       https://www.yanolja.com
${TAGS}           ${EMPTY}
${GoogleDriveLive_FolderID}    1LxHVRACBKasJEPkthAArZxQyFje9B6Eq
${GoogleDriveLive_FileID}    1Kld4gqXtOsnbtRQ7o8Ek4GjJ2462DsixZ2bEyOgI8ho
${GoogleURL}      /Users/youngsung.lee/google_url
${GoogleColumn}    K

*** Keywords ***
Suite Setup
    QA 테스트숙소 노출 설정
    로그인 후 cgntId 구하기
    [API_SET] 장바구니 조회 후 모두 삭제
    구글시트 테스트 수행 날짜 업데이트

Suite Teardown
    sleep    3s
    Close Browser

TC Teardown
    [API_SET] 장바구니 주문 조회 후 모두 예약 취소

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
    Click Element[버튼 클릭]    xpath://*[contains (text(), '야놀자 포인트')]
    ${cookie}    Get Cookie    cgntId
    ${cgntId}    Replace String    ${cookie.value}    %3A    :
    Set Global Variable    ${CGNTID}    ${cgntId}
    Log To Console    ${CGNTID}
    sleep    1s

이메일로 로그인 화면 오픈
    Comment    Open Browser    ${QAMain}/emaillogin?redirect=/mypage    Chrome    executable_path=${CURDIR}/chromedriver
    Comment    Open Browser    ${QAMain}/emaillogin?redirect=/mypage    Safari
    go to    ${QAMain}/emaillogin?redirect=/mypage
    Maximize Browser Window

메인 이동
    ${tags}    Set Variable    @{TEST TAGS}
    Set Global Variable    ${TAGS}    ${tags}
    ${type_TAGS}    Run keyword and Ignore error    Evaluate    type(${TAGS}).__name__
    IF    '${type_TAGS}[0]' == 'FAIL'
    Run Keyword If    '${TAGS}' == 'WEB_LOG'    go to    https://qa-m.yanolja.com/
    Run Keyword If    '${TAGS}' == 'StageBasic'    go to    https://stage-m.yanolja.com/
    Run Keyword If    '${TAGS}' == 'LiveBasic'    go to    https://www.yanolja.com/
    ELSE
    Run Keyword If    '${TAGS}[1]' == 'TEST'    go to    https://www.yanolja.com/
    END

현재 시간 구하기
    ${date}    DT.Get Current Date
    [Return]    ${date}

국내숙소 > 모텔 메뉴 클릭
    Comment    Element Visible[요소 표시 여부 체크]    xpath://*[text()='모텔']
    Comment    Click Element[버튼 클릭]    xpath://*[text()='모텔']
    Comment    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    모텔

국내숙소 > 호텔 메뉴 클릭
    Comment    Element Visible[요소 표시 여부 체크]    xpath://*[text()='호텔']
    Comment    Click Element[버튼 클릭]    xpath://*[text()='호텔']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    호텔/리조트

국내숙소 > 펜션 메뉴 클릭
    Comment    Element Visible[요소 표시 여부 체크]    xpath://*[text()='펜션/풀빌라']
    Comment    Click Element[버튼 클릭]    xpath://*[text()='펜션/풀빌라']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    펜션/풀빌라

국내숙소 > 게하/한옥 메뉴 클릭
    Comment    Element Visible[요소 표시 여부 체크]    xpath://*[text()='게하/한옥']
    Comment    Click Element[버튼 클릭]    xpath://*[text()='게하/한옥']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    게하/한옥

교통/항공 > 항공권 메뉴 클릭
    Comment    Element Visible[요소 표시 여부 체크]    xpath://*[contains (text(), '항공권')]
    Comment    Click Element[버튼 클릭]    xpath://*[contains (text(), '항공권')]
    ${title}    Get Text[텍스트 가져오기]    class:flights_title__35srd
    Should Be Equal    ${title}    항공권

추천 > 무한쿠폰룸 메뉴 클릭
    Comment    메인 이동
    Comment    Element Visible[요소 표시 여부 체크]    xpath://*[text()='무한쿠폰룸']
    Comment    Click Element[버튼 클릭]    xpath://*[text()='무한쿠폰룸']
    Comment    Go To    ${QAMain}/motel?myRoom=1
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    무한쿠폰룸

해외여행 > 해외숙소 메뉴 클릭
    Element Visible[요소 표시 여부 체크]    xpath://*[text()='해외숙소']
    Click Element[버튼 클릭]    xpath://*[text()='해외숙소']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Contain    ${title}    여행지 선택
    sleep    3s

국내숙소 > 강원도 메뉴 클릭
    Element Visible[요소 표시 여부 체크]    xpath:(//*[contains(text(),'강원도')])[1]
    Click Element[버튼 클릭]    xpath:(//*[contains(text(),'강원도')])[1]
    ${title}    Get Text[텍스트 가져오기]    class:RegionhomeMain_title__2vNhH
    Should Be Equal    ${title}    강원도

홈 > 라이브 방송 메뉴 클릭
    Comment    메인 이동
    Comment    Element Visible[요소 표시 여부 체크]    xpath:(//*[contains (text(), '라이브')])[1]
    Comment    Click Element[버튼 클릭]    xpath:(//*[contains (text(), '라이브')])[1]
    ${title}    Get Text[텍스트 가져오기]    class:NavigationBarHeading_title__hHbul
    Should Be Equal    ${title}    야놀자라이브
    sleep    3s

홈 > 검색 버튼 클릭
    메인 이동
    sleep    1s
    Element Visible[요소 표시 여부 체크]    xpath://*[contains(@class, 'HomeSearchBar_search__')]
    Click Element[버튼 클릭]    xpath://*[contains(@class, 'HomeSearchBar_search__')]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    검색

홈 > MY야놀자 메뉴 클릭
    메인 이동
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='/mypage']
    Click Element[버튼 클릭]    xpath://*[@href='/mypage']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:mypage_title__1NaG1
    Should Be Equal    ${title}    MY 야놀자

교통/항공 > KTX 메뉴 클릭
    Element Visible[요소 표시 여부 체크]    xpath://*[contains (text(), '기차')]
    Click Element[버튼 클릭]    xpath://*[contains (text(), '기차')]
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    기차
    sleep    1s

국내숙소 추천 위젯 > 상품 클릭
    Element Visible[요소 표시 여부 체크]    class:ThemeRecommend_container__3BtqE
    ${listName}    Get Text[텍스트 가져오기]    xpath:(//*[@class='ThemeRecommendList_title__3ak-i'])[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2s
    Execute Javascript    window.scrollTo(0, 0)
    Click Element[버튼 클릭]    xpath:(//*[@class='ThemeRecommendList_itemWrapper__1Y0NM'])[1]
    ${title}    Get Text[텍스트 가져오기]    xpath://*[contains (@class, 'property-title')]
    Should Contain    ${title}    ${listName}

서브홈 > 테마형그룹 상품 클릭
    Element Visible[요소 표시 여부 체크]    class:SubhomeThemedItems_container__2BOx-
    ${listName}    Get Text[텍스트 가져오기]    xpath:(//*[@class='ThemePlaceItem_title__1fyvQ'])[1]
    Click Element[버튼 클릭]    class:ThemePlaceItem_container__1Clhm
    ${title}    Get Text[텍스트 가져오기]    xpath://*[contains (@class, 'property-title')]
    Should Contain    ${title}    ${listName}
    [Teardown]    PDP 튜토리얼 체크

서브홈 > 리스트형 상품 클릭
    Element Visible[요소 표시 여부 체크]    class:SubhomeList_container__1WIAh
    ${listName}    Get Text[텍스트 가져오기]    xpath:(//*[@class='ListItem_title__1-j89'])[1]
    Click Element[버튼 클릭]    class:ListItem_container__1z7jK
    ${title}    Get Text[텍스트 가져오기]    xpath://*[contains (@class, 'property-title')]
    Should Contain    ${title}    ${listName}
    [Teardown]    PDP 튜토리얼 체크

지역 서브홈 > 지도 클릭
    go to    ${QAMain}/region/4200000000
    ${listTitle}    Get Text[텍스트 가져오기]    class:RegionhomeMapInfo_active__3d7xW
    sleep    2s
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element[버튼 클릭]    class:RegionhomeMapInfo_map__3cGqj
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${listTitle}    ${title}

라이브 방송 서브홈 > 특정 방송 진입
    Select Frame[프레임 선택]    id:iFrameResizer0
    sleep    3s
    ${listTitle}    Get Text[텍스트 가져오기]    xpath:(//*[@class='info-title'])[1]
    sleep    3s
    Click Element[버튼 클릭]    class:card_wrapper
    Unselect Frame
    Select Frame[프레임 선택]    id:live-commerce-broadcast
    ${title}    Get Text[텍스트 가져오기]    xpath://*[contains (@class, 'HeaderInfo_broadcast_name')]
    Should Contain    ${listTitle}    ${title}

항공권 검색
    [Arguments]    ${arrival}
    ${date}    현재 시간 구하기
    Click Element[버튼 클릭]    xpath://*[text()='도착']
    InputText Element[텍스트 입력하기]    class:FlightSearchAirportModal_searchInput__3oy24    ${arrival}
    Click Element[버튼 클릭]    class:FlightSearchAirportBody_searchResultRow__3e7KX
    Click Element[버튼 클릭]    xpath://*[contains(text(), '여행 날짜')]
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='오늘']
    Click Element[버튼 클릭]    xpath://*[contains(text(), '적용')]
    Click Element[버튼 클릭]    xpath://*[text()='항공권 검색']
    Run Keyword And Continue On Failure    DILog 조회 및 검증    항공권    FlightSearchList    view    29    ${date}    검색결과 페이지뷰
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
    sleep    2s
    Click Element[버튼 클릭]    class:FlightListItem_container__23txc
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    항공권 정보
    Click Element[버튼 클릭]    class:FlightDetailProviders_providerAnchor__1t5eR
    sleep    7s
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
    Click Element[버튼 클릭]    class: GlobalPlaceAreaListSearch_input__3zV2X
    ${title}    Get Text[텍스트 가져오기]    xpath://*[text()='검색']
    Should Be Equal    ${title}    검색
    sleep    1s
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    sleep    1s
    Click Element[버튼 클릭]    class:KeywordHighlighted_text__gX5_U
    ${title}    Get Text[텍스트 가져오기]    class:GlobalPlaceListItem_title__3vXxU
    Should Be Equal    ${title}    시 피닉스 호텔
    Click Element[버튼 클릭]    class:GlobalPlaceListItem_title__3vXxU
    Element Visible[요소 표시 여부 체크]    class:GlobalPlaceDetailBody_container__emEX3
    sleep    1s

해외숙소 상세 > 예약가능날짜 체크
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

해외숙소 예약하기 > 해외숙소 결제하기 진입
    Comment    InputText Element[텍스트 입력하기]    id:성명    이영성
    Comment    InputText Element[텍스트 입력하기]    id:이메일    ${username}
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

검색 > 국내숙소 검색결과 > PDP 이동 (QA)
    [Arguments]    ${keyword}
    sleep    3s
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    Click Element[버튼 클릭]    xpath: //*[@alt='검색']
    sleep    3s
    Click Element[버튼 클릭]    xpath:(//*[text()='${keyword}'])[2]
    Comment    go to    https://qa-place-site.yanolja.com/places/10005602
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    xpath://*[contains (@class, 'property-title')]
    Should Be Equal    ${title}    ${keyword}
    [Teardown]    PDP 튜토리얼 체크

검색 > 레저/티켓탭 클릭
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='레저/티켓']
    sleep    2s

PDP > RDP (모/호/게 대실포함)
    sleep    1s
    모텔 대실 예약가능 여부 체크
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:css-1kml15s
    Should Be Equal    ${title}    객실상세

PDP > RDP (모텔 숙박)
    sleep    1s
    모텔 숙박 예약가능 여부 체크
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:css-1kml15s
    Should Be Equal    ${title}    객실상세

PDP > RDP (펜션)
    sleep    1s
    펜션 예약가능 여부 체크
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    class:css-1kml15s
    Should Be Equal    ${title}    객실상세

RDP > 모텔 숙박 예약
    sleep    1s
    Click Element[버튼 클릭]    xpath:(//*[text()='객실 예약하기'])[2]
    sleep    3s
    ${title}    Get Text[텍스트 가져오기]    class:css-18k5no3
    Should Be Equal    ${title}    숙박 예약
    RDP > 무료취소여부체크

바로 예약 > 예약
    Click Element[버튼 클릭]    xpath://*[text()='바로 예약']
    Click Element[버튼 클릭]    xpath://*[@data-testid='popup-button']
    sleep    3s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:center
    Should Be Equal    ${title}    예약

예약(포인트 결제) > 예약완료
    sleep    1s
    ${transportYn}    Run keyword and Ignore error    Element Visible[요소 표시 여부 체크]    class:css-i1l4h7
    Run Keyword If    '${transportYn}[0]' == 'FAIL'    Click Element[버튼 클릭]    xpath://*[text()='전액 사용하기']
    Run Keyword If    '${transportYn}[0]' == 'PASS'    Click Element[버튼 클릭]    xpath://*[@class='css-1mwn02k']/button[1]
    Run Keyword If    '${transportYn}[0]' == 'PASS'    Execute Javascript    window.scrollTo(0, 500)
    Run Keyword If    '${transportYn}[0]' == 'PASS'    Click Element[버튼 클릭]    xpath://*[text()='전액 사용하기']
    ${amount}    Get Text[텍스트 가져오기]    class:css-128od1m
    Should Be Equal    ${amount}    0원 결제하기
    Click Element[버튼 클릭]    class:css-128od1m
    sleep    5s
    Comment    ${windows}    Get Window Handles
    Comment    Switch Window    ${windows}[1]
    ${title}    Get Text[텍스트 가져오기]    class:title
    Should Be Equal    ${title}    예약 완료되었습니다.
    Comment    sleep    3s
    Comment    Close Window
    Comment    Switch Window    ${windows}[0]

검색 > 레저티켓 검색결과 > 상품상세 이동
    [Arguments]    ${keyword}
    Comment    sleep    3s
    Comment    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    Comment    Element Visible[요소 표시 여부 체크]    xpath:(//*[contains(text(), '${keyword}')])[1]
    Comment    sleep    1s
    Comment    Click Element[버튼 클릭]    xpath:(//*[contains(text(), '${keyword}')])[1]
    go to    https://qa-m.yanolja.com/leisure/10005544
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    class:LeisureDetailTitle_title__39CSC
    Should Be Equal    ${title}    ${keyword}

레저 상세 > 예약
    sleep    1s
    Click Element[버튼 클릭]    class: RectButton_primary__3O9TH
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='+']
    Click Element[버튼 클릭]    class: RectButton_primary__3O9TH
    ${title}    Get Text[텍스트 가져오기]    class:center
    Should Be Equal    ${title}    예약

숙소 장바구니 담기
    Click Element[버튼 클릭]    xpath://*[text()='장바구니 담기']
    Element Visible[요소 표시 여부 체크]    class:css-19nwgzc

숙소 장바구니 이동
    Click Element[버튼 클릭]    class:css-1ai9mni
    ${title}    Get Text[텍스트 가져오기]    xpath://*[text()='장바구니']
    Should Be Equal    ${title}    장바구니

장바구니 > 예약
    Click Element[버튼 클릭]    class:primary
    ${title}    Get Text[텍스트 가져오기]    xpath://*[text()='예약']
    Should Be Equal    ${title}    예약

MY야놀자 > 기획전 메뉴 클릭
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element[버튼 클릭]    xpath://*[text()='기획전']
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='ExhibitionListNav_normal__1ha2N'])[1]
    Should Be Equal    ${title}    기획전

기획전 > QA로그전용 메뉴 클릭
    Comment    IR.Image MoveTo    ${CURDIR}/Images/Home.png
    Comment    Scroll Wheel Click[휠로 스크롤하여 요소 클릭]    xpath://*[text()='QA 로그 전용']
    Click Element[버튼 클릭]    xpath:(//*[text()='해외 숙소'])[2]
    Click Element[버튼 클릭]    xpath://*[text()='QA 로그 전용']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath://*[@class='ExhibitionDetailNav_title__1NE43']
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
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    선택한 승차권
    Click Element[버튼 클릭]    xpath://*[text()='장바구니 담기']

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
    Comment    ${motel_reservationNo_list}    ${train_reservationNo_list}    ${reisure_reservationNo_list}    [API] 장바구니 주문 조회 API_건별예약번호    ${AUTHORIZATION}
    Comment    [API] 장바구니 관리자 예약 취소 API    ${AUTHORIZATION}    ${motel_reservationNo_list}    ${train_reservationNo_list}    ${reisure_reservationNo_list}
    ${order_list}    [API] 장바구니 주문 조회 API_orderlist    ${AUTHORIZATION}
    [API] 장바구니 주문 취소 API    ${AUTHORIZATION}    ${order_list}

DILog 조회 및 검증
    [Arguments]    ${class}    ${page_name}    ${event_type}    ${case_no}    ${date}    ${desc}=${EMPTY}    ${count}=1
    ${status}    ${response}    DILog.Get Log Page Name Event Type    ${page_name}    ${event_type}    ${date}    ${desc}    ${count}    ${CGNTID}
    Run Keyword If    ${status}    Set Test Message    설명 : ${response}[desc]\n페이지명 : ${response}[pageName]\n이벤트타입 : ${response}[eventType]\n버전 : ${response}[version] \n야놀자 앱 버전 : ${response}[app_ver]\nOS 이름 : ${response}[os_name]\n로그 기록 시간 : ${response}[time]
    Comment    구글 스프레드 시트 결과 업데이트_2차    ${status}    ${WORKSHEET}    ${case_no}
    Comment    Run Keyword If    '${TEST_PHASE}' == '1'    구글 스프레드 시트 결과 업데이트_플러스    ${status}    ${WORKSHEET}    ${case_no}    ${response}    ${class}    ${page_name}    ${event_type}
    Run Keyword If    '${TEST_PHASE}' == '1'    구글 스프레드 시트 결과 업데이트_1차    ${status}    ${WORKSHEET}    ${case_no}    ${response}
    Run Keyword Unless    '${TEST_PHASE}' == '1'    구글 스프레드 시트 결과 업데이트_2차    ${status}    ${WORKSHEET}    ${case_no}    ${response}
    Should Be True    ${status}

구글 스프레드 시트 결과 업데이트_2차
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
    Comment    @{update_value}    Run Keyword If    '${status}' == 'Pass'    Create List    ${case_no}    ${response}[priority]    ${class}    ${response}[pageName]    ${response}[desc] (v${response}[version])    ${response}[eventType]    ${status}    ${response}
    ...    ELSE    Create List    ${case_no}    ${EMPTY}    ${class}    ${page_name}    ${EMPTY}    ${event_type}    ${status}    ${EMPTY}
    @{update_value}    Run Keyword If    '${status}' == 'Pass'    Create List    ${status}    ${response}
    ...    ELSE    Create List    ${status}    ${response}
    Comment    Google.Batch Update    ${GoogleDrive_URL}    ${work_sheet}    B${cell}:P${cell}    @{update_value}
    Google.Batch Update    ${GoogleDrive_URL}    ${work_sheet}    K${cell}:P${cell}    @{update_value}

구글시트 테스트 수행 날짜 업데이트
    ${date}    DT.Get Current Date    result_format=%Y.%m.%d
    Google.Write Value On Cell    ${GoogleDrive_URL}    ${WORKSHEET}    Q7    ${date}

Click Element[버튼 클릭]
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    click element    ${element}

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
    ${get_element}    Run keyword and Ignore error    Wait Until Keyword Succeeds    15s    ${checkTime}    Get WebElement    ${element}
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
    FOR    ${index}    IN RANGE    10
        ${status}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Element Should Be Visible    ${element}
        Run Keyword If    '${status}[0]' == 'FAIL'    IR.Mouse Scroll
        ${status2}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Click Element    ${element}
        Run Keyword If    '${status2}[0]' == 'FAIL'    IR.Mouse Scroll
        Run Keyword If    '${status2}[0]' == 'PASS'    Click Element[버튼 클릭]    ${element}
        Run Keyword If    '${status2}[0]' == 'PASS'    Exit For Loop
    END

[API] 장바구니 주문 조회 API_orderlist
    [Arguments]    ${r_authorization}
    ${headers}    Create Dictionary    authorization=${r_authorization}
    ${date}    DT.Get Current Date    result_format=%Y%m%d
    ${params}    Create Dictionary    page=1    size=100    from=${date}    to=${date}    categoryGroup=ALL
    ${response}    Re.GET    http://order-coordinator.qa.yanolja.in/cart/v1/orders    headers=${headers}    params=${params}
    Log    ${response.json()}
    Get Length    ${response.json()}
    #
    @{order_list}    Create List
    FOR    ${index}    IN    @{response.json()}[orders]
    @{reservationNo_list}    Create List
    Append To List    ${reservationNo_list}    ${index}[id]
    FOR    ${category}    IN    @{index}[categoryOrders]
        Run Keyword And Ignore Error    Continue For Loop If    '${category}[statusGroupCode]' == 'CANCEL'
        Run Keyword And Ignore Error    Continue For Loop If    '${category}[tickets][0][status]' == 'CANCELED'
        Run Keyword And Ignore Error    Continue For Loop If    '${category}[items][0][status]' == 'CANCEL_REQUESTED'
        Run Keyword And Ignore Error    Continue For Loop If    '${category}[items][0][status]' == 'USER_CANCEL_COMPLETED'
        Run Keyword If    '${category}[category]' == 'DOMESTIC_RESERVATION'    Append To List    ${reservationNo_list}    MOTEL_${category}[id]
        Run Keyword If    '${category}[category]' == 'DOMESTIC_TRAIN'    Append To List    ${reservationNo_list}    TRAIN_${category}[id]
        Run Keyword If    '${category}[category]' == 'DOMESTIC_LEISURE'    Append To List    ${reservationNo_list}    LEISURE_${category}[id]
        Comment    Append To List    ${reservationNo_list}    ${category}[id]
    END
    Append To List    ${order_list}    ${reservationNo_list}
    END
    Comment    Log    ${motel_reservationNo_list}
    Comment    Log    ${train_reservationNo_list}
    Comment    Log    ${reisure_reservationNo_list}
    Run Keyword And Ignore Error    Log    ${reservationNo_list}
    Log    ${order_list}
    [Return]    ${order_list}

[API] 장바구니 주문 취소 API
    [Arguments]    ${r_authorization}    ${order_list}
    [Documentation]    https://confluence.yanolja.in/pages/viewpage.action?pageId=229235534
    Comment    ${headers}    Create Dictionary    authorization=${r_authorization}
    Run Keyword And Ignore Error    Log    ${order_list}
    Run Keyword And Ignore Error    Log    ${order_list}[0]
    FOR    ${order}    IN    @{order_list}
    ${reservation_list}    Create List
    FOR    ${reservation}    IN    @{order}[1:]
        ${reservation_dir}    [API_Sub] Get Reservation Info    ${reservation}
        Append To List    ${reservation_list}    ${reservation_dir}
    END
    Log    ${reservation_list}
    ${len}    Get Length    ${reservation_list}
    Continue For Loop If    '${len}'=='0'
    ${headers}    Create Dictionary    authorization=${r_authorization}
    ${params}    Create Dictionary    reasonCode=ETC    reasonDetail=QAAuto    categoryOrders=${reservation_list}
    ${response}    Re.POST    http://order-coordinator.qa.yanolja.in/cart/v1/orders/${order}[0]/cancel    headers=${headers}    json=${params}
    Log    ${response}
    END

[API_Sub] Get Reservation Info
    [Arguments]    ${reservation}
    @{word}    Split String    ${reservation}    _
    ${category}    Set Variable    ${word}[0]
    ${reservationNo}    Set Variable    ${word}[1]
    ${reservation_dir}    Run Keyword If    "${category}"=="MOTEL"    [API_Sub] Get MOTEL Info    ${reservationNo}
    Return From Keyword If    "${category}"=="MOTEL"    ${reservation_dir}
    ${reservation_dir}    Run Keyword If    "${category}"=="TRAIN"    [API_Sub] Get TRAIN Info    ${reservationNo}
    Return From Keyword If    "${category}"=="TRAIN"    ${reservation_dir}
    ${reservation_dir}    Run Keyword If    "${category}"=="LEISURE"    [API_Sub] Get LEISURE Info    ${reservationNo}
    Return From Keyword If    "${category}"=="LEISURE"    ${reservation_dir}
    [Return]    ${reservation_dir}

[API_Sub] Get LEISURE Info
    [Arguments]    ${reservationNo}
    # 레저 예약 취소 정보 Get
    ${headers}    Create Dictionary    authorization=${AUTHORIZATION}
    ${response1}    Re.GET    http://order-api.qa.yanolja.in/domestic-leisure/v2/orders/${reservationNo}    headers=${headers}
    ${item_list}    Create List
    FOR    ${item}    IN    @{response1.json()}[items]
        Append To List    ${item_list}    ${item}[id]
        Comment    ${item_list}    Set Variable If    '${item_list}' == '${EMPTY}'    ${item}[id]    ${item_list},${item}[id]
    END
    ###
    ${reservation_dir}    Create Dictionary    id=${reservationNo}    itemIds=${item_list}
    Comment    ${reservation_dir}    Create Dictionary    id=${word}[1]
    Log    ${reservation_dir}
    [Return]    ${reservation_dir}

[API_Sub] Get MOTEL Info
    [Arguments]    ${reservationNo}
    # 모텔 주문 취소 정보
    ${reservation_dir}    Create Dictionary    id=${reservationNo}
    Log    ${reservation_dir}
    [Return]    ${reservation_dir}

[API_Sub] Get TRAIN Info
    [Arguments]    ${reservationNo}
    # 기차 예약 취소
    ${headers}    Create Dictionary    authorization=${AUTHORIZATION}
    ${response1}    Re.GET    http://train-order-api.qa.yanolja.in/domestic-train/v2/orders/${reservationNo}    headers=${headers}
    ${item_list}    Create List
    FOR    ${ticket}    IN    @{response1.json()}[tickets]
        Append To List    ${item_list}    ${ticket}[id]
        Comment    ${item_list}    Set Variable If    '${item_list}' == '${EMPTY}'    ${ticket}[id]    ${item_list},${ticket}[id]
    END
    ###
    ${reservation_dir}    Create Dictionary    id=${reservationNo}    itemIds=${item_list}
    Log    ${reservation_dir}
    [Return]    ${reservation_dir}

Suite Teardown (stage)
    sleep    3s
    Close Browser

구글 스프레드 시트 결과 업데이트[StageBasic]
    [Arguments]    ${status}    ${case_no}    ${response}=${EMPTY}
    Return From Keyword If    "${TEST_PHASE}"=="TEST"
    ${status}    Set Variable If    "${status}" == "PASS"    Pass    Fail
    ${cell}    Evaluate    ${case_no} + 14
    # 결과 업데이트
    Google.Write Value On Cell    ${GoogleDrive_URL_StageBasic}    ${WORKSHEET_StageBasic}    K${cell}    ${status}
    Comment    # 응답 업데이트
    Comment    Google.Write Value On Cell    ${GoogleDrive_URL}    ${work_sheet}    O${cell}    ${response}

stage 테스트숙소 노출 설정
    Open Browser    ${StageMain}/_settings    Chrome    executable_path=${CURDIR}/chromedriver
    Click Element[버튼 클릭]    xpath://*[@for='testProduct-ONLY']/span[1]

MY야놀자 > 로그인 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='로그인 및 회원가입 하기']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:NavigationBarHeading_title__hHbul
    Should Be Equal    ${title}    로그인

로그인 > 이메일로 로그인 버튼 클릭
    Click Element[버튼 클릭]    xpath://*[text()='이메일로 로그인']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:NavigationBarHeading_title__hHbul
    Should Be Equal    ${title}    이메일로 로그인

로그인 하기 (stage)
    InputText Element[텍스트 입력하기]    id:username    ${stage_username}
    InputText Element[텍스트 입력하기]    id:password    ${stage_password}
    FOR    ${index}    IN RANGE    5
        ${attr}    Get Element Attribute[속성값 가져오기]    class: RectButton_primary__3O9TH    class
        ${loginBtn}    Run keyword and Ignore error    Should Contain    ${attr}    RectButton_disabled__14E3B
        Run Keyword If    '${loginBtn}[0]' == 'FAIL'    Exit For Loop
        Run Keyword If    '${loginBtn}[0]' == 'PASS'    Reload Page
        Run Keyword If    '${loginBtn}[0]' == 'PASS'    InputText Element[텍스트 입력하기]    id:username    ${stage_username}
        Run Keyword If    '${loginBtn}[0]' == 'PASS'    InputText Element[텍스트 입력하기]    id:password    ${stage_password}
    END
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='로그인']
    sleep    1s
    ${loginYn}    Get Text[텍스트 가져오기]    xpath://*[@class='MyNick_nickname__2Scd9']/div
    Should Be Equal    ${loginYn}    Qatest02

MY야놀자 > 내정보관리 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='내정보 관리']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    내 정보 관리

MY야놀자 > 포인트 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='포인트']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath://*[@class='css-z0igb2']/div[1]
    Should Be Equal    ${title}    포인트

MY야놀자 > MY혜택 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='MY 혜택']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    MY 혜택

MY야놀자 > 야놀자코인 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='야놀자 코인']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    야놀자 코인

MY야놀자 > 쿠폰함 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='쿠폰함']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:toolbar-title
    Should Be Equal    ${title}    쿠폰함

MY야놀자 > 나의후기 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='나의 후기']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:toolbar-title
    Should Contain    ${title}    나의 후기

MY야놀자 > 찜 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='찜']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:WishListCollapsingNav_title__1SM0I
    Should Be Equal    ${title}    찜

MY야놀자 > 공지사항 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='공지사항']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:css-melwew
    Should Be Equal    ${title}    공지사항

MY야놀자 > 자주묻는질문FAQ 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='자주 묻는 질문 FAQ']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:css-melwew
    Should Be Equal    ${title}    자주 묻는 질문

모텔 대실 예약가능 여부 체크
    @{elements}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get WebElements    xpath://*[@class='css-1ao9jo6']/div[1]
    ${Index2}    Set Variable    1
    FOR    ${index}    IN    @{elements}
        ${attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Element Attribute    ${index}    disabled
        log    ${attr}
        Run Keyword If    '${attr}' == 'true'    Continue For Loop
        Run Keyword If    '${attr}' == 'true'    ${Index2}    Set Variable    ${Index2} + 1
        Run Keyword If    '${attr}' != 'true'    Click Element[버튼 클릭]    (//*[text()='객실 선택하기'])[${Index2}]
        Run Keyword If    '${attr}' != 'true'    Exit For Loop
    END

모텔 숙박 예약가능 여부 체크
    @{elements}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get WebElements    xpath://*[@class='css-1ao9jo6']/div[2]
    ${Index2}    Set Variable    1
    FOR    ${index}    IN    @{elements}
        ${attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Element Attribute    ${index}    disabled
        log    ${attr}
        Run Keyword If    '${attr}' == 'true'    Continue For Loop
        Run Keyword If    '${attr}' == 'true'    ${Index2}    Set Variable    ${Index2} + 1
        Run Keyword If    '${attr}' != 'true'    Click Element[버튼 클릭]    (//*[text()='객실 선택하기'])[${Index2}]
        Run Keyword If    '${attr}' != 'true'    Exit For Loop
    END

펜션 예약가능 여부 체크
    ${attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Element Attribute    xpath://*[@class='css-1ux2lue' and contains (text(), '영성')]/parent::div/parent::a//*[text()='객실 선택하기']    disabled
    Run Keyword If    '${attr}' != 'true'    Click Element[버튼 클릭]    xpath://*[@class='css-1ux2lue' and contains (text(), '영성')]/parent::div/parent::a//*[text()='객실 선택하기']

홈 > 추천탭 클릭
    메인 이동
    sleep    5s
    Element Visible[요소 표시 여부 체크]    xpath:(//*[text()='추천'])[1]
    Click Element[버튼 클릭]    xpath:(//*[text()='추천'])[1]
    sleep    1s
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath://*[text()='추천']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab
    sleep    1s

홈 > 국내숙소탭 클릭
    메인 이동
    sleep    5s
    Element Visible[요소 표시 여부 체크]    xpath://*[text()='국내숙소']
    Click Element[버튼 클릭]    xpath://*[text()='국내숙소']
    sleep    1s
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath://*[text()='국내숙소']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab
    sleep    1s

홈 > 교통/항공탭 클릭
    메인 이동
    sleep    5s
    Element Visible[요소 표시 여부 체크]    xpath://*[text()='교통/항공']
    Click Element[버튼 클릭]    xpath://*[text()='교통/항공']
    sleep    1s
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath://*[text()='교통/항공']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab
    sleep    1s

홈 > 즐길거리탭 클릭
    메인 이동
    sleep    5s
    Element Visible[요소 표시 여부 체크]    xpath://*[text()='즐길거리']
    Click Element[버튼 클릭]    xpath://*[text()='즐길거리']
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath://*[text()='즐길거리']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab
    sleep    1s

홈 > 해외여행탭 클릭
    메인 이동
    sleep    5s
    Element Visible[요소 표시 여부 체크]    xpath://*[text()='해외여행']
    Click Element[버튼 클릭]    xpath://*[text()='해외여행']
    sleep    1s
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath://*[text()='해외여행']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab
    sleep    1s

홈 추천 위젯 > 상품 클릭
    ${listName}    Get Text[텍스트 가져오기]    xpath:(//*[@class='RecommendRankingItemProduct_title__3hVvJ'])[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2s
    Execute Javascript    window.scrollTo(0, 0)
    ${start}    Set Variable    0
    ${end}    Set Variable    800
    Comment    ${scrollHeight}    Execute Javascript    return document.body.scrollHeight
    FOR    ${index}    IN RANGE    10
        ${ImageChk}    IR.Find Target    ${CURDIR}/Images/weeklyProduct.png
        Run Keyword If    '${ImageChk}' == 'None'    Execute Javascript    window.scrollTo(${start}, ${end})
        ${start}    Set Variable    ${end}
        ${end}    Set Variable    ${end} + 800
        Run Keyword If    '${ImageChk}' != 'None'    IR.Image Click    ${CURDIR}/Images/weeklyProduct.png
        Run Keyword If    '${ImageChk}' != 'None'    Exit For Loop
        Comment    Run Keyword If    ${end_CV} > ${scrollHeight_CV}    Exit For Loop
        sleep    2s
    END
    ${detailName}    Get Text[텍스트 가져오기]    xpath://*[contains (@class, 'property-title')]
    Should Contain    ${listName}    ${detailName}

국내숙소 날짜 설정
    [Arguments]    ${days_later}
    ${today}    오늘날짜확인2
    Click Element[버튼 클릭]    xpath:(//*[contains (text(), '${today}')])[1]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:css-ftkmw0
    Should Be Equal    ${title}    날짜 선택
    Click Element[버튼 클릭]    xpath:(//*[not(contains (@data-testid, 'undefined')) and contains (@class, 'css-1ego3xc') and not(contains (@class, 'css-elyyt7'))])[${days_later}]
    Click Element[버튼 클릭]    class:css-ijxt52

RDP > 대실 예약
    sleep    1s
    Click Element[버튼 클릭]    xpath:(//*[@class='css-1wxsndh' and text()='대실']/parent::div//*[text()='객실 예약하기'])[1]
    sleep    3s
    ${title}    Get Text[텍스트 가져오기]    class:css-18k5no3
    Should Be Equal    ${title}    대실 예약
    RDP > 무료취소여부체크
    Click Element[버튼 클릭]    xpath:(//*[@class='css-ihwtry'])[1]
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath:(//*[contains (@class, 'time')])[1]    class
    ${selectedYn}    Should Contain    ${attr}    selected

예약(포인트 결제) > 예약완료 (stage)
    sleep    1s
    ${transportYn}    Run keyword and Ignore error    Element Visible[요소 표시 여부 체크]    class:css-i1l4h7
    Run Keyword If    '${transportYn}[0]' == 'FAIL'    Click Element[버튼 클릭]    xpath://*[text()='전액 사용하기']
    Run Keyword If    '${transportYn}[0]' == 'PASS'    Click Element[버튼 클릭]    xpath://*[@class='css-1mwn02k']/button[1]
    Run Keyword If    '${transportYn}[0]' == 'PASS'    Click Element[버튼 클릭]    xpath://*[text()='전액 사용하기']
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
    Comment    sleep    3s
    Comment    Close Window
    Comment    Switch Window    ${windows}[0]

MY야놀자 > 국내여행 통합예약 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='국내여행 통합예약']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:center
    Should Be Equal    ${title}    국내여행 예약내역

국내여행 예약내역 > 예약내역 상세
    Click Element[버튼 클릭]    xpath:(//*[text()='상세보기'])[1]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:center
    Should Be Equal    ${title}    예약내역 상세
    sleep    1s

국내 예약내역 상세 > 예약취소 요청
    Click Element[버튼 클릭]    xpath://*[text()='예약취소 요청']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:center
    Should Be Equal    ${title}    예약취소 요청
    sleep    1s

국내 예약취소 요청 > 취소 요청하기
    Click Element[버튼 클릭]    xpath://*[text()='전체 선택']
    Click Element[버튼 클릭]    class:css-1r214sj
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    class:css-18k5no3
    Should Be Equal    ${title}    취소 사유 선택
    Click Element[버튼 클릭]    xpath://*[contains (text(), '예약정보 변경')]
    Click Element[버튼 클릭]    xpath://*[text()='선택 완료']
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[contains (@class, 'primary')]
    sleep    2s
    Click Element[버튼 클릭]    xpath://*[text()='전체 동의하기']
    sleep    2s
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath://*[contains (@class, 'primary')]    class
    ${cancelBtn}    Run keyword and Ignore error    Should Contain    ${attr}    disabled
    Run Keyword If    '${cancelBtn}[0]' == 'FAIL'    Click Element[버튼 클릭]    xpath://*[contains (@class, 'primary')]
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    class:css-tmlfjl
    Should Be Equal    ${title}    예약 취소를 요청하시겠어요?
    Click Element[버튼 클릭]    xpath:(//*[contains (@class, 'css-17y1gu4')])[2]
    sleep    4s
    ${title}    Get Text[텍스트 가져오기]    class:title
    Should Be Equal    ${title}    취소 요청이 완료되었습니다.

취소요청 완료 > 예약내역 상세
    Click Element[버튼 클릭]    xpath://*[text()='예약상세 보기']
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    class:center
    Should Be Equal    ${title}    예약내역 상세
    sleep    1s

취소완료 체크
    ${title}    Get Text[텍스트 가져오기]    xpath://*[@class='cancel-completed css-1esg0fo']
    Should Be Equal    ${title}    취소 완료
    sleep    1s

RDP > 호/펜/게 예약
    sleep    1s
    Click Element[버튼 클릭]    xpath:(//*[text()='객실 예약하기'])[1]
    sleep    3s
    ${title}    Get Text[텍스트 가져오기]    class:css-18k5no3
    Should Be Equal    ${title}    숙박 예약
    RDP > 무료취소여부체크

검색 > 해외숙소탭 클릭
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='해외숙소']

검색 > 해외숙소 검색결과 > PDP 이동
    [Arguments]    ${keyword}
    sleep    1s
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    sleep    3s
    Click Element[버튼 클릭]    xpath:(//*[@class='AutocompleteEntry_container__3AGrX'])[1]
    sleep    1s
    해외숙소 검색결과 > 가격 낮은순 정렬
    sleep    3s
    Click Element[버튼 클릭]    xpath:(//*[@class='GlobalPlaceListSection_wrapItem__XzvR7'])[1]
    Element Visible[요소 표시 여부 체크]    class: GlobalPlaceDetailBody_container__emEX3

해외숙소 날짜 설정
    [Arguments]    ${days_later}
    sleep    1s
    Click Element[버튼 클릭]    class:CheckinOutBox_box__3m3VU
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
    Should Be Equal    ${title}    날짜 선택
    Click Element[버튼 클릭]    xpath:(//div[contains(@class, 'DatePicker_calendarDaySelector__2_Ftx') and not(contains(@class, 'DatePicker_outsideRangeStyle__O4dXX'))])[${days_later}]
    Click Element[버튼 클릭]    xpath://*[contains (text(), '체크인 검색')]

해외숙소 결제 무료취소 가능 체크
    sleep    5s
    FOR    ${index}    IN RANGE    2    5
        ${title}    Get Text[텍스트 가져오기]    xpath://*[@class='txt']/span
        ${freeChk}    Run keyword and Ignore error    Should Contain    ${title}    무료취소
        IF    '${freeChk}[0]' == 'FAIL'
        Go Back
        Click Element[버튼 클릭]    xpath://*[contains (text(), '나가기')]
        sleep    3s
        Go Back
        sleep    1s
        해외숙소 검색결과 > PDP    ${index}
        해외숙소 상세 > 예약가능날짜 체크
        ELSE
        Exit For Loop
    END
    END

해외숙소 예약(간편결제) > 예약완료
    sleep    1s
    InputText Element[텍스트 입력하기]    id:성(영문)    test
    InputText Element[텍스트 입력하기]    id:이름(영문)    test
    ${payPrice}    Get Text[텍스트 가져오기]    class:sale-price
    ${convert}    문자열에서 숫자만 추출    ${payPrice}
    ${inputPrice}    Evaluate    ${convert} - 100
    InputText Element[텍스트 입력하기]    xpath:(//*[contains (@placeholder, '- 0 P')])[1]    ${inputPrice}
    Click Element[버튼 클릭]    xpath://*[text()='다른 결제 수단 더보기']
    Click Element[버튼 클릭]    xpath://*[@class='pg-item-select-icon']/parent::div/*[contains (text(), '간편')]
    sleep    2s
    Click Element[버튼 클릭]    xpath://*[text()='전체 동의']
    sleep    1s
    ${amount}    Get Text[텍스트 가져오기]    class:payment-amount
    Should Be Equal    ${amount}    100원 결제하기
    Click Element[버튼 클릭]    class:payment-amount
    sleep    10s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Select Frame[프레임 선택]    name:yanoljapay_view
    ${title}    Get Text[텍스트 가져오기]    xpath://*[@id='header']/h1
    Should Contain    ${title}    계좌 등록/결제
    Click Element[버튼 클릭]    xpath://*[text()='하나은행']
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    xpath://*[@id='header']/h1
    Should Contain    ${title}    결제진행
    IR.Image Click    ${CURDIR}/Images/easy1.png
    IR.Image Click    ${CURDIR}/Images/easy6.png
    IR.Image Click    ${CURDIR}/Images/easy0.png
    IR.Image Click    ${CURDIR}/Images/easy7.png
    IR.Image Click    ${CURDIR}/Images/easy2.png
    IR.Image Click    ${CURDIR}/Images/easy3.png
    sleep    15s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[0]
    ${title}    Get Text[텍스트 가져오기]    class:status-text
    Should Contain    ${title}    예약이 완료되었습니다.

MY야놀자 > 해외여행 통합예약 메뉴 클릭
    Click Element[버튼 클릭]    xpath://*[text()='해외 예약 내역']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:toolbar-title
    Should Contain    ${title}    해외숙소 예약내역

해외여행 예약내역 > 예약내역 상세
    Click Element[버튼 클릭]    class:list-item--right-block
    sleep    3s
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[contains (@class, 'toolbar-title')])[2]
    Should Contain    ${title}    예약내역 상세

해외 예약내역 상세 > 예약취소 요청
    Click Element[버튼 클릭]    xpath://*[contains (text(), '예약취소 요청하기')]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:toolbar-title
    Should Be Equal    ${title}    예약취소 요청

해외 예약취소 요청 > 취소 요청하기
    sleep    2s
    Click Element[버튼 클릭]    class:checkbox-icon-container
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath://*[@class='order-cancel-action']/button    class
    ${cancelBtn}    Run keyword and Ignore error    Should Contain    ${attr}    disabled
    Run Keyword If    '${cancelBtn}[0]' == 'FAIL'    Click Element[버튼 클릭]    class:order-cancel-action-txt
    Run Keyword If    '${cancelBtn}[0]' == 'PASS'    Click Element[버튼 클릭]    class:checkbox-icon-container
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='modal-header'])[1]
    Should Be Equal    ${title}    예약을 취소하시겠어요?
    Click Element[버튼 클릭]    class:confirm-btn-txt
    sleep    10s
    ${title}    Get Text[텍스트 가져오기]    class:status-text
    Should Contain    ${title}    예약취소가 완료되었습니다.

해외숙소 취소요청 완료 > 예약내역 상세 & 취소완료 체크
    Click Element[버튼 클릭]    xpath://*[text()='예약내역 보기']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:toolbar-title
    Should Contain    ${title}    해외숙소 예약내역
    sleep    5s
    Element Visible[요소 표시 여부 체크]    class:empty-display

즐길거리 > 레저/티켓 메뉴 클릭
    Element Visible[요소 표시 여부 체크]    xpath://*[@href='https://www.yanolja.com/leisure']
    Click Element[버튼 클릭]    xpath://*[@href='https://www.yanolja.com/leisure']
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    레저/티켓

레저티켓 장바구니 담기
    [Arguments]    ${productName}
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    ${productName}
    Comment    검색 > 키워드 입력 후 돋보기 이동 (숙소)    ${productName}
    sleep    1s
    Click Element[버튼 클릭]    class: RectButton_primary__3O9TH
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='+']
    숙소 외 장바구니 담기

모텔 장바구니 담기
    홈 > 검색 버튼 클릭
    Comment    검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    검색 > 키워드 입력 후 돋보기 이동 (숙소)    신규테스트 AUTO
    체크인날짜확인
    PDP > RDP (모텔 숙박)
    RDP > 모텔 숙박 예약
    숙소 장바구니 담기
    sleep    2s

KTX > 왕복탭 클릭
    Click Element[버튼 클릭]    xpath://*[text()='왕복']
    sleep    1s
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath://*[text()='왕복']    class
    Should Contain    ${attr}    TrainSHomeJourneyType_active__3_zJY

KTX > 승차권 조건 선택 후 조회 버튼 클릭 (왕복)
    [Arguments]    ${arrival}
    Click Element[버튼 클릭]    class:TrainSHomeStationDisplay_placeholder__3yNbY
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
    Should Be Equal    ${title}    도착역 선택
    InputText Element[텍스트 입력하기]    class:TrainSHomeStationModalTitle_input__573Rb    ${arrival}
    Click Element[버튼 클릭]    xpath://*[text()='${arrival}']
    Click Element[버튼 클릭]    class:TrainSHomeBody_datePlaceholder__hCwn1
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
    Should Be Equal    ${title}    날짜 선택
    Click Element[버튼 클릭]    xpath:(//div[contains(@class, 'TrainSHomeCalendarModal_calendarDaySelector__uXOSA') and not(contains(@class, 'TrainSHomeCalendarModal_outsideRangeStyle___ZYRF'))])[3]
    sleep    1s
    Click Element[버튼 클릭]    xpath:(//div[contains(@class, 'TrainSHomeCalendarModal_calendarDaySelector__uXOSA') and not(contains(@class, 'TrainSHomeCalendarModal_outsideRangeStyle___ZYRF'))])[3]
    Click Element[버튼 클릭]    xpath://*[contains (text(), '∙ 적용')]
    Click Element[버튼 클릭]    class:RectButton_label__WcAp7

바로 예매 > 오는날 승차권 조회
    Click Element[버튼 클릭]    xpath://*[text()='바로 예매']
    Click Element[버튼 클릭]    xpath://*[text()='확인']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:TrainTicketsNav_title__3AkFv
    Should Be Equal    ${title}    오는날 승차권 조회

교통/항공 > 고속버스 메뉴 클릭
    Element Visible[요소 표시 여부 체크]    xpath://*[@alt='고속버스']
    Click Element[버튼 클릭]    xpath://*[@alt='고속버스']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class: ExhibitionDetailNav_title__1NE43
    Should Be Equal    ${title}    다운로드
    sleep    1s

항공권 > 편도 클릭
    sleep    3s
    Click Element[버튼 클릭]    xpath://*[text()='편도']
    sleep    1s
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath://*[text()='편도']    class
    Should Contain    ${attr}    FlightSearchFormBody_tripTypeSelected__3lVjF

항공권 편도 검색
    [Arguments]    ${arrival}
    Click Element[버튼 클릭]    xpath:(//*[contains (@class, 'FlightSearchFormBody_airportCode__2a2VV')])[2]
    InputText Element[텍스트 입력하기]    class:FlightSearchAirportModal_searchInput__3oy24    ${arrival}
    Click Element[버튼 클릭]    class:FlightSearchAirportBody_searchResultRow__3e7KX
    Click Element[버튼 클릭]    xpath://*[contains(text(), '가는날')]
    Click Element[버튼 클릭]    xpath:(//div[contains(@class, 'DatePicker_calendarDaySelector__2_Ftx') and not(contains(@class, 'DatePicker_outsideRangeStyle__O4dXX'))])[30]
    Click Element[버튼 클릭]    xpath://*[contains(text(), '적용')]
    Click Element[버튼 클릭]    xpath://*[text()='항공권 검색']
    sleep    10s
    Element Visible[요소 표시 여부 체크]    class:FlightListBody_tripContainer__QFL8w

항공권 왕복 검색
    [Arguments]    ${arrival}
    Click Element[버튼 클릭]    xpath:(//*[contains (@class, 'FlightSearchFormBody_airportCode__2a2VV')])[2]
    InputText Element[텍스트 입력하기]    class:FlightSearchAirportModal_searchInput__3oy24    ${arrival}
    Click Element[버튼 클릭]    class:FlightSearchAirportBody_searchResultRow__3e7KX
    Click Element[버튼 클릭]    xpath://*[contains(text(), '가는날')]
    Click Element[버튼 클릭]    xpath:(//div[contains(@class, 'DatePicker_calendarDaySelector__2_Ftx') and not(contains(@class, 'DatePicker_outsideRangeStyle__O4dXX'))])[30]
    sleep    2s
    Click Element[버튼 클릭]    xpath:(//div[contains(@class, 'DatePicker_calendarDaySelector__2_Ftx') and not(contains(@class, 'DatePicker_outsideRangeStyle__O4dXX'))])[32]
    Click Element[버튼 클릭]    xpath://*[contains(text(), '적용')]
    Click Element[버튼 클릭]    xpath://*[text()='항공권 검색']
    sleep    10s
    Element Visible[요소 표시 여부 체크]    class:FlightListBody_tripContainer__QFL8w

예약내역 취소
    홈 > MY야놀자 메뉴 클릭
    MY야놀자 > 국내여행 통합예약 메뉴 클릭
    국내여행 예약내역 > 예약내역 상세
    국내 예약내역 상세 > 예약취소 요청
    국내 예약취소 요청 > 취소 요청하기
    sleep    5s
    취소요청 완료 > 예약내역 상세
    취소완료 체크
    sleep    2s

문자열에서 숫자만 추출
    [Arguments]    ${string}
    ${replace}    Replace String Using Regexp    ${string}    [^\\d]    ${EMPTY}
    log    ${replace}
    [Return]    ${replace}

오늘날짜확인
    ${date}    현재 시간 구하기
    ${mmdd}    Get Substring    ${date}    5    10
    ${checkIn}    Replace String    ${mmdd}    -    ${EMPTY}
    Comment    ${month}    ${day}    Split String    ${mmdd}    -
    Comment    ${month2}    Get Substring    ${month}    0    1
    Comment    ${day2}    Get Substring    ${day}    0    1
    Comment    IF    '${month2}' == '0'
    Comment    ${month}    Get Substring    ${month}    1    2
    Comment    END
    Comment    IF    '${day2}' == '0'
    Comment    ${day}    Get Substring    ${day}    1    2
    Comment    END
    Comment    ${checkIn}    Catenate    SEPARATOR=    ${month}    ${day}
    [Return]    ${checkIn}

체크인날짜확인
    ${today}    오늘날짜확인
    ${getText}    Get Text[텍스트 가져오기]    xpath://*[@class='css-1cq8r2w']/span
    ${convert}    문자열에서 숫자만 추출    ${getText}
    Run Keyword If    '${today}' == '${convert}'    국내숙소 날짜 설정    8
    Run Keyword If    '${getText}' == '지금부터'    국내숙소 날짜 설정    8

해외숙소 검색결과 > 가격 낮은순 정렬
    Click Element[버튼 클릭]    xpath:(//*[@class='GlobalPlaceListSortSection_sort__2ZeKM'])[2]
    Element Visible[요소 표시 여부 체크]    class:BottomSheet_heading__SLpdy
    Click Element[버튼 클릭]    xpath://*[text()='가격 낮은 순']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='GlobalPlaceListSortSection_sort__2ZeKM'])[2]
    Should Be Equal    ${title}    가격 낮은 순
    sleep    2s

내정보관리 > 비밀번호입력 후 상세 이동
    InputText Element[텍스트 입력하기]    id:password    ${stage_password}
    Click Element[버튼 클릭]    class:RectButton_primary__3O9TH
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:Nickname_memberID__3MMXU
    Should Be Equal    ${title}    ${stage_username}

여행지 선택 > 오사카
    Click Element[버튼 클릭]    xpath://*[text()='오사카/교토']
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath:(//*[contains (@class, 'GlobalPlaceAreaListBody_countryEntry')])[1]    class
    Should Contain    ${attr}    Expanded__1nWy4
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='오사카']
    sleep    3s
    ${title}    Get Text[텍스트 가져오기]    class:KeywordInputInNav_searchPseudoInput__2KG7_
    Should Contain    ${title}    오사카

해외숙소 검색결과 > PDP
    [Arguments]    ${index}
    Click Element[버튼 클릭]    xpath:(//*[@class='GlobalPlaceListSection_wrapItem__XzvR7'])[${index}]
    sleep    1s
    Element Visible[요소 표시 여부 체크]    class:GlobalPlaceDetailBody_container__emEX3
    sleep    1s

홈 > 장바구니 유무 체크
    메인 이동
    ${cartCnt}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Element Should Be Visible    class:HomeSearchBar_cartCount__LJD06
    Run Keyword If    '${cartCnt}[0]' == 'FAIL'    No Operation
    Run Keyword If    '${cartCnt}[0]' == 'PASS'    장바구니 비우기

장바구니 비우기
    Go To    https://platform-site.yanolja.com/cart
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:center
    Should Be Equal    ${title}    장바구니
    Click Element[버튼 클릭]    xpath://*[text()='선택 삭제']
    Element Visible[요소 표시 여부 체크]    class:css-e84qjx
    Click Element[버튼 클릭]    xpath://*[@class='primary css-17y1gu4']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:no-item-text
    Should Contain    ${title}    장바구니에 담긴 상품이 없습니다

해외숙소 > 여행지 선택 (stage)
    go to    ${StageMain}/global/place/area-list?search=y
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    여행지 선택
    sleep    3s

국내숙소 > 모텔 (stage)
    go to    ${StageMain}/motel
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    모텔

국내숙소 > 호텔 (stage)
    go to    ${StageMain}/hotel
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    호텔/리조트

국내숙소 > 펜션 (stage)
    go to    ${StageMain}/pension
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    펜션/풀빌라

국내숙소 > 게하 (stage)
    go to    ${StageMain}/guest-house
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    게하/한옥

즐길거리 > 레저/티켓 (stage)
    go to    ${StageMain}/leisure
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    레저/티켓

교통/항공 > KTX (stage)
    go to    ${StageMain}/train
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    기차
    sleep    1s

교통/항공 > 고속버스 (stage)
    go to    ${StageMain}/exhibition/6055
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[@class='ExhibitionDetailNav_title__1NE43'])[1]
    Should Be Equal    ${title}    다운로드
    sleep    1s

교통/항공 > 항공권 (stage)
    go to    ${StageMain}/flights
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:flights_title__35srd
    Should Be Equal    ${title}    항공권
    sleep    1s

RDP > 무료취소여부체크
    ${cancelTxt}    Get Text[텍스트 가져오기]    class:css-1fqi9i1
    ${cancelYn}    Run keyword and Ignore error    Should Contain    ${cancelTxt}    무료취소
    Run Keyword If    '${cancelYn}[0]' == 'FAIL'    Click Element[버튼 클릭]    class:css-gtuddj
    Run Keyword If    '${cancelYn}[0]' == 'FAIL'    국내숙소 날짜 설정    10

Suite Setup (live)
    구글 시트 파일 복사
    구글시트 테스트 수행 날짜 업데이트 (live)
    sleep    3s
    live 테스트숙소 노출 설정
    Maximize Browser Window
    Comment    구글시트 테스트 수행 날짜 업데이트 (live)
    Comment    IR.Keybord Ctrl
    Comment    IR.Image Click    ${CURDIR}/Images/network.png

live 테스트숙소 노출 설정
    Open Browser    ${LiveMain}/_settings    Chrome    executable_path=${CURDIR}/chromedriver
    Click Element[버튼 클릭]    xpath://*[@for='testProduct-ONLY']/span[1]
    Comment    Click Element[버튼 클릭]    xpath://*[@for='testProduct-YES']/span[1]

구글시트 테스트 수행 날짜 업데이트 (live)
    ${date}    DT.Get Current Date    result_format=%Y.%m.%d
    Run Keyword If    "${TEST_PHASE}"!="TEST"    Google.Write Value On Cell    ${GoogleDrive_URL_StageBasic}    ${WORKSHEET_StageBasic}    ${GoogleColumn}13    ${date}

구글 스프레드 시트 결과 업데이트[LiveBasic]
    [Arguments]    ${status}    ${case_no}    ${response}=${EMPTY}
    Return From Keyword If    "${TEST_PHASE}"=="TEST"
    ${status}    Set Variable If    "${status}" == "PASS"    Pass    Fail
    ${cell}    Evaluate    ${case_no} + 14
    # 결과 업데이트
    Google.Write Value On Cell    ${GoogleDrive_URL_StageBasic}    ${WORKSHEET_StageBasic}    ${GoogleColumn}${cell}    ${status}
    Comment    # 응답 업데이트
    Comment    Google.Write Value On Cell    ${GoogleDrive_URL}    ${work_sheet}    O${cell}    ${response}

국내숙소 > 선착순쿠폰 (stage)
    go to    ${StageMain}/recommend
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PlaceListTitle_normal__318s-
    Should Be Equal    ${title}    테헤란로108길

국내숙소 > 무한쿠폰룸 (stage)
    go to    ${StageMain}/motel?myRoom=1
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    무한쿠폰룸

국내숙소 > 월혜택모음 (stage)
    Click Element[버튼 클릭]    xpath://*[contains (text(), '혜택모음')]
    sleep    3s
    ${getUrl}    Get Location
    ${reUrl}    Replace String    ${getUrl}    www    stage-m
    go to    ${reUrl}
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    야놀자 혜택 모아보기

즐길거리 > 맛집 (stage)
    go to    ${StageMain}/restaurant/app-install
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:NavigationBarHeading_title__hHbul
    Should Be Equal    ${title}    다운로드

즐길거리 > 모바일교환권 (stage)
    Click Element[버튼 클릭]    xpath://*[text()='모바일교환권']
    sleep    3s
    ${getUrl}    Get Location
    ${reUrl}    Replace String    ${getUrl}    www    stage-m
    go to    ${reUrl}
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:ExhibitionDetailNav_title__1NE43
    Should Be Equal    ${title}    모바일교환권

교통/항공 > 렌터카 (stage)
    Click Element[버튼 클릭]    xpath:(//*[text()='렌터카'])[1]
    sleep    3s
    ${getUrl}    Get Location
    ${reUrl}    Replace String    ${getUrl}    www    stage-m
    go to    ${reUrl}
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:ExhibitionDetailNav_title__1NE43
    Should Be Equal    ${title}    전국 렌터카

해외여행 > 여행자보험
    Click Element[버튼 클릭]    xpath://*[text()='여행자보험']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:nav-tit
    Should Be Equal    ${title}    해외여행보험

국내숙소 > 선착순쿠폰
    Click Element[버튼 클릭]    xpath://*[text()='선착순쿠폰']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PlaceListTitle_normal__318s-
    Should Be Equal    ${title}    테헤란로108길

국내숙소 > 무한쿠폰룸
    Click Element[버튼 클릭]    xpath://*[text()='무한쿠폰룸']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    무한쿠폰룸

국내숙소 > 월혜택모음
    Comment    Click Element[버튼 클릭]    xpath://div[@class='QuickCategory_recommendBWrap__2mNKz']//*[contains (text(), '혜택')]
    Click Element[버튼 클릭]    xpath://p[contains (text(), '의혜택')]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    야놀자 혜택 모아보기

즐길거리 > 맛집
    Click Element[버튼 클릭]    xpath://*[text()='맛집']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:NavigationBarHeading_title__hHbul
    Should Be Equal    ${title}    다운로드

즐길거리 > 모바일교환권
    Click Element[버튼 클릭]    xpath://*[text()='모바일교환권']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:ExhibitionDetailNav_title__1NE43
    Should Be Equal    ${title}    모바일교환권

교통/항공 > 렌터카
    Click Element[버튼 클릭]    xpath:(//*[text()='렌터카'])[1]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:ExhibitionDetailNav_title__1NE43
    Should Be Equal    ${title}    렌터카

렌터카 서브홈 > PDP
    ${listTitle}    Get Text[텍스트 가져오기]    xpath:(//*[@class='LeisureListItem_title__U-d8s'])[1]
    sleep    2s
    Click Element[버튼 클릭]    xpath:(//*[@class='ExhibitionDetailDomesticLeisure_container__15r_2'])[1]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:LeisureDetailTitle_title__39CSC
    Should Contain    ${title}    ${listTitle}

검색 > 국내숙소 검색결과 > PDP 이동
    [Arguments]    ${keyword}
    sleep    3s
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    Element Visible[요소 표시 여부 체크]    xpath:(//*[(text()='${keyword}')])[1]
    sleep    1s
    Click Element[버튼 클릭]    xpath:(//*[(text()='${keyword}')])[1]
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    xpath://*[contains (@class, 'property-title')]
    Should Be Equal    ${title}    ${keyword}
    [Teardown]    PDP 튜토리얼 체크

검색 > 해외숙소 검색결과 (테스트용)
    [Arguments]    ${keyword}
    sleep    3s
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    Element Visible[요소 표시 여부 체크]    xpath:(//*[contains(text(), '${keyword}')])[1]
    sleep    1s
    Click Element[버튼 클릭]    xpath:(//*[contains(text(), '${keyword}')])[1]
    Comment    sleep    2s
    Comment    Click Element[버튼 클릭]    xpath:(//*[@class='GlobalPlaceListItem_title__3vXxU'])[1]
    Comment    sleep    2s
    Comment    ${title}    Get Text[텍스트 가져오기]    class:GlobalPlaceDetailHeaderInfo_placeName__3QQMz
    Comment    Should Be Equal    ${title}    ${keyword}

TEST_Setup
    IR.Keybord Ctrl
    sleep    3s
    IR.Image Click    ${CURDIR}/Images/network.png

TEST_Status_Check
    Run Keyword If    '${TEST STATUS}' == 'FAIL'    Fatal Error

해외숙소 PDP 무료취소 가능 체크
    FOR    ${index}    IN RANGE    99999
        ${elChk}    Run keyword and Ignore error    Element Visible[요소 표시 여부 체크]    xpath://*[contains (@class, 'DotLoader_container__359O8')]
        Run Keyword If    '${elChk}[0]' == 'FAIL'    Exit For Loop
        sleep    3s
    END
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[contains (@class, 'GlobalPlaceCommonOptionItemInfoRefundBadge_nonRefundableBadge__JfaB8')])[1]
    ${freeChk}    Should Contain    ${title}    무료취소

해외숙소 PDP 무료취소 가능 체크 > 예약하기 진입
    FOR    ${index1}    IN RANGE    2    5
    FOR    ${index2}    IN RANGE    99999
        ${elChk}    Run keyword and Ignore error    Wait Until Keyword Succeeds    12s    ${checkTime}    Element Should Be Visible    xpath://*[contains (@class, 'DotLoader_container__359O8')]
        Run Keyword If    '${elChk}[0]' == 'FAIL'    Exit For Loop
        sleep    3s
    END
    ${title}    Get Text[텍스트 가져오기]    xpath:(//*[contains (@class, 'GlobalPlaceCommonOptionItemInfoRefundBadge_nonRefundableBadge__JfaB8')])[1]
    ${freeChk}    Run keyword and Ignore error    Should Contain    ${title}    무료취소
    IF    '${freeChk}[0]' == 'FAIL'
    Click Element[버튼 클릭]    xpath://*[@alt='뒤로가기']
    sleep    1s
    해외숙소 검색결과 > PDP    ${index1}
    해외숙소 날짜 설정    7
    해외숙소 상세 > 예약가능날짜 체크
    ELSE
    Click Element[버튼 클릭]    class:RectButton_label__WcAp7
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='예약하기']
    ${title}    Get Text[텍스트 가져오기]    class:toolbar-title
    Should Be Equal    ${title}    해외숙소 예약
    Exit For Loop
    END
    END

해외숙소 상세 > 해외숙소 예약하기 진입 (QA)
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
        Click Element[버튼 클릭]    class:RectButton_label__WcAp7
        sleep    1s
        Click Element[버튼 클릭]    xpath://*[text()='예약하기']
        ${title}    Get Text[텍스트 가져오기]    class:toolbar-title
        Should Be Equal    ${title}    해외숙소 예약
        Exit For Loop
    END
    END

구글 시트 파일 복사
    Comment    ${date}    DT.Get Current Date    result_format=%m
    Comment    ${date}    DT.Get Current Date    result_format=%d
    Run Keyword If    "${TEST_PHASE}"!="1"    1회차가 아닐 때
    Return From Keyword If    "${TEST_PHASE}"!="1"
    Comment    ${date}    DT.Get Current Date
    Comment    ${date}    Convert Date    ${date}    datetime
    Comment    Log    ${date.weekday()}    # 월요일 0
    Comment    Run Keyword If    "${date.weekday()}" == "0"    월요일 파일 생성
    Comment    Run Keyword Unless    "${date.weekday()}" == "0"    월요일 외 시트 생성
    버전별 시트 복사

월요일 파일 생성
    ${date}    DT.Get Current Date
    ${date}    Convert Date    ${date}    datetime
    ${week_no}    Google.Get Week No    ${date.year}    ${date.month}    ${date.day}
    # 파일 복사
    ${url}    Google.Copy File    ${date.year}-${date.month}월${week_no}주차    ${GoogleDriveLive_FileID}    ${GoogleDriveLive_FolderID}
    # 새파일 URL 전역변수 저장
    Set Global Variable    ${GoogleDrive_URL_StageBasic}    ${url}
    # 새파일 URL 파일 저장
    OS.Create File    ${GoogleURL}    ${url}
    # 시트 생성    # 시트 이름 전역변수 저장
    Comment    Google.Copy Sheet TEMP    ${date.month}월${date.day}일    ${url}
    Google.Update Sheet TEMP    ${date.month}월${week_no}주차    ${url}
    Set Global Variable    ${WORKSHEET_StageBasic}    ${date.month}월${week_no}주차
    Set Global Variable    ${GoogleColumn}    K

월요일 외 시트 생성
    # 파일에서 URL 불러오기    # URL 전역변수 저장
    ${url}    OS.Get File    ${GoogleURL}
    Set Global Variable    ${GoogleDrive_URL_StageBasic}    ${url}
    Comment    # 시트 생성    # 시트 이름 전역변수 저장    # 시트 생성안함
    ${date}    DT.Get Current Date
    ${date}    Convert Date    ${date}    datetime
    Comment    Google.Copy Sheet TEMP    ${date.month}월${date.day}일    ${GoogleDrive_URL_StageBasic}    # 시트 생성안함
    # M월N주차 구해서 넣기
    Comment    ${week_no}    Google.Get Week No    ${date.year}    ${date.month}    ${date.day}
    Comment    Set Global Variable    ${WORKSHEET_StageBasic}    ${date.month}월${week_no}주차
    # 마지막 주 및 다음달 첫주가 다른 케이스 방지
    ${week_no}    Google.Get Sheet Temp    ${GoogleDrive_URL_StageBasic}
    Set Global Variable    ${WORKSHEET_StageBasic}    ${week_no}
    Run keyword If    "${date.weekday()}" == "1"    Set Global Variable    ${GoogleColumn}    L    # 화
    Run keyword If    "${date.weekday()}" == "2"    Set Global Variable    ${GoogleColumn}    M    # 수
    Run keyword If    "${date.weekday()}" == "3"    Set Global Variable    ${GoogleColumn}    N    # 목
    Run keyword If    "${date.weekday()}" == "4"    Set Global Variable    ${GoogleColumn}    O    # 금

1회차가 아닐 때
    # 파일에서 URL 불러오기    # URL 전역변수 저장
    ${url}    OS.Get File    ${GoogleURL}
    Set Global Variable    ${GoogleDrive_URL_StageBasic}    ${url}
    # 시트명 계산
    ${date}    DT.Get Current Date
    ${date}    Convert Date    ${date}    datetime
    Comment    Google.Copy Sheet TEMP    ${date.month}월${date.day}일    ${GoogleDrive_URL_StageBasic}    # 복사 안함
    Comment    Set Global Variable    ${WORKSHEET_StageBasic}    ${date.month}월${date.day}일
    # M월N주차 구해서 넣기
    Comment    ${week_no}    Google.Get Week No    ${date.year}    ${date.month}    ${date.day}
    Comment    Set Global Variable    ${WORKSHEET_StageBasic}    ${date.month}월${week_no}주차
    # 마지막 주 및 다음달 첫주가 다른 케이스 방지
    ${week_no}    Google.Get Sheet Temp    ${GoogleDrive_URL_StageBasic}
    Set Global Variable    ${WORKSHEET_StageBasic}    ${week_no}
    Comment    Run keyword If    "${date.weekday()}" == "0"    Set Global Variable    ${GoogleColumn}    K    # 월
    Comment    Run keyword If    "${date.weekday()}" == "1"    Set Global Variable    ${GoogleColumn}    L    # 화
    Comment    Run keyword If    "${date.weekday()}" == "2"    Set Global Variable    ${GoogleColumn}    M    # 수
    Comment    Run keyword If    "${date.weekday()}" == "3"    Set Global Variable    ${GoogleColumn}    N    # 목
    Comment    Run keyword If    "${date.weekday()}" == "4"    Set Global Variable    ${GoogleColumn}    O    # 금
    Set Global Variable    ${GoogleColumn}    K

결과 값 가져오기_LIVE
    [Arguments]    ${case_no}
    ${status}    Set Variable    ${EMPTY}
    sleep    1s
    ${cell}    Evaluate    ${case_no} + 14
    ${status}    Google.Get Value On Cell    ${GoogleDrive_URL_StageBasic}    ${WORKSHEET_StageBasic}    ${GoogleColumn}${cell}
    [Return]    ${status}

1회차 Fail건 재확인_LIVE
    [Arguments]    ${case_no}
    ${status}    Run Keyword If    "${TEST_PHASE}"=="2"    결과 값 가져오기_LIVE    ${case_no}
    Pass Execution If    "${status}" == "Pass"    2회차 수행으로 PASS 처리

로그인 여부 체크_LIVE
    go to    https://www.yanolja.com/mypage
    sleep    1s
    ${loginYn}    Run keyword and Ignore error    Element Visible[요소 표시 여부 체크]    class:MyNick_nickname__2Scd9
    Run Keyword If    '${loginYn}[0]' == 'PASS'    No Operation
    Run Keyword If    '${loginYn}[0]' == 'FAIL'    go to    https://www.yanolja.com/emaillogin?redirect=/mypage
    Run Keyword If    '${loginYn}[0]' == 'FAIL'    로그인 하기 (stage)

로그인 여부 & 장바구니 유무 체크
    로그인 여부 체크_LIVE
    홈 > 장바구니 유무 체크

PDP 튜토리얼 체크
    FOR    ${index}    IN RANGE    3
        PDP 튜토리얼 다음 클릭
    END

PDP 튜토리얼 다음 클릭
    ${tutorialYn}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Element Should Be Visible    id:BOTTOM_SHEET
    Run Keyword If    '${tutorialYn}[0]' == 'PASS'    Click Element[버튼 클릭]    xpath://*[contains (@class, 'right')]
    Run Keyword If    '${tutorialYn}[0]' == 'FAIL'    No Operation

숙소 외 장바구니 담기
    Click Element[버튼 클릭]    xpath://*[text()='장바구니 담기']
    Element Visible[요소 표시 여부 체크]    class:PageTitleRightButton_cartCount__1WJxk

숙소 외 장바구니 이동
    Click Element[버튼 클릭]    xpath://*[@alt='장바구니']
    ${title}    Get Text[텍스트 가져오기]    xpath://*[text()='장바구니']
    Should Be Equal    ${title}    장바구니

기획전 > 숙소 상세
    Click Element[버튼 클릭]    xpath://*[text()='국내그룹_수정X']
    ${listName}    Get Text[텍스트 가져오기]    class:PlaceListTitle_container__qe7XH
    sleep    3s
    Click Element[버튼 클릭]    class:place-content
    ${title}    Get Text[텍스트 가져오기]    xpath://*[contains (@class, 'property-title')]
    Should Contain    ${title}    ${listName}

기획전 > 레저 상세
    Click Element[버튼 클릭]    xpath://*[text()='레저그룹_수정X']
    ${listName}    Get Text[텍스트 가져오기]    xpath:(//*[@class='LeisureListItem_title__U-d8s'])[1]
    sleep    3s
    Click Element[버튼 클릭]    class:LeisureListItem_body__1iNjJ
    ${title}    Get Text[텍스트 가져오기]    class:LeisureDetailTitle_title__39CSC
    Should Contain    ${title}    ${listName}

RDP > 모텔 숙박 예약 (QA)
    sleep    1s
    Click Element[버튼 클릭]    xpath:(//*[@class='css-1wxsndh' and text()='숙박']/parent::div//*[text()='객실 예약하기'])[1]
    sleep    3s
    ${title}    Get Text[텍스트 가져오기]    class:css-18k5no3
    Should Be Equal    ${title}    숙박 예약

MY야놀자 > 알림함 클릭
    Click Element[버튼 클릭]    class:Icon_icon__2BP_o
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    알림

QA 테스트숙소 노출 설정
    Open Browser    ${QAMain}/_settings    Chrome    executable_path=${CURDIR}/chromedriver
    Click Element[버튼 클릭]    xpath://*[@for='testProduct-YES']/span[1]
    sleep    5s

예약(간편결제) > 예약완료 (장바구니)
    ${transportYn}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Element Should Be Visible    class:css-i1l4h7
    Run Keyword If    '${transportYn}[0]' == 'FAIL'    No Operation
    Run Keyword If    '${transportYn}[0]' == 'PASS'    Click Element[버튼 클릭]    xpath://*[@class='css-1mwn02k']/button[1]
    ${payPrice}    Get Text[텍스트 가져오기]    xpath://*[@class='css-j3dtkl']/span
    ${convert}    문자열에서 숫자만 추출    ${payPrice}
    ${inputPrice}    Evaluate    ${convert} - 100
    InputText Element[텍스트 입력하기]    xpath://*[@placeholder='- 0']    ${inputPrice}
    Click Element[버튼 클릭]    xpath://*[text()='다른 결제 수단 더보기']
    Click Element[버튼 클릭]    xpath://div[contains (text(), '간편')]
    ${amount}    Get Text[텍스트 가져오기]    class:css-128od1m
    Should Be Equal    ${amount}    100원 결제하기
    Click Element[버튼 클릭]    //*[contains (text(), '필수 약관 전체 동의')]
    Click Element[버튼 클릭]    class:css-128od1m
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Select Frame[프레임 선택]    name:yanoljapay_view
    ${title}    Get Text[텍스트 가져오기]    xpath://*[@id='header']/h1
    Should Contain    ${title}    계좌 등록/결제
    Click Element[버튼 클릭]    xpath://*[text()='하나은행']
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    xpath://*[@id='header']/h1
    Should Contain    ${title}    결제진행
    IR.Image Click    ${CURDIR}/Images/easy1.png
    IR.Image Click    ${CURDIR}/Images/easy6.png
    IR.Image Click    ${CURDIR}/Images/easy0.png
    IR.Image Click    ${CURDIR}/Images/easy7.png
    IR.Image Click    ${CURDIR}/Images/easy2.png
    IR.Image Click    ${CURDIR}/Images/easy3.png
    sleep    20s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[0]
    ${title}    Get Text[텍스트 가져오기]    class:title
    Should Be Equal    ${title}    예약 완료되었습니다.

예약(간편결제) > 예약완료 (일반)
    ${transportYn}    Run keyword and Ignore error    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:css-i1l4h7
    Run Keyword If    '${transportYn}[0]' == 'FAIL'    No Operation
    Run Keyword If    '${transportYn}[0]' == 'PASS'    Click Element[버튼 클릭]    xpath://*[@class='css-1mwn02k']/button[1]
    ${payPrice}    Get Text[텍스트 가져오기]    xpath://*[@class='css-vik48o']
    ${convert}    문자열에서 숫자만 추출    ${payPrice}
    ${inputPrice}    Evaluate    ${convert} - 100
    InputText Element[텍스트 입력하기]    xpath://*[@placeholder='- 0']    ${inputPrice}
    Click Element[버튼 클릭]    xpath://*[text()='다른 결제 수단 더보기']
    Click Element[버튼 클릭]    xpath://div[contains (text(), '간편')]
    ${amount}    Get Text[텍스트 가져오기]    class:css-128od1m
    Should Be Equal    ${amount}    100원 결제하기
    Click Element[버튼 클릭]    //*[contains (text(), '필수 약관 전체 동의')]
    Click Element[버튼 클릭]    class:css-128od1m
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[2]
    Select Frame[프레임 선택]    name:yanoljapay_view
    ${title}    Get Text[텍스트 가져오기]    xpath://*[@id='header']/h1
    Should Contain    ${title}    계좌 등록/결제
    Click Element[버튼 클릭]    xpath://*[text()='하나은행']
    sleep    2s
    ${title}    Get Text[텍스트 가져오기]    xpath://*[@id='header']/h1
    Should Contain    ${title}    결제진행
    IR.Image Click    ${CURDIR}/Images/easy1.png
    IR.Image Click    ${CURDIR}/Images/easy6.png
    IR.Image Click    ${CURDIR}/Images/easy0.png
    IR.Image Click    ${CURDIR}/Images/easy7.png
    IR.Image Click    ${CURDIR}/Images/easy2.png
    IR.Image Click    ${CURDIR}/Images/easy3.png
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    ${title}    Get Text[텍스트 가져오기]    class:title
    Should Be Equal    ${title}    예약 완료되었습니다.
    sleep    3s
    Close Window
    Switch Window    ${windows}[0]

버전별 시트 복사
    ${date}    DT.Get Current Date
    ${date}    Convert Date    ${date}    datetime
    ${week_no}    Google.Get Week No    ${date.year}    ${date.month}    ${date.day}
    # 파일 복사
    ${url}    Google.Copy File    ${date.year}-${date.month}월${week_no}주차    ${GoogleDriveLive_FileID}    ${GoogleDriveLive_FolderID}
    Comment    ${url}    Google.Copy File    ${TEST_VER}    ${GoogleDriveLive_FileID}    ${GoogleDriveLive_FolderID}
    # 새파일 URL 전역변수 저장
    Set Global Variable    ${GoogleDrive_URL_StageBasic}    ${url}
    # 새파일 URL 파일 저장
    OS.Create File    ${GoogleURL}    ${url}
    # 시트 생성    # 시트 이름 전역변수 저장
    Comment    Google.Copy Sheet TEMP    ${date.month}월${date.day}일    ${url}
    Comment    Google.Update Sheet TEMP    ${date.month}월${week_no}주차    ${url}
    Comment    Google.Update Sheet TEMP    ${TEST_VER}    ${url}
    Comment    Set Global Variable    ${WORKSHEET_StageBasic}    ${TEST_VER}
    Google.Update Sheet TEMP    ${date.month}월${week_no}주차    ${url}
    Set Global Variable    ${WORKSHEET_StageBasic}    ${date.month}월${week_no}주차
    Set Global Variable    ${GoogleColumn}    K

검색 > 키워드 입력 후 돋보기 이동 (숙소)
    [Arguments]    ${keyword}
    sleep    3s
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    Comment    Element Visible[요소 표시 여부 체크]    xpath:(//*[contains(text(), '${keyword}')])[1]
    Comment    sleep    1s
    Comment    Click Element[버튼 클릭]    xpath:(//*[contains(text(), '${keyword}')])[1]
    sleep    2s
    Click Element[버튼 클릭]    xpath://*[@alt='검색']
    Click Element[버튼 클릭]    xpath:(//*[contains (text(), '${keyword}')])[3]
    ${title}    Get Text[텍스트 가져오기]    xpath://*[contains (@class, 'property-title')]
    Should Be Equal    ${title}    ${keyword}
    [Teardown]    PDP 튜토리얼 체크

PDP > RDP (모/호/게 대실포함)_호텔 임시
    sleep    1s
    Comment    모텔 대실 예약가능 여부 체크
    Click Element[버튼 클릭]    xpath://*[text()='객실 선택하기']
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:css-1kml15s
    Should Be Equal    ${title}    객실상세

오늘날짜확인2
    ${date}    현재 시간 구하기
    ${mmdd}    Get Substring    ${date}    5    10
    ${checkIn}    Replace String    ${mmdd}    -    .
    Comment    ${month}    ${day}    Split String    ${mmdd}    -
    Comment    ${month2}    Get Substring    ${month}    0    1
    Comment    ${day2}    Get Substring    ${day}    0    1
    Comment    IF    '${month2}' == '0'
    Comment    ${month}    Get Substring    ${month}    1    2
    Comment    END
    Comment    IF    '${day2}' == '0'
    Comment    ${day}    Get Substring    ${day}    1    2
    Comment    END
    Comment    ${checkIn}    Catenate    SEPARATOR=    ${month}    ${day}
    [Return]    ${checkIn}

레저티켓 장바구니 담기 (QA)
    [Arguments]    ${productName}
    Comment    홈 > 검색 버튼 클릭
    Comment    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    ${productName}
    Comment    검색 > 키워드 입력 후 돋보기 이동 (숙소)    ${productName}
    sleep    1s
    Click Element[버튼 클릭]    class: RectButton_primary__3O9TH
    sleep    1s
    Click Element[버튼 클릭]    xpath://*[text()='+']
    숙소 외 장바구니 담기

검색 > 키워드 입력 후 돋보기 이동 (레저)
    [Arguments]    ${keyword}
    sleep    3s
    InputText Element[텍스트 입력하기]    class:SearchInput_input__342U2    ${keyword}
    Comment    Element Visible[요소 표시 여부 체크]    xpath:(//*[contains(text(), '${keyword}')])[1]
    Comment    sleep    1s
    Comment    Click Element[버튼 클릭]    xpath:(//*[contains(text(), '${keyword}')])[1]
    sleep    2s
    Click Element[버튼 클릭]    xpath://*[@alt='검색']
    Click Element[버튼 클릭]    xpath:(//*[contains (text(), '${keyword}')])[3]
    ${title}    Get Text[텍스트 가져오기]    class:LeisureDetailTitle_title__39CSC
    Should Be Equal    ${title}    ${keyword}

Scroll after element check[요소 체크 후 스크롤]
    [Arguments]    ${element}    ${scrollY}
    ${start}    Set Variable    0
    ${end}    Set Variable    300
    FOR    ${index}    IN RANGE    30
        ${elemChk}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    3s    click element    ${element}
        Run Keyword If    '${elemChk}[0]' == 'FAIL'    Execute Javascript    window.scrollTo(${start}, ${end})
        ${start}    Set Variable    ${end}
        ${end}    Set Variable    ${end} + ${scrollY}
        Run Keyword If    '${elemChk}[0]' == 'PASS'    Exit For Loop
        sleep    5s
    END

홈 > 특정탭 클릭
    Click Element[버튼 클릭]    xpath:(//*[contains (@class, 'HomeTabs_tab')])[2]
    sleep    1s
    ${attr}    Get Element Attribute[속성값 가져오기]    xpath:(//*[contains (@class, 'HomeTabs_tab')])[2]    id
    Should Contain    ${attr}    activeTab
    sleep    1s

예약내역 취소 (QA)
    Go To    ${QAMain}/mypage
    MY야놀자 > 국내여행 통합예약 메뉴 클릭
    국내여행 예약내역 > 예약내역 상세
    국내 예약내역 상세 > 예약취소 요청
    국내 예약취소 요청 > 취소 요청하기
    sleep    5s
    취소요청 완료 > 예약내역 상세
    sleep    2s

홈 > 해외여행 메뉴 클릭
    메인 이동
    sleep    5s
    Element Visible[요소 표시 여부 체크]    xpath:(//*[contains (text(), '해외여행')])[1]
    Click Element[버튼 클릭]    xpath:(//*[contains (text(), '해외여행')])[1]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    해외여행

홈 > 교통/항공 메뉴 클릭
    메인 이동
    sleep    5s
    Element Visible[요소 표시 여부 체크]    xpath:(//*[contains (text(), '교통/항공')])[1]
    Click Element[버튼 클릭]    xpath:(//*[contains (text(), '교통/항공')])[1]
    sleep    1s
    ${title}    Get Text[텍스트 가져오기]    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    교통/항공

해외숙소 예약취소(QA용)
    홈 > MY야놀자 메뉴 클릭
    MY야놀자 > 해외여행 통합예약 메뉴 클릭
    해외여행 예약내역 > 예약내역 상세
    해외 예약내역 상세 > 예약취소 요청
    해외 예약취소 요청 > 취소 요청하기

구글 스프레드 시트 결과 업데이트_1차
    [Arguments]    ${status}    ${work_sheet}    ${case_no}    ${response}
    ${status}    Set Variable If    ${status}    Pass    Fail
    ${cell}    Evaluate    ${case_no} + 13
    # 결과 업데이트
    Google.Write Value On Cell    ${GoogleDrive_URL}    ${work_sheet}    K${cell}    ${status}
    # 응답 업데이트
    Google.Write Value On Cell    ${GoogleDrive_URL}    ${work_sheet}    N${cell}    ${response}
