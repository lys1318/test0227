*** Settings ***
Library           Process
Library           RequestsLibrary    WITH NAME    Re
Library           Collections
Library           DateTime    WITH NAME    DT
Library           GoogleAPI.py    WITH NAME    Google
Library           OperatingSystem    WITH NAME    OS
Library           String
Library           AppiumLibrary    WITH NAME    Ap
Library           OpenCV.py    WITH NAME    OC

*** Variables ***
${qa_username}    testys_auto@yanolja.com
${qa_password}    qwer1234!
${LiveMain}       https://www.yanolja.com
${QAMain}         https://qa-m.yanolja.com
${live_username}    qa_test02@yanolja.com
${live_password}    qwert12345@
${totalTime}      30s
${checkTime}      3s
${contextNow}     NATIVE_APP
${native}         NATIVE_APP
${webview}        WEBVIEW_com.cultsotry.yanolja.nativeapp.dev
${GoogleURL}      /Users/youngsung.lee/google_url
${GoogleDrive_URL_StageBasic}    https://docs.google.com/spreadsheets/d/1esDCuZK5eO4fT0XDrDjRc3l4DS3WMxJHnBCMIv0Pes0/edit#gid=0
${WORKSHEET_StageBasic}    v.8.13.0 기준
${GoogleColumn}    K
${GoogleDriveLive_FileID}    1Kld4gqXtOsnbtRQ7o8Ek4GjJ2462DsixZ2bEyOgI8ho
${GoogleDriveLive_FolderID}    1LxHVRACBKasJEPkthAArZxQyFje9B6Eq
${TEST_PHASE}     1
${live_nickname}    Qatest02

*** Keywords ***
앱 실행
    Comment    Ap.Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    appium:platformversion=11.0    appium:deviceName=SM-N981N    appium:automationName=Appium    appium:appPackage=com.cultsotry.yanolja.nativeapp.dev    appium:appActivity=com.yanolja.presentation.intro.view.IntroActivity    appium:udid=R3CN8001X3X    noReset=false    fullReset=false    newCommandTimeout=300
    Ap.Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    appium:platformversion=11.0    appium:deviceName=SM-N981N    appium:automationName=Appium    appium:appPackage=com.cultsotry.yanolja.nativeapp.dev    appium:appActivity=com.yanolja.presentation.intro.view.IntroActivity    appium:udid=192.168.35.50:5555    noReset=false    fullReset=false    newCommandTimeout=300

앱 재실행
    Terminate Application    com.cultsotry.yanolja.nativeapp.dev
    sleep    3s
    Activate Application    com.cultsotry.yanolja.nativeapp.dev

앱 사용 동의
    타이틀 체크    //*[contains (@resource-id, 'tvTermsComment')]    항목에 동의
    Comment    ${title}    Ap.Get Text[텍스트 가져오기]    //*[contains (@resource-id, 'tvTermsComment')]
    Comment    Should Contain    ${title}    항목에 동의
    Ap.Click Element[버튼 클릭]    //*[contains (@text, '전체 동의')]
    Ap.Click Element[버튼 클릭]    //*[contains (@text, '시작')]
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@text, '홈')]

APP_홈 > My 야놀자
    Comment    홈 이동 키워드 추가 필요
    Ap.Click Element[버튼 클릭]    //*[contains (@text, '마이')]
    타이틀 체크    //*[contains (@resource-id, 'title')]    MY 야놀자

APP_My 야놀자 > 로그인 화면
    Ap.Click Element[버튼 클릭]    //*[contains (@text, '로그인 및 회원가입')]
    sleep    1s
    타이틀 체크    //*[contains (@resource-id, 'title')]    로그인

