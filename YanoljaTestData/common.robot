*** Settings ***
Library           SeleniumLibrary    WITH NAME    S
Library           DILog.py    WITH NAME    DILog
Library           DateTime    WITH NAME    DT
Library           GoogleAPI_Web.py    WITH NAME    Google
Library           RequestsLibrary    WITH NAME    Re
Library           String
Library           Collections

*** Variables ***
${executable_path}    /Users/youngsung.lee/Desktop/pythonWorkspace/테스트프로젝트/chromedriver
${username}       testys_auto@yanolja.com
${password}       qwer1234!
${totalTime}      30s
${checkTime}      3s
${CGNTID}         ${EMPTY}
${memberNo}       40202024
${GoogleDrive_URL}    https://docs.google.com/spreadsheets/d/1trh7Lt8apTJPo-RsXNtspcfj2VZF5gjWfBYm2EyXnlU/edit#gid=887848623
${WORKSHEET}      LogAutoTEST4
${AUTHORIZATION}    eyJtZW1iZXJObyI6NDAyMDIwMjQsImNnbnRJZCI6ImFwLW5vcnRoZWFzdC0yJTNBMWI2YWQ5ZDctNzgxNC00ZTljLThiNWUtYjJhMTI5OTBhMjhlIn0=

*** Keywords ***
Suite Setup
    로그인 후 cgntId 구하기
    [API_SET] 장바구니 조회 후 모두 삭제

Suite Teardown
    [API_SET] 오늘 자 장바구니 주문 전체 예약 취소
    sleep    3s
    Close Browser

로그인 후 cgntId 구하기
    이메일로 로그인 화면 오픈
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    id:username    ${username}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    id:password    ${password}
    FOR    ${index}    IN RANGE    10
        ${attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Element Attribute    class: RectButton_primary__3O9TH    class
        ${loginBtn}    Run keyword and Ignore error    Should Contain    ${attr}    RectButton_disabled__14E3B
        IF    '${loginBtn}[0]' == 'FAIL'
        Exit For Loop
        ELSE
        Reload Page
        Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    id:username    ${username}
        Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    id:password    ${password}
    END
    END
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='로그인']
    sleep    1s
    ${loginYn}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    xpath://*[@class='MyNick_nickname__2Scd9']/div
    Should Be Equal    ${loginYn}    냐옹냐옹풀향기0001
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='포인트']
    ${cookie}    Get Cookie    cgntId
    ${cgntId}    Replace String    ${cookie.value}    %3A    :
    Set Global Variable    ${CGNTID}    ${cgntId}
    sleep    1s

이메일로 로그인 화면 오픈
    Open Browser    https://qa-m.yanolja.com/emaillogin?redirect=/mypage    Chrome    executable_path=${CURDIR}/chromedriver

홈 화면 오픈 (테스트용)
    Open Browser    https://qa-m.yanolja.com    Chrome    executable_path=${executable_path}

메인 이동
    go to    https://qa-m.yanolja.com/

현재 시간 구하기
    ${date}    DT.Get Current Date
    [Return]    ${date}

홈 > 국내숙소 추천 위젯
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:HomePlaceRecommend_container__380T6
    sleep    1s

홈 > 모텔 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://qa-m.yanolja.com/motel']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://qa-m.yanolja.com/motel']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    모텔

홈 > 호텔 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://qa-m.yanolja.com/hotel']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://qa-m.yanolja.com/hotel']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    호텔/리조트

홈 > 펜션 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://qa-m.yanolja.com/pension']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://qa-m.yanolja.com/pension']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    펜션/풀빌라

홈 > 게하 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://qa-m.yanolja.com/guest-house']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://qa-m.yanolja.com/guest-house']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    게스트하우스

홈 > 항공권 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://qa-m.yanolja.com/flights']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://qa-m.yanolja.com/flights']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:flights_title__35srd
    Should Be Equal    ${title}    항공권

홈 > 무한쿠폰룸 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://qa-m.yanolja.com/motel?myRoom=1']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://qa-m.yanolja.com/motel?myRoom=1']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    무한쿠폰룸

홈 > 해외숙소 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://qa-m.yanolja.com/global/place']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://qa-m.yanolja.com/global/place']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    해외숙소
    sleep    1s

홈 > 지역 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[text()='강원도야놀자']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='강원도야놀자']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:RegionhomeMain_title__2GftR
    Should Be Equal    ${title}    강원도