APP_로그인 하기
    Ap.Click Element[버튼 클릭]    //*[contains (@text, '이메일로 로그인')]
    타이틀 체크    //*[contains (@resource-id, 'title')]    이메일로 로그인
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@text, '비밀번호 찾기')]
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@text, '이메일로 회원가입')]
    Ap.InputText Element[텍스트 입력하기]    xpath=(//*[contains (@resource-id, 'editText')])[1]    ${qa_username}
    Ap.InputText Element[텍스트 입력하기]    xpath=(//*[contains (@resource-id, 'editText')])[2]    ${qa_password}
    Ap.Click Element[버튼 클릭]    //*[contains (@resource-id, 'btnLogin')]

Scroll until element[요소 노출까지 스크롤_Native]
    [Arguments]    ${element}    ${scrollY}
    ${mobile_width}    Get Window Width
    ${mobile_height}    Get Window Height
    ${centerX}    Evaluate    ${mobile_width}/2
    ${centerY}    Evaluate    ${mobile_height}/2
    ${centerX_CV}    Convert To Integer    ${centerX}
    ${centerY_CV}    Convert To Integer    ${centerY}
    ${plusY}    Evaluate    ${centerY_CV} - ${scrollY}
    IF    '${plusY}' <= '0'
    ${plusY}    Evaluate    0
    END
    FOR    ${index}    IN RANGE    30
        ${elementYn}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    3s    Ap.Element Should Be Visible    ${element}
        Run Keyword If    '${elementYn}[0]' == 'FAIL'    Swipe    ${centerX_CV}    ${centerY_CV}    ${centerX_CV}    ${plusY}
        Run Keyword If    '${elementYn}[0]' == 'PASS'    Ap.Click Element[버튼 클릭]    ${element}
        Run Keyword If    '${elementYn}[0]' == 'PASS'    Exit For Loop
        sleep    3s
    END

context 전환
    IF    '${contextNow}' == 'NATIVE_APP'
    Switch To Context    ${webview}
    Set Global Variable    ${contextNow}    ${webview}
    ELSE IF    '${contextNow}' == 'WEBVIEW_com.cultsotry.yanolja.nativeapp.dev'
    Switch To Context    ${native}
    Set Global Variable    ${contextNow}    ${native}
    END
    Log To Console    ${contextNow}

ㅡㅡㅡㅡㅡㅡㅡㅡ앱/모웹 구분ㅡㅡㅡㅡㅡㅡㅡㅡ

MW_Suite Setup (live)
    구글 시트 파일 복사
    구글시트 테스트 수행 날짜 업데이트 (live)
    sleep    3s
    MW_live 테스트숙소 노출 설정

MW_Suite Teardown
    sleep    3s
    Close Application

MW_로그인 여부 & 장바구니 유무 체크
    MW_로그인 여부 체크_LIVE
    MW_홈 > 장바구니 유무 체크

MW_로그인 여부 체크_LIVE
    Go To Url    https://www.yanolja.com/mypage
    ${loginYn}    Run keyword and Ignore error    Ap.Element Visible[요소 표시 여부 체크]    //*[@class='MyNick_nickname__2Scd9']/div
    Run Keyword If    '${loginYn}[0]' == 'PASS'    No Operation
    Run Keyword If    '${loginYn}[0]' == 'FAIL'    Go To Url    https://www.yanolja.com/emaillogin?redirect=/mypage
    Run Keyword If    '${loginYn}[0]' == 'FAIL'    MW_로그인 하기    ${live_username}    ${live_password}    ${live_nickname}

MW_PDP 튜토리얼 체크
    FOR    ${index}    IN RANGE    3
        MW_PDP 튜토리얼 다음 클릭
    END

Ap.Get Text[텍스트 가져오기]
    [Arguments]    ${element}
    ${get_text}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Ap.Get Text    ${element}
    Comment    ${convert}    텍스트 줄바꿈 제거    ${get_text}
    [Return]    ${get_text}

Ap.Click Element[버튼 클릭]
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Ap.Click Element    ${element}

텍스트 줄바꿈 제거
    [Arguments]    ${text}
    ${convert}    Replace String    ${text}    \n    ${EMPTY}
    [Return]    ${convert}

Ap.Element Visible[요소 표시 여부 체크]
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Ap.Element Should Be Visible    ${element}

Ap.InputText Element[텍스트 입력하기]
    [Arguments]    ${element}    ${input_text}
    Wait Until Keyword Succeeds    30s    3s    Ap.Input Text    ${element}    ${input_text}

Ap.Get Element Attribute[속성값 가져오기]
    [Arguments]    ${element}    ${attribute}
    ${get_attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Ap.Get Element Attribute    ${element}    ${attribute}
    [Return]    ${get_attr}

Ap.Select Frame[프레임 선택]
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Switch To Frame    ${element}

Scroll after element check[요소 체크 후 스크롤_Webview]
    [Arguments]    ${element}    ${scrollY}
    ${start}    Set Variable    0
    ${end}    Set Variable    300
    FOR    ${index}    IN RANGE    30
        ${elemChk}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    3s    Ap.Click Element    ${element}
        Run Keyword If    '${elemChk}[0]' == 'FAIL'    Execute Script    window.scrollTo(${start}, ${end})
        ${start}    Set Variable    ${end}
        ${end}    Set Variable    ${end} + ${scrollY}
        Run Keyword If    '${elemChk}[0]' == 'PASS'    Exit For Loop
        sleep    5s
    END

Scroll until element[요소 노출까지 스크롤&클릭_Webview]
    [Arguments]    ${element}    ${scrollY}
    ${mobile_width}    Get Window Width
    ${mobile_height}    Get Window Height
    ${centerX}    Evaluate    ${mobile_width}/2
    ${centerY}    Evaluate    ${mobile_height}/2
    ${centerX_CV}    Convert To Integer    ${centerX}
    ${centerY_CV}    Convert To Integer    ${centerY}
    ${plusY}    Evaluate    ${centerY_CV} - ${scrollY}
    IF    '${plusY}' <= '0'
    ${plusY}    Evaluate    0
    END
    FOR    ${index}    IN RANGE    30
        ${elementYn}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    3s    Ap.Click Element    ${element}
        Run Keyword If    '${elementYn}[0]' == 'FAIL'    Swipe    ${centerX_CV}    ${centerY_CV}    ${centerX_CV}    ${plusY}
        Run Keyword If    '${elementYn}[0]' == 'PASS'    Exit For Loop
        sleep    3s
    END

Scroll[입력한 값만큼 스크롤]
    [Arguments]    ${scrollY}
    ${mobile_width}    Get Window Width
    ${mobile_height}    Get Window Height
    ${centerX}    Evaluate    ${mobile_width}/2
    ${centerY}    Evaluate    ${mobile_height} * 0.9
    ${centerX_CV}    Convert To Integer    ${centerX}
    ${centerY_CV}    Convert To Integer    ${centerY}
    ${plusY}    Evaluate    ${centerY_CV} - ${scrollY}
    IF    '${plusY}' <= '0'
    ${plusY}    Evaluate    0
    END
    Swipe    ${centerX_CV}    ${centerY_CV}    ${centerX_CV}    ${plusY}

타이틀 체크
    [Arguments]    ${element}    ${title_compare}
    sleep    1s
    ${title}    Ap.Get Text[텍스트 가져오기]    ${element}
    Should Contain    ${title}    ${title_compare}

MW_live 테스트숙소 노출 설정
    Comment    Ap.Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    appium:platformversion=11.0    appium:deviceName=SM-N981N    appium:automationName=Appium    appium:udid=R3CN8001X3X    noReset=true    fullReset=false    newCommandTimeout=300    browserName=Chrome
    Ap.Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    appium:platformversion=11.0    appium:deviceName=SM-N981N    appium:automationName=Appium    appium:udid=172.30.1.1:5555    noReset=true    fullReset=false    newCommandTimeout=300    browserName=Chrome
    Go To URL    ${LiveMain}/_settings
    Ap.Click Element[버튼 클릭]    //*[@for='testProduct-YES']/span[1]

MW_메인 이동
    ${tags}    Set Variable    @{TEST TAGS}
    Set Global Variable    ${TAGS}    ${tags}
    ${type_TAGS}    Run keyword and Ignore error    Evaluate    type(${TAGS}).__name__
    IF    '${type_TAGS}[0]' == 'FAIL'
    Run Keyword If    '${TAGS}' == 'WEB_LOG'    Go To Url    https://qa-m.yanolja.com/
    Run Keyword If    '${TAGS}' == 'StageBasic'    Go To Url    https://stage-m.yanolja.com/
    Run Keyword If    '${TAGS}' == 'LiveBasic'    Go To Url    https://www.yanolja.com/
    ELSE
    Run Keyword If    '${TAGS}[1]' == 'TEST'    Go To Url    https://www.yanolja.com/
    END

MW_홈 > MY야놀자
    MW_메인 이동
    Ap.Element Visible[요소 표시 여부 체크]    //*[@href='/mypage']
    Ap.Click Element[버튼 클릭]    //*[@href='/mypage']
    타이틀 체크    //*[@class='mypage_title__1NaG1']    MY 야놀자

MW_MY야놀자 > 로그인
    Ap.Click Element[버튼 클릭]    //*[text()='로그인 및 회원가입 하기']
    타이틀 체크    //*[@class='NavigationBarHeading_title__hHbul']    로그인

MW_로그인 > 이메일로 로그인
    Ap.Click Element[버튼 클릭]    //*[text()='이메일로 로그인']
    타이틀 체크    //*[@class='NavigationBarHeading_title__hHbul']    이메일로 로그인

MW_로그인 하기
    [Arguments]    ${id}    ${pw}    ${nickName}
    Ap.InputText Element[텍스트 입력하기]    //*[@id='username']    ${id}
    Ap.InputText Element[텍스트 입력하기]    //*[@id='password']    ${pw}
    FOR    ${index}    IN RANGE    5
        ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[contains (@class, 'RectButton_primary__3O9TH')]    class
        ${loginBtn}    Run keyword and Ignore error    Should Contain    ${attr}    RectButton_disabled__14E3B
        Run Keyword If    '${loginBtn}[0]' == 'FAIL'    Exit For Loop
        Run Keyword If    '${loginBtn}[0]' == 'PASS'    Reload Page
        Run Keyword If    '${loginBtn}[0]' == 'PASS'    Ap.InputText Element[텍스트 입력하기]    id:username    ${id}
        Run Keyword If    '${loginBtn}[0]' == 'PASS'    Ap.InputText Element[텍스트 입력하기]    id:password    ${pw}
    END
    Ap.Click Element[버튼 클릭]    //*[text()='로그인']
    타이틀 체크    //*[@class='MyNick_nickname__2Scd9']/div    ${nickName}

MW_MY야놀자 > 내정보관리
    Ap.Click Element[버튼 클릭]    //*[text()='내정보 관리']
    타이틀 체크    //*[contains (@class, 'title')]    내 정보 관리

MW_내정보관리 > 비밀번호입력 후 상세 이동
    Ap.InputText Element[텍스트 입력하기]    //*[@id='password']    ${live_password}
    Ap.Click Element[버튼 클릭]    //*[text()='확인']
    타이틀 체크    //*[contains (@class, 'Nickname_memberID')]    ${live_username}

MW_MY야놀자 > 포인트
    Ap.Click Element[버튼 클릭]    //*[text()='포인트']
    타이틀 체크    //*[@class='css-djecwh']    포인트

MW_MY야놀자 > MY혜택
    Ap.Click Element[버튼 클릭]    //*[text()='MY 혜택']
    타이틀 체크    //*[contains (@class, 'title')]    MY 혜택

MW_MY야놀자 > 야놀자코인
    Ap.Click Element[버튼 클릭]    //*[text()='야놀자 코인']
    타이틀 체크    //*[contains (@class, 'title')]    야놀자 코인

MW_MY야놀자 > 쿠폰함
    Ap.Click Element[버튼 클릭]    //*[text()='쿠폰함']
    타이틀 체크    //*[contains (@class, 'title')]    쿠폰함

MW_MY야놀자 > 나의후기
    Ap.Click Element[버튼 클릭]    //*[text()='나의 후기']
    타이틀 체크    //*[contains (@class, 'title')]    나의 후기

MW_MY야놀자 > 찜
    Ap.Click Element[버튼 클릭]    //*[text()='찜']
    타이틀 체크    //*[contains (@class, 'title')]    찜

MW_MY야놀자 > 공지사항
    Execute Script    window.scrollTo(0, document.body.scrollHeight)
    Ap.Click Element[버튼 클릭]    //*[text()='공지사항']
    타이틀 체크    //*[contains (@class, 'css-melwew')]    공지사항

MW_MY야놀자 > 자주묻는질문FAQ
    Execute Script    window.scrollTo(0, document.body.scrollHeight)
    Ap.Click Element[버튼 클릭]    //*[text()='자주 묻는 질문 FAQ']
    타이틀 체크    //*[contains (@class, 'css-melwew')]    자주 묻는 질문

MW_홈 > 국내숙소탭
    MW_메인 이동
    Ap.Element Visible[요소 표시 여부 체크]    //*[text()='국내숙소']
    Ap.Click Element[버튼 클릭]    //*[text()='국내숙소']
    sleep    1s
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[text()='국내숙소']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab

MW_국내숙소 > 모텔
    Ap.Element Visible[요소 표시 여부 체크]    //*[text()='모텔']
    Ap.Click Element[버튼 클릭]    //*[text()='모텔']
    타이틀 체크    xpath=(//*[contains (@class, 'title')])[2]    모텔

MW_홈 > 검색
    MW_메인 이동
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains(@class, 'HomeSearchBar_search__')]
    Ap.Click Element[버튼 클릭]    //*[contains(@class, 'HomeSearchBar_search__')]
    sleep    2s
    타이틀 체크    xpath=(//*[contains (@class, 'title')])[1]    검색

MW_검색 > 국내숙소 검색결과 > PDP 이동
    [Arguments]    ${keyword}
    Ap.InputText Element[텍스트 입력하기]    //*[@class='SearchInput_input__342U2']    ${keyword}
    Ap.Element Visible[요소 표시 여부 체크]    xpath=(//*[(text()='${keyword}')])[1]
    Ap.Click Element[버튼 클릭]    xpath=(//*[(text()='${keyword}')])[1]
    타이틀 체크    //*[contains (@class, 'title')]    ${keyword}
    [Teardown]    MW_PDP 튜토리얼 체크

MW_체크인날짜확인
    ${today}    MW_오늘날짜확인
    ${getText}    Ap.Get Text[텍스트 가져오기]    //*[@class='css-1cq8r2w']/span
    ${convert}    MW_문자열에서 숫자만 추출    ${getText}
    Run Keyword If    '${today}' == '${convert}'    MW_국내숙소 날짜 설정    8
    Run Keyword If    '${getText}' == '지금부터'    MW_국내숙소 날짜 설정    8

MW_오늘날짜확인
    ${date}    MW_현재 시간 구하기
    ${mmdd}    Get Substring    ${date}    5    10
    ${checkIn}    Replace String    ${mmdd}    -    ${EMPTY}
    [Return]    ${checkIn}

MW_오늘날짜확인2
    ${date}    MW_현재 시간 구하기
    ${mmdd}    Get Substring    ${date}    5    10
    ${checkIn}    Replace String    ${mmdd}    -    .
    [Return]    ${checkIn}

MW_현재 시간 구하기
    ${date}    DT.Get Current Date
    [Return]    ${date}

MW_문자열에서 숫자만 추출
    [Arguments]    ${string}
    ${replace}    Replace String Using Regexp    ${string}    [^\\d]    ${EMPTY}
    log    ${replace}
    [Return]    ${replace}

MW_국내숙소 날짜 설정
    [Arguments]    ${days_later}
    ${today}    MW_오늘날짜확인2
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains (text(), '${today}')])[1]
    타이틀 체크    xpath=(//*[@class='css-djecwh'])[2]    날짜 선택
    Ap.Click Element[버튼 클릭]    xpath=(//*[not(contains (@data-testid, 'undefined')) and contains (@class, 'css-1ego3xc') and not(contains (@class, 'css-elyyt7'))])[${days_later}]
    Ap.Click Element[버튼 클릭]    //*[@class='css-ijxt52']

MW_PDP 튜토리얼 다음 클릭
    ${tutorialYn}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Ap.Element Should Be Visible    //*[@id='BOTTOM_SHEET']
    Run Keyword If    '${tutorialYn}[0]' == 'PASS'    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'right')]
    Run Keyword If    '${tutorialYn}[0]' == 'FAIL'    No Operation

MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)
    [Arguments]    ${keyword}
    Ap.InputText Element[텍스트 입력하기]    //*[contains (@type, 'search')]    ${keyword}
    Ap.Click Element[버튼 클릭]    //*[@alt='검색']
    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='${keyword}'])[2]
    타이틀 체크    //*[contains (@class, 'title')]    ${keyword}
    [Teardown]    MW_PDP 튜토리얼 체크

MW_PDP > RDP (모/호/게 대실포함)
    MW_모텔 대실 예약가능 여부 체크
    타이틀 체크    //*[contains (text(), '객실상세')]    객실상세

MW_모텔 대실 예약가능 여부 체크
    @{elements}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Ap.Get WebElements    //*[@class='css-1ao9jo6']/div[1]
    ${Index2}    Set Variable    1
    FOR    ${index}    IN    @{elements}
        ${attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Ap.Get Element Attribute    ${index}    disabled
        log    ${attr}
        Run Keyword If    '${attr}' == 'true'    Continue For Loop
        Run Keyword If    '${attr}' == 'true'    ${Index2}    Set Variable    ${Index2} + 1
        Run Keyword If    '${attr}' != 'true'    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='객실 선택하기'])[${Index2}]
        Run Keyword If    '${attr}' != 'true'    Exit For Loop
    END

MW_RDP > 대실 예약
    Ap.Click Element[버튼 클릭]    xpath=(//*[@class='css-1wxsndh' and text()='대실']/parent::div//*[text()='객실 예약하기'])[1]
    타이틀 체크    //*[@class='css-18k5no3']    대실 예약
    MW_RDP > 무료취소여부체크
    Ap.Click Element[버튼 클릭]    xpath=(//*[@class='css-ihwtry'])[1]
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    xpath=(//*[contains (@class, 'time')])[1]    class
    ${selectedYn}    Should Contain    ${attr}    selected

MW_RDP > 무료취소여부체크
    ${cancelTxt}    Ap.Get Text[텍스트 가져오기]    //*[@class='css-1fqi9i1']
    ${cancelYn}    Run keyword and Ignore error    Should Contain    ${cancelTxt}    무료취소
    Run Keyword If    '${cancelYn}[0]' == 'FAIL'    Ap.Click Element[버튼 클릭]    //*[@class='css-gtuddj']
    Run Keyword If    '${cancelYn}[0]' == 'FAIL'    MW_국내숙소 날짜 설정    10

MW_바로 예약 > 예약
    Ap.Click Element[버튼 클릭]    //*[text()='바로 예약']
    Ap.Click Element[버튼 클릭]    //*[@data-testid='popup-button']
    sleep    3s
    ${windows}    Get Windows
    Switch to Window    ${windows}[1]
    타이틀 체크    //*[contains (@class, 'left')]    예약

MW_예약(간편결제) > 예약완료 (일반)
    ${transportYn}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Ap.Element Should Be Visible    //*[@class='css-i1l4h7']
    Run Keyword If    '${transportYn}[0]' == 'FAIL'    No Operation
    Run Keyword If    '${transportYn}[0]' == 'PASS'    Ap.Click Element[버튼 클릭]    //*[@class='css-1mwn02k']/button[1]
    ${payPrice}    Ap.Get Text[텍스트 가져오기]    //*[@class='css-vik48o']
    ${convert}    MW_문자열에서 숫자만 추출    ${payPrice}
    ${inputPrice}    Evaluate    ${convert} - 100
    Ap.InputText Element[텍스트 입력하기]    //*[@placeholder='- 0']    ${inputPrice}
    Ap.Click Element[버튼 클릭]    //*[text()='다른 결제 수단 더보기']
    Ap.Click Element[버튼 클릭]    //div[contains (text(), '간편')]
    타이틀 체크    //*[@class='css-128od1m']    100원 결제하기
    sleep    2s
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '필수 약관 전체 동의')]
    Ap.Click Element[버튼 클릭]    //*[@class='css-128od1m']
    sleep    5s
    ${windows}    Get Windows
    Switch to Window    ${windows}[2]
    타이틀 체크    //*[@id='header']/h1    계좌 등록/결제
    MW_PG 결제 키패드 클릭 (일반)

MW_PG 결제 키패드 클릭 (일반)
    Ap.Click Element[버튼 클릭]    //*[text()='하나은행']
    sleep    2s
    타이틀 체크    //*[@id='header']/h1    결제진행
    Capture Page Screenshot    ori.png
    Click Element By Image[이미지 매칭 클릭]    1.png
    Click Element By Image[이미지 매칭 클릭]    6.png
    Click Element By Image[이미지 매칭 클릭]    0.png
    Click Element By Image[이미지 매칭 클릭]    7.png
    Click Element By Image[이미지 매칭 클릭]    2.png
    Click Element By Image[이미지 매칭 클릭]    3.png
    sleep    5s
    ${windows}    Get Windows
    Switch to Window    ${windows}[1]
    타이틀 체크    //*[@class='title']    예약 완료되었습니다.
    sleep    3s
    Click Element By Image[탭 종료]    close.png
    sleep    3s
    Switch to Window    ${windows}[0]

Click Element By Image[이미지 매칭 클릭]
    [Arguments]    ${template}
    ${add}    Evaluate    250
    ${temp}    OC.Get Image    /Users/youngsung.lee/log/ori.png    /Users/youngsung.lee/log/settle/${template}    /Users/youngsung.lee/log/result.png    ${add}
    Log    ${temp}
    Comment    Ap.Click A Point    ${temp}[0]    ${temp}[1]
    Ap.Tap    ${None}    ${temp}[0]    ${temp}[1]
    sleep    1s

Click Element By Image[탭 종료]
    [Arguments]    ${template}
    ${add}    Evaluate    0
    ${temp}    OC.Get Image    /Users/youngsung.lee/log/ori2.png    /Users/youngsung.lee/log/settle/${template}    /Users/youngsung.lee/log/result2.png    ${add}
    Log    ${temp}
    Comment    Ap.Click A Point    ${temp}[0]    ${temp}[1]
    Ap.Tap    ${None}    ${temp}[0]    ${temp}[1]
    sleep    1s

MW_예약내역 취소
    MW_홈 > MY야놀자
    MW_MY야놀자 > 국내여행 통합예약
    MW_국내여행 예약내역 > 예약내역 상세
    MW_국내 예약내역 상세 > 예약취소 요청
    MW_국내 예약취소 요청 > 취소 요청하기
    sleep    5s
    MW_취소요청 완료 > 예약내역 상세
    sleep    2s

MW_MY야놀자 > 국내여행 통합예약
    Ap.Click Element[버튼 클릭]    //*[text()='국내여행 통합예약']
    sleep    2s
    타이틀 체크    //*[contains (@class, 'left')]    국내여행 예약내역

MW_국내여행 예약내역 > 예약내역 상세
    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='상세보기'])[1]
    sleep    2s
    타이틀 체크    //*[contains (@class, 'left')]    예약내역 상세