홈 > 라이브 방송 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[text()='야놀자라이브']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='야놀자라이브']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:NavigationBarHeading_title__hHbul
    Should Be Equal    ${title}    야놀자라이브
    sleep    1s

홈 > 검색 버튼 클릭
    메인 이동
    sleep    1s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@alt='검색']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@alt='검색']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    검색

홈 > MY야놀자 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    //*[@href='/mypage']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    //*[@href='/mypage']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:mypage_title__1NaG1
    Should Be Equal    ${title}    MY 야놀자

홈 > KTX 메뉴 클릭
    메인 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://qa-m.yanolja.com/train']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://qa-m.yanolja.com/train']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    KTX
    sleep    1s

국내숙소 추천 위젯 > 상품 클릭
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:ThemePlaceItem_image__2_Itg
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:_place_no__container__1FhXY
    sleep    1s

서브홈 > 테마형그룹 상품 클릭
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:SubhomeThemedItems_container__2BOx-
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:ThemePlaceItem_container__1Clhm
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:_place_no__container__1FhXY

서브홈 > 리스트형 상품 클릭
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:SubhomeList_container__1WIAh
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:ListItem_container__1z7jK
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:_place_no__container__1FhXY

지역 서브홈 > 지도 클릭
    ${listTitle}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:RegionhomeMapInfo_active__3ZXSV
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@aria-label='Map']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${listTitle}    ${title}

라이브 방송 서브홈 > 특정 방송 진입
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Select Frame    id:iFrameResizer0
    sleep    3s
    ${listTitle}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    xpath:(//*[@class='info-title'])[1]
    sleep    3s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:card_wrapper
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Select Frame    id:live-commerce-broadcast
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:HeaderTitle_title__3SXU4
    Should Be Equal    ${listTitle}    ${title}

항공권 검색
    sleep    3s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='편도']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='도착']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    class:FlightSearchAirportModal_searchInput__3oy24    BCN
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:FlightSearchAirportBody_searchResultRow__3e7KX
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[contains(text(), '여행 날짜')]
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='오늘']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[contains(text(), '적용')]
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='항공권 검색']

항공권 검색결과 > 결제처 클릭
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:FlightListItem_container__23txc
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    항공권 정보
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:FlightDetailProviders_providerAnchor__1t5eR
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    sleep    3s
    Close Window
    Switch Window    ${windows}[0]

해외숙소 서브홈 > 해외숙소 상품 클릭
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:CurationItem_price__DJzAz
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:GlobalPlaceDetailBody_container__emEX3
    sleep    1s

해외숙소 상세 > 해외숙소 예약하기 진입
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:RectButton_label__WcAp7
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='예약하기']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:toolbar-title
    Should Be Equal    ${title}    해외숙소 예약

해외숙소 예약하기 > 해외숙소 결제하기 진입
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    id:성명    이영성
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    id:이메일    ${username}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    id:성(영문)    test
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    id:이름(영문)    test
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='전체 동의']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:radius-md
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    sleep    3s
    Close Window
    Switch Window    ${windows}[0]

하단 메뉴 홈 클릭
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:TabIcon_home__1SIsl

검색 > 국내숙소 검색결과 > PDP 이동
    [Arguments]    ${keyword}
    sleep    1s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    class:SearchInput_input__342U2    ${keyword}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@alt='검색']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath:(//*[@class='PlaceListItemText_container__fUIgA text-unit'])[1]
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:_place_no__container__1FhXY

검색 > 레저/티켓탭 클릭
    sleep    1s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='레저/티켓']

PDP > RDP
    sleep    1s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:RectButton_label__WcAp7
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:RoomItem_roomItemContainerStyle__3XjIR
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    객실상세

RDP > 숙박 예약
    sleep    1s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='숙박 예약하기']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
    Should Be Equal    ${title}    숙박 예약

숙박 예약 > 예약
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='바로 예약하기']
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:center
    Should Be Equal    ${title}    예약

예약(포인트 결제) > 예약완료
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='전액 사용하기']
    ${amount}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:css-128od1m
    Should Be Equal    ${amount}    0원 결제하기
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:css-128od1m
    sleep    5s
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:title
    Should Be Equal    ${title}    예약 완료되었습니다.
    sleep    3s
    Close Window
    Switch Window    ${windows}[0]

검색 > 레저티켓 검색결과 > 상품상세 이동
    [Arguments]    ${keyword}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    class:SearchInput_input__342U2    ${keyword}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:AutocompleteSection_entry__iDjdk
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:LeisureDetailTitle_title__39CSC
    Should Be Equal    ${title}    ${keyword}