MW_국내 예약내역 상세 > 예약취소 요청
    Ap.Click Element[버튼 클릭]    //*[text()='예약취소 요청']
    sleep    2s
    타이틀 체크    //*[contains (@class, 'left')]    예약취소 요청

MW_국내 예약취소 요청 > 취소 요청하기
    Ap.Click Element[버튼 클릭]    //*[text()='전체 선택']
    sleep    1s
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'primary')]
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'css-y1bp6q')]
    sleep    1s
    타이틀 체크    //*[@class='css-18k5no3']    취소 사유 선택
    sleep    1s
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '예약정보 변경')]
    Ap.Click Element[버튼 클릭]    //*[text()='선택 완료']
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'primary')]
    sleep    2s
    Ap.Click Element[버튼 클릭]    //*[text()='전체 동의하기']
    sleep    2s
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[contains (@class, 'primary')]    class
    ${cancelBtn}    Run keyword and Ignore error    Should Contain    ${attr}    disabled
    Run Keyword If    '${cancelBtn}[0]' == 'FAIL'    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'primary')]
    sleep    2s
    타이틀 체크    //*[@class='css-tmlfjl']    예약 취소를 요청하시겠어요?
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains (@class, 'css-17y1gu4')])[2]
    sleep    4s
    타이틀 체크    //*[contains (@class, 'title')]    취소 요청이 완료되었습니다.

MW_취소요청 완료 > 예약내역 상세
    Ap.Click Element[버튼 클릭]    //*[text()='예약상세 보기']
    sleep    1s
    타이틀 체크    //*[contains (@class, 'left')]    예약내역 상세
    sleep    2s
    # 취소완료 체크
    타이틀 체크    //*[@class='cancel-completed css-1esg0fo']    취소 완료

MW_PDP > RDP (모텔 숙박)
    sleep    1s
    MW_모텔 숙박 예약가능 여부 체크
    sleep    1s
    타이틀 체크    //*[contains (text(), '객실상세')]    객실상세