레저 상세 > 예약
    sleep    1s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class: RectButton_primary__3O9TH
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath:(//*[text()='+'])[2]
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class: RectButton_primary__3O9TH
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:center
    Should Be Equal    ${title}    예약

장바구니 담기
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class: RectButton_secondary__3qOVd
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    class:PageTitleRightButton_cartCount__1WJxk

장바구니 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@alt='장바구니']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    xpath://*[text()='장바구니']
    Should Be Equal    ${title}    장바구니

장바구니 > 예약
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:primary
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    xpath://*[text()='예약']
    Should Be Equal    ${title}    예약

MY야놀자 > 기획전 메뉴 클릭
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    //*[@href='/exhibition']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    (//*[@class='ExhibitionListNav_normal__1ha2N'])[1]
    Should Be Equal    ${title}    기획전

기획전 > QA로그전용 메뉴 클릭
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath:(//*[text()='해외 숙소'])[2]
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='QA 로그 전용']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    //*[@class='ExhibitionDetailNav_title__1NE43']
    Should Be Equal    ${title}    QA 로그 전용

KTX > 승차권 조건 선택 후 조회 버튼 클릭
    [Arguments]    ${arrival}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:TrainSHomeStationDisplay_placeholder__3yNbY
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
    Should Be Equal    ${title}    도착역 선택
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    class:TrainSHomeStationModalTitle_input__573Rb    ${arrival}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:TrainSHomeStationModal_suggestion__24s5l
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:TrainSHomeBody_datePlaceholder__hCwn1
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    xpath:(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]
    Should Be Equal    ${title}    날짜 선택
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://div[contains(@class, 'TrainSHomeCalendarModal_calendarDaySelector__uXOSA') and not(contains(@class, 'TrainSHomeCalendarModal_outsideRangeStyle___ZYRF'))]
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[contains(text(), '적용')]
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:RectButton_label__WcAp7

승차권 유무 체크 후 요금조회 버튼 클릭
    FOR    ${index}    IN RANGE    30
        ${status}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:RectButton_label__WcAp7
        IF    '${status}'=='좌석부족'
        Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@class='TrainTicketsNavButtons_changeDate__ualU1']
        ELSE
        Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:RectButton_label__WcAp7
        Exit For Loop
    END
    END

바로 예매 > 선택한 승차권 장바구니 담기
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='바로 예매']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='확인']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:PageTitle_pageTitle__Q5MEn
    Should Be Equal    ${title}    선택한 승차권
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[text()='장바구니 담기']

레저티켓 장바구니 담기
    홈 > 검색 버튼 클릭
    검색 > 레저/티켓탭 클릭
    검색 > 레저티켓 검색결과 > 상품상세 이동    [테스트] 야놀자 놀이공원
    sleep    1s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class: RectButton_primary__3O9TH
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath:(//*[text()='+'])[2]
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
    구글 스프레드 시트 결과 업데이트    ${status}    LogAutoTEST    ${case_no}
    구글 스프레드 시트 결과 업데이트_플러스    ${status}    ${WORKSHEET}    ${case_no}    ${response}    ${class}    ${page_name}    ${event_type}
    Should Be True    ${status}

구글 스프레드 시트 결과 업데이트
    [Arguments]    ${status}    ${work_sheet}    ${case_no}
    ${status}    Set Variable If    ${status}    Pass    Fail
    ${cell}    Evaluate    ${case_no} + 13
    Google.Write Value On Cell    ${GoogleDrive_URL}    ${work_sheet}    M${cell}    ${status}

구글 스프레드 시트 결과 업데이트_플러스
    [Arguments]    ${status}    ${work_sheet}    ${case_no}    ${response}    ${class}    ${page_name}    ${event_type}
    ${status}    Set Variable If    ${status}    Pass    Fail
    ${cell}    Evaluate    ${case_no} + 13
    @{update_value}    Run Keyword If    '${status}' == 'Pass'    Create List    ${case_no}    ${response}[priority]    ${class}    ${response}[pageName]    ${response}[desc] (v${response}[version])    ${response}[eventType]    ${status}    ${response}
    ...    ELSE    Create List    ${case_no}    ${EMPTY}    ${class}    ${page_name}    ${EMPTY}    ${event_type}    ${status}    ${EMPTY}
    Google.Batch Update    ${GoogleDrive_URL}    ${work_sheet}    B${cell}:P${cell}    @{update_value}