MW_모텔 숙박 예약가능 여부 체크
    @{elements}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Ap.Get WebElements    //*[@class='css-1ao9jo6']/div[2]
    ${Index2}    Set Variable    1
    FOR    ${index}    IN    @{elements}
        ${attr}    Ap.Get Element Attribute[속성값 가져오기]    ${index}    disabled
        Comment    ${attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Element Attribute    ${index}    disabled
        log    ${attr}
        Run Keyword If    '${attr}' == 'true'    Continue For Loop
        Run Keyword If    '${attr}' == 'true'    ${Index2}    Set Variable    ${Index2} + 1
        Run Keyword If    '${attr}' != 'true'    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='객실 선택하기'])[${Index2}]
        Run Keyword If    '${attr}' != 'true'    Exit For Loop
    END

MW_RDP > 모텔 숙박 예약
    sleep    1s
    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='객실 예약하기'])[2]
    sleep    3s
    타이틀 체크    //*[@class='css-18k5no3']    숙박 예약
    MW_RDP > 무료취소여부체크

MW_숙소 장바구니 담기
    Ap.Click Element[버튼 클릭]    //*[text()='장바구니 담기']
    Ap.Element Visible[요소 표시 여부 체크]    //*[@class='css-19nwgzc']

MW_홈 > 장바구니 유무 체크
    MW_메인 이동
    ${cartCnt}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Ap.Element Should Be Visible    //*[@class='HomeSearchBar_cartCount__LJD06']
    Run Keyword If    '${cartCnt}[0]' == 'FAIL'    No Operation
    Run Keyword If    '${cartCnt}[0]' == 'PASS'    MW_장바구니 비우기

MW_장바구니 비우기
    Go To Url    https://platform-site.yanolja.com/cart
    sleep    1s
    타이틀 체크    //*[contains (@class, 'left')]    장바구니
    Ap.Click Element[버튼 클릭]    //*[text()='선택 삭제']
    Ap.Element Visible[요소 표시 여부 체크]    //*[@class='css-e84qjx']
    Ap.Click Element[버튼 클릭]    //*[@class='primary css-17y1gu4']
    sleep    1s
    타이틀 체크    //*[@class='no-item-text']    장바구니에 담긴 상품이 없습니다

MW_숙소 장바구니 이동
    Ap.Click Element[버튼 클릭]    //*[@class='css-1ai9mni']
    타이틀 체크    //*[text()='장바구니']    장바구니

MW_장바구니 > 예약
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'primary')]
    타이틀 체크    //*[text()='예약']    예약

MW_예약(간편결제) > 예약완료 (장바구니)
    ${transportYn}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Ap.Element Should Be Visible    //*[@class='css-i1l4h7']
    Run Keyword If    '${transportYn}[0]' == 'FAIL'    No Operation
    Run Keyword If    '${transportYn}[0]' == 'PASS'    Ap.Click Element[버튼 클릭]    //*[@class='css-1mwn02k']/button[1]
    ${payPrice}    Ap.Get Text[텍스트 가져오기]    //*[@class='css-vik48o']
    ${convert}    MW_문자열에서 숫자만 추출    ${payPrice}
    ${inputPrice}    Evaluate    ${convert} - 100
    Ap.InputText Element[텍스트 입력하기]    //*[@placeholder='- 0']    ${inputPrice}
    Ap.Click Element[버튼 클릭]    //*[text()='다른 결제 수단 더보기']
    Ap.Click Element[버튼 클릭]    //div[contains (text(), '간편')]
    타이틀 체크    //*[@class='css-128od1m']    100원 결제하기
    sleep    2s
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '필수 약관 전체 동의')]
    Ap.Click Element[버튼 클릭]    //*[@class='css-128od1m']
    sleep    5s
    ${windows}    Get Windows
    Switch to Window    ${windows}[1]
    타이틀 체크    //*[@id='header']/h1    계좌 등록/결제
    MW_PG 결제 키패드 클릭 (장바구니)

MW_PG 결제 키패드 클릭 (장바구니)
    Ap.Click Element[버튼 클릭]    //*[text()='하나은행']
    sleep    2s
    타이틀 체크    //*[@id='header']/h1    결제진행
    Capture Page Screenshot    ori.png
    Click Element By Image[이미지 매칭 클릭]    1.png
    Click Element By Image[이미지 매칭 클릭]    6.png
    Click Element By Image[이미지 매칭 클릭]    0.png
    Click Element By Image[이미지 매칭 클릭]    7.png
    Click Element By Image[이미지 매칭 클릭]    2.png
    Click Element By Image[이미지 매칭 클릭]    3.png
    sleep    20s
    ${windows}    Get Windows
    Switch to Window    ${windows}[0]
    타이틀 체크    //*[@class='title']    예약 완료되었습니다.

MW_국내숙소 > 호텔
    Ap.Element Visible[요소 표시 여부 체크]    //*[text()='호텔']
    Ap.Click Element[버튼 클릭]    //*[text()='호텔']
    타이틀 체크    //*[contains (@class, 'CollapsingNav_title')]    호텔/리조트

MW_PDP > RDP (모/호/게 대실포함)_호텔 임시
    sleep    1s
    Comment    모텔 대실 예약가능 여부 체크
    Ap.Click Element[버튼 클릭]    //*[text()='객실 선택하기']
    sleep    1s
    타이틀 체크    //*[contains (text(), '객실상세')]    객실상세

MW_RDP > 호/펜/게 예약
    sleep    1s
    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='객실 예약하기'])[1]
    sleep    1s
    타이틀 체크    //*[@class='css-18k5no3']    숙박 예약
    MW_RDP > 무료취소여부체크

MW_국내숙소 > 펜션
    Ap.Element Visible[요소 표시 여부 체크]    //*[text()='펜션/풀빌라']
    Ap.Click Element[버튼 클릭]    //*[text()='펜션/풀빌라']
    타이틀 체크    //*[contains (@class, 'CollapsingNav_title')]    펜션/풀빌라

MW_PDP > RDP (펜션)
    sleep    1s
    MW_펜션 예약가능 여부 체크
    sleep    2s
    타이틀 체크    //*[contains (text(), '객실상세')]    객실상세

MW_펜션 예약가능 여부 체크
    ${attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Ap.Get Element Attribute    //*[@class='css-1ux2lue' and contains (text(), '영성')]/parent::div/parent::a//*[text()='객실 선택하기']    disabled
    Run Keyword If    '${attr}' != 'true'    Ap.Click Element[버튼 클릭]    //*[@class='css-1ux2lue' and contains (text(), '영성')]/parent::div/parent::a//*[text()='객실 선택하기']

MW_국내숙소 > 게하/한옥
    Ap.Element Visible[요소 표시 여부 체크]    //*[text()='게하/한옥']
    Ap.Click Element[버튼 클릭]    //*[text()='게하/한옥']
    타이틀 체크    //*[contains (@class, 'CollapsingNav_title')]    게하/한옥

MW_국내숙소 > 선착순쿠폰
    Scroll after element check[요소 체크 후 스크롤_Webview]    //*[text()='선착순쿠폰']    500
    타이틀 체크    //*[contains (@class, 'PlaceListTitle_normal')]    테헤란로108길

MW_국내숙소 > 무한쿠폰룸
    Scroll after element check[요소 체크 후 스크롤_Webview]    //*[text()='무한쿠폰룸']    500
    타이틀 체크    //*[contains (@class, 'CollapsingNav_title')]    무한쿠폰룸

MW_홈 > 추천탭
    MW_메인 이동
    sleep    5s
    Ap.Element Visible[요소 표시 여부 체크]    xpath=(//*[text()='추천'])[1]
    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='추천'])[1]
    sleep    1s
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[text()='추천']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab
    sleep    1s

MW_월혜택모음
    Comment    Ap.Click Element[버튼 클릭]    //div[@class='QuickCategory_recommendBWrap__2mNKz']//*[contains (text(), '혜택')]
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '월') and contains (text(), '혜택')]
    sleep    1s
    타이틀 체크    //*[contains (@class, 'title')]    야놀자 혜택 모아보기

MW_홈 > 해외여행탭
    MW_메인 이동
    sleep    5s
    Ap.Element Visible[요소 표시 여부 체크]    //*[text()='해외여행']
    Ap.Click Element[버튼 클릭]    //*[text()='해외여행']
    sleep    1s
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[text()='해외여행']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab
    sleep    1s

MW_해외여행 > 여행자보험
    Ap.Click Element[버튼 클릭]    //*[text()='여행자보험']
    sleep    1s
    타이틀 체크    //*[@class='nav-tit']    해외여행보험

MW_해외여행 > 해외숙소
    Ap.Click Element[버튼 클릭]    //*[text()='해외숙소']
    sleep    1s
    타이틀 체크    xpath=(//*[contains (@class, 'title')])[1]    여행지 선택

MW_여행지 선택 > 오사카
    Ap.Click Element[버튼 클릭]    //*[text()='오사카/교토']
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    xpath=(//*[contains (@class, 'GlobalPlaceAreaListBody_countryEntry')])[1]    class
    Should Contain    ${attr}    Expanded__1nWy4
    sleep    1s
    Ap.Click Element[버튼 클릭]    //*[text()='오사카']
    sleep    5s
    타이틀 체크    //*[contains (@class, 'searchP')]    오사카

MW_해외숙소 검색결과 > PDP
    [Arguments]    ${index}
    Ap.Click Element[버튼 클릭]    xpath=(//*[@class='GlobalPlaceListSection_wrapItem__XzvR7'])[${index}]
    sleep    1s
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@class, 'GlobalPlaceDetailBody_container')]
    sleep    1s

MW_해외숙소 날짜 설정
    [Arguments]    ${days_later}
    Scroll after element check[요소 체크 후 스크롤_Webview]    xpath=(//*[contains (@class, 'CheckinOutBox')])[1]    500
    Comment    Scroll until element[요소 노출까지 스크롤&클릭_Webview]    xpath=(//*[contains (@class, 'CheckinOutBox')])[1]    300
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    날짜 선택
    Ap.Click Element[버튼 클릭]    xpath=(//div[contains(@class, 'DatePicker_calendarDaySelector__2_Ftx') and not(contains(@class, 'DatePicker_outsideRangeStyle__O4dXX'))])[${days_later}]
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '체크인 검색')]

MW_해외숙소 상세 > 예약가능날짜 체크
    FOR    ${index}    IN RANGE    10
        sleep    3s
        ${btn}    Ap.Get Text[텍스트 가져오기]    xpath=(//*[@class='RectButton_label__WcAp7'])[1]
        IF    '${btn}' == '날짜 변경하기'
        Execute script    window.scrollTo(0, 500)
        sleep    2s
        Ap.Click Element[버튼 클릭]    //*[@class='GlobalPlaceCommonUnbookableInfo_changeDateBtn__2A0ra']
        Comment    타이틀 체크    xpath=(//*[@class='PageTitle_pageTitle__Q5MEn'])[2]    날짜 선택
        타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    날짜 선택
        Ap.Click Element[버튼 클릭]    xpath=(//*[text()='체크아웃'])[2]
        Ap.Click Element[버튼 클릭]    //*[contains(text(), '체크인 검색')]
        ELSE
        Exit For Loop
    END
    END

MW_해외숙소 PDP 무료취소 가능 체크 > 예약하기 진입
    FOR    ${index1}    IN RANGE    2    5
    FOR    ${index2}    IN RANGE    99999
        ${elChk}    Run keyword and Ignore error    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@class, 'DotLoader_container__359O8')]
        Run Keyword If    '${elChk}[0]' == 'FAIL'    Exit For Loop
        sleep    3s
    END
    ${title}    Ap.Get Text[텍스트 가져오기]    xpath=(//*[contains (@class, 'GlobalPlaceDetailOptionListItem_badgeMW__Kn_L4')])[1]
    ${freeChk}    Run keyword and Ignore error    Should Contain    ${title}    무료취소
    IF    '${freeChk}[0]' == 'FAIL'
    Ap.Click Element[버튼 클릭]    //*[@alt='뒤로가기']
    sleep    1s
    MW_해외숙소 검색결과 > PDP    ${index1}
    MW_해외숙소 날짜 설정    8
    MW_해외숙소 상세 > 예약가능날짜 체크
    ELSE
    Scroll after element check[요소 체크 후 스크롤_Webview]    xpath=(//*[text()='예약하기'])[1]    500
    sleep    1s
    타이틀 체크    //*[@class='toolbar-title']    해외숙소 예약
    Exit For Loop
    END
    END

MW_해외숙소 예약(간편결제) > 예약완료
    sleep    1s
    ${payPrice}    Ap.Get Text[텍스트 가져오기]    //*[@class='sale-price']
    ${convert}    MW_문자열에서 숫자만 추출    ${payPrice}
    ${inputPrice}    Evaluate    ${convert} - 100
    Ap.InputText Element[텍스트 입력하기]    //*[contains (@placeholder, '보유')]    ${inputPrice}
    sleep    1s
    Ap.Click Element[버튼 클릭]    //*[text()='다른 결제 수단 더보기']
    Ap.Click Element[버튼 클릭]    //*[@class='pg-item-select-icon']/parent::div/*[text()='간편계좌결제']
    sleep    1s
    Ap.Click Element[버튼 클릭]    //*[text()='전체 동의']
    sleep    1s
    타이틀 체크    //*[@class='payment-amount']    100원 결제하기
    Ap.Click Element[버튼 클릭]    //*[@class='payment-amount']
    sleep    10s
    ${windows}    Get Windows
    Switch to Window    ${windows}[1]
    타이틀 체크    //*[@id='header']/h1    계좌 등록/결제
    MW_PG 결제 키패드 클릭 (해외숙소)

MW_MY야놀자 > 해외여행 통합예약
    Ap.Click Element[버튼 클릭]    //*[text()='해외 예약 내역']
    sleep    1s
    타이틀 체크    //*[contains (@class, 'toolbar-title')]    해외숙소 예약내역

MW_해외여행 예약내역 > 예약내역 상세
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'list-item--right-block')]
    sleep    3s
    타이틀 체크    xpath=(//*[contains (@class, 'toolbar-title')])[2]    예약내역 상세

MW_해외 예약내역 상세 > 예약취소 요청
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '예약취소 신청하기')]
    sleep    1s
    타이틀 체크    //*[contains (@class, 'toolbar-title')]    예약취소 하기

MW_해외 예약취소 요청 > 취소 요청하기
    sleep    2s
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'checkbox-icon-container')]
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[@class='order-cancel-action']/button    class
    ${cancelBtn}    Run keyword and Ignore error    Should Contain    ${attr}    disabled
    Run Keyword If    '${cancelBtn}[0]' == 'FAIL'    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'order-cancel-action-txt')]
    Run Keyword If    '${cancelBtn}[0]' == 'PASS'    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'checkbox-icon-container')]
    sleep    1s
    타이틀 체크    xpath=(//*[@class='modal-header'])[1]    예약을 취소하시겠어요?
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'confirm-btn-txt')]
    sleep    5s
    타이틀 체크    //*[contains (@class, 'status-text')]    예약취소가 완료되었습니다.

MW_해외숙소 취소요청 완료 > 예약내역 상세 & 취소완료 체크
    Ap.Click Element[버튼 클릭]    //*[text()='예약내역 보기']
    sleep    1s
    타이틀 체크    //*[contains (@class, 'toolbar-title')]    해외숙소 예약내역
    sleep    5s
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@class, 'empty-display')]

MW_PG 결제 키패드 클릭 (해외숙소)
    Ap.Click Element[버튼 클릭]    //*[text()='하나은행']
    sleep    2s
    타이틀 체크    //*[@id='header']/h1    결제진행
    Capture Page Screenshot    ori.png
    Click Element By Image[이미지 매칭 클릭]    1.png
    Click Element By Image[이미지 매칭 클릭]    6.png
    Click Element By Image[이미지 매칭 클릭]    0.png
    Click Element By Image[이미지 매칭 클릭]    7.png
    Click Element By Image[이미지 매칭 클릭]    2.png
    Click Element By Image[이미지 매칭 클릭]    3.png
    sleep    20s
    ${windows}    Get Windows
    Switch to Window    ${windows}[0]
    타이틀 체크    //*[contains (@class, 'status-text')]    예약이 완료 되었습니다.

MW_홈 > 즐길거리탭
    MW_메인 이동
    sleep    5s
    Ap.Element Visible[요소 표시 여부 체크]    //*[text()='즐길거리']
    Ap.Click Element[버튼 클릭]    //*[text()='즐길거리']
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[text()='즐길거리']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab
    sleep    1s

MW_즐길거리 > 레저/티켓
    Ap.Element Visible[요소 표시 여부 체크]    //*[@href='https://www.yanolja.com/leisure']
    Ap.Click Element[버튼 클릭]    //*[@href='https://www.yanolja.com/leisure']
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    레저/티켓

MW_검색 > 레저/티켓탭
    sleep    1s
    Ap.Click Element[버튼 클릭]    //*[text()='레저/티켓']
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[text()='레저/티켓']    class
    Should Contain    ${attr}    Tab_active

MW_검색 > 레저티켓 검색결과 > 상품상세 이동
    [Arguments]    ${keyword}
    sleep    3s
    Ap.InputText Element[텍스트 입력하기]    //*[contains (@type, 'search')]    ${keyword}
    Ap.Element Visible[요소 표시 여부 체크]    xpath=(//*[contains(text(), '${keyword}')])[1]
    sleep    1s
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains(text(), '${keyword}')])[1]
    sleep    2s
    타이틀 체크    //*[contains (@class, 'LeisureDetailTitle_title')]    ${keyword}

MW_검색 > 키워드 입력 후 돋보기 이동 (레저)
    [Arguments]    ${keyword}
    sleep    3s
    Ap.InputText Element[텍스트 입력하기]    //*[contains (@type, 'search')]    ${keyword}
    Ap.Element Visible[요소 표시 여부 체크]    xpath=(//*[contains(text(), '${keyword}')])[1]
    sleep    1s
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains(text(), '${keyword}')])[1]
    sleep    2s
    타이틀 체크    //*[contains (@class, 'LeisureDetailTitle_title')]    ${keyword}

MW_레저 상세 > 예약
    sleep    1s
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '상품 선택하기')]
    sleep    1s
    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='+'])[1]
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '바로 구매하기')]
    sleep    1s
    타이틀 체크    //*[contains (@class, 'left')]    예약

MW_레저티켓 장바구니 담기
    [Arguments]    ${productName}
    MW_홈 > 검색
    MW_검색 > 레저/티켓탭
    MW_검색 > 레저티켓 검색결과 > 상품상세 이동    ${productName}
    Comment    MW_검색 > 키워드 입력 후 돋보기 이동 (레저)    ${productName}
    sleep    1s
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '상품 선택하기')]
    sleep    1s
    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='+'])[1]
    MW_숙소 외 장바구니 담기

MW_숙소 외 장바구니 담기
    Ap.Click Element[버튼 클릭]    //*[text()='장바구니 담기']
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@class, 'PageTitleRightButton_cartCount')]

MW_레저 장바구니 이동
    Ap.Click Element[버튼 클릭]    //*[contains (@alt, '장바구니')]
    타이틀 체크    //*[contains (@class, 'left')]    장바구니

MW_즐길거리 > 모바일교환권
    Ap.Click Element[버튼 클릭]    //*[text()='모바일교환권']
    sleep    1s
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    모바일교환권

MW_홈 > 교통/항공탭
    MW_메인 이동
    sleep    5s
    Ap.Element Visible[요소 표시 여부 체크]    //*[text()='교통/항공']
    Ap.Click Element[버튼 클릭]    //*[text()='교통/항공']
    sleep    1s
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[text()='교통/항공']/parent::a/parent::li    id
    Should Be Equal    ${attr}    activeTab
    sleep    1s

MW_교통/항공 > 렌터카
    Ap.Click Element[버튼 클릭]    xpath=(//*[text()='렌터카'])[1]
    sleep    1s
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    렌터카

MW_렌터카 서브홈 > PDP
    ${listTitle}    Ap.Get Text[텍스트 가져오기]    xpath=(//*[contains (@class, 'LeisureListItem_title')])[1]
    sleep    2s
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains (@class, 'ExhibitionDetailDomesticLeisure_container')])[1]
    sleep    3s
    타이틀 체크    //*[contains (@class, 'LeisureDetailTitle_title')]    ${listTitle}

MW_교통/항공 > 기차
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (text(), '기차')]
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '기차')]
    sleep    1s
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    기차

MW_모텔 장바구니 담기
    MW_홈 > 검색
    Comment    MW_검색 > 국내숙소 검색결과 > PDP 이동    신규테스트 AUTO
    MW_검색 > 키워드 입력 후 돋보기 이동 (국내숙소)    신규테스트 AUTO
    MW_체크인날짜확인
    MW_PDP > RDP (모텔 숙박)
    MW_RDP > 모텔 숙박 예약
    MW_숙소 장바구니 담기
    sleep    2s

MW_기차 > 왕복탭
    Ap.Click Element[버튼 클릭]    //*[text()='왕복']
    sleep    1s
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[text()='왕복']    class
    Should Contain    ${attr}    TrainSHomeJourneyType_active__3_zJY

MW_기차 > 승차권 조건 선택 후 조회 (왕복)
    [Arguments]    ${arrival}
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'TrainSHomeStationDisplay_placeholder')]
    sleep    1s
    타이틀 체크    xpath=(//*[contains (@class, 'NavigationBarHeading_title')])[2]    도착역 선택
    Ap.InputText Element[텍스트 입력하기]    //*[contains (@class, 'TrainSHomeStationModalTitle_input_')]    ${arrival}
    Ap.Click Element[버튼 클릭]    //*[text()='${arrival}']
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'TrainSHomeBody_datePlaceholder_')]
    sleep    1s
    타이틀 체크    xpath=(//*[contains (@class, 'NavigationBarHeading_title')])[2]    날짜 선택
    Ap.Click Element[버튼 클릭]    xpath=(//div[contains(@class, 'TrainSHomeCalendarModal_calendarDaySelector__uXOSA') and not(contains(@class, 'TrainSHomeCalendarModal_outsideRangeStyle___ZYRF'))])[6]
    sleep    1s
    Ap.Click Element[버튼 클릭]    xpath=(//div[contains(@class, 'TrainSHomeCalendarModal_calendarDaySelector__uXOSA') and not(contains(@class, 'TrainSHomeCalendarModal_outsideRangeStyle___ZYRF'))])[6]
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '∙ 적용')]
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '승차권 조회')]
    sleep    1s
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    가는날 승차권 조회

MW_승차권 유무 체크 후 요금조회
    ${status}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Ap.Get WebElement    //*[text()='재시도 하기']
    Run Keyword If    '${status}[0]' == 'PASS'    Ap.Click Element[버튼 클릭]    //*[text()='재시도 하기']
    FOR    ${index}    IN RANGE    30
        ${status}    Run keyword and Ignore error    Wait Until Keyword Succeeds    9s    ${checkTime}    Ap.Get WebElement    //*[text()='요금조회']
        Run Keyword If    '${status}[0]' == 'FAIL'    Ap.Click Element[버튼 클릭]    //*[@class='TrainTicketsNavButtons_changeDate__ualU1']
        Run Keyword If    '${status}[0]' == 'FAIL'    Continue For Loop
        Run Keyword If    '${status}[0]' == 'PASS'    Ap.Click Element[버튼 클릭]    //*[text()='요금조회']
        Run Keyword If    '${status}[0]' == 'PASS'    Exit For Loop
    END

MW_바로 예매 > 오는날 승차권 조회
    Ap.Click Element[버튼 클릭]    //*[text()='바로 예매']
    Ap.Click Element[버튼 클릭]    //*[text()='확인']
    sleep    1s
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    오는날 승차권 조회

MW_바로 예매 > 선택한 승차권 장바구니 담기
    Ap.Click Element[버튼 클릭]    //*[text()='바로 예매']
    Ap.Click Element[버튼 클릭]    //*[text()='확인']
    sleep    1s
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    선택한 승차권
    Ap.Click Element[버튼 클릭]    //*[text()='장바구니 담기']
    sleep    10s
    타이틀 체크    //*[contains (@class, 'NavigationBarIconButton_count')]    2

MW_교통/항공 > 고속버스
    Ap.Element Visible[요소 표시 여부 체크]    //*[@alt='고속버스']
    Ap.Click Element[버튼 클릭]    //*[@alt='고속버스']
    sleep    1s
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    다운로드

MW_교통/항공 > 항공권
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (text(), '항공권')]
    Ap.Click Element[버튼 클릭]    //*[contains (text(), '항공권')]
    sleep    1s
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    항공권

MW_항공권 왕복 검색
    [Arguments]    ${arrival}
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains (@class, 'FlightSearchFormBody_airportCode__2a2VV')])[2]
    sleep    1s
    타이틀 체크    xpath=(//*[contains (@class, 'NavigationBarHeading_title')])[2]    도착지 선택
    Ap.InputText Element[텍스트 입력하기]    //*[contains (@name, 'search-location')]    ${arrival}
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'searchResultRow')]
    sleep    1s
    타이틀 체크    xpath=(//*[contains (@class, 'FlightSearchFormBody_airportCode')])[2]    BCN
    Ap.Click Element[버튼 클릭]    //*[contains(text(), '가는날')]
    sleep    1s
    타이틀 체크    xpath=(//*[contains (@class, 'NavigationBarHeading_title')])[2]    날짜 선택
    Ap.Click Element[버튼 클릭]    xpath=(//div[contains(@class, 'DatePicker_calendarDaySelector__2_Ftx') and not(contains(@class, 'DatePicker_outsideRangeStyle__O4dXX'))])[30]
    sleep    2s
    Ap.Click Element[버튼 클릭]    xpath=(//div[contains(@class, 'DatePicker_calendarDaySelector__2_Ftx') and not(contains(@class, 'DatePicker_outsideRangeStyle__O4dXX'))])[32]
    Ap.Click Element[버튼 클릭]    //*[contains(text(), '적용')]
    Ap.Click Element[버튼 클릭]    //*[text()='항공권 검색']
    sleep    10s
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@class, 'FlightListBody_tripContainer')]

MW_항공권 > 편도
    sleep    3s
    Ap.Click Element[버튼 클릭]    //*[text()='편도']
    sleep    1s
    ${attr}    Ap.Get Element Attribute[속성값 가져오기]    //*[text()='편도']    class
    Should Contain    ${attr}    FlightSearchFormBody_tripTypeSelected__3lVjF

MW_항공권 편도 검색
    [Arguments]    ${arrival}
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains (@class, 'FlightSearchFormBody_airportCode__2a2VV')])[2]
    sleep    1s
    타이틀 체크    xpath=(//*[contains (@class, 'NavigationBarHeading_title')])[2]    도착지 선택
    Ap.InputText Element[텍스트 입력하기]    //*[contains (@name, 'search-location')]    ${arrival}
    Ap.Click Element[버튼 클릭]    //*[contains (@class, 'searchResultRow')]
    sleep    1s
    타이틀 체크    xpath=(//*[contains (@class, 'FlightSearchFormBody_airportCode')])[2]    BCN
    Ap.Click Element[버튼 클릭]    //*[contains(text(), '가는날')]
    sleep    1s
    타이틀 체크    xpath=(//*[contains (@class, 'NavigationBarHeading_title')])[2]    날짜 선택
    Ap.Click Element[버튼 클릭]    xpath=(//div[contains(@class, 'DatePicker_calendarDaySelector__2_Ftx') and not(contains(@class, 'DatePicker_outsideRangeStyle__O4dXX'))])[30]
    Ap.Click Element[버튼 클릭]    //*[contains(text(), '적용')]
    Ap.Click Element[버튼 클릭]    //*[text()='항공권 검색']
    sleep    10s
    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@class, 'FlightListBody_tripContainer')]

MW_MY야놀자 > 알림함
    Ap.Click Element[버튼 클릭]    //*[@class='Icon_icon__2BP_o']
    sleep    1s
    타이틀 체크    //*[contains (@class, 'NavigationBarHeading_title')]    알림

MW_기차 장바구니 이동
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains (@class, 'Icon_icon__2BP_o')])[3]
    타이틀 체크    //*[contains (@class, 'left')]    장바구니

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

1회차 Fail건 재확인_LIVE
    [Arguments]    ${case_no}
    ${status}    Run Keyword If    "${TEST_PHASE}"=="2"    결과 값 가져오기_LIVE    ${case_no}
    Pass Execution If    "${status}" == "Pass"    2회차 수행으로 PASS 처리

결과 값 가져오기_LIVE
    [Arguments]    ${case_no}
    ${status}    Set Variable    ${EMPTY}
    sleep    1s
    ${cell}    Evaluate    ${case_no} + 14
    ${status}    Google.Get Value On Cell    ${GoogleDrive_URL_StageBasic}    ${WORKSHEET_StageBasic}    ${GoogleColumn}${cell}
    [Return]    ${status}
