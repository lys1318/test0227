*** Settings ***
Suite Teardown    MW_Suite Teardown
Resource          common.robot

*** Test Cases ***
01.앱 접근 권한_신규설치
    앱 실행
    ${title}    Ap.Get Text[텍스트 가져오기]    //*[contains (@resource-id, 'tvTitle')]
    Should Contain    ${title}    앱 접근 권한 안내
    Ap.Click Element[버튼 클릭]    //*[contains (@text, '확인')]

02.앱 접근 권한_재실행
    Comment    앱 재실행
    Comment    ${auth}    Run keyword and Ignore error    Ap.Element Visible[요소 표시 여부 체크]    //*[contains (@resource-id, 'tvTitle')]
    Comment    Run Keyword If    '${auth}[0]' == 'FAIL'    앱 사용 동의
    Comment    Run Keyword If    '${auth}[0]' == 'PASS'    Fail    2번 앱 접근 권한_재실행 케이스 실패
    앱 사용 동의

03.로그인 화면 이동
    APP_홈 > My 야놀자
    APP_My 야놀자 > 로그인 화면

04.로그인 완료
    APP_로그인 하기

숙소 이동 테스트
    Ap.Click Element[버튼 클릭]    //*[contains (@resource-id, 'btnHomeToYa')]
    Ap.Click Element[버튼 클릭]    //*[contains (@resource-id, 'tvSearch')]
    Ap.InputText Element[텍스트 입력하기]    //*[contains (@resource-id, 'editContent')]    QA정지훈DILOG자동화
    Ap.Click Element[버튼 클릭]    //*[contains (@resource-id, 'text1') and @text='QA정지훈DILOG자동화']
    context 전환
    MW_PDP 튜토리얼 체크
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains (text(), '객실 선택하기')])[1]
    sleep    3s
    ${windows}    Get Windows
    Switch to Window    ${windows}[1]
    Ap.Click Element[버튼 클릭]    xpath=(//*[contains (text(), '객실 예약하기')])[1]
    sleep    2s
    Ap.Click Element[버튼 클릭]    xpath=(//*[@class='css-ihwtry'])[1]
    Ap.Click Element[버튼 클릭]    //*[text()='바로 예약']
    Ap.Click Element[버튼 클릭]    //*[@data-testid='popup-button']
    sleep    3s
    ${windows}    Get Windows
    Switch to Window    ${windows}[2]
    타이틀 체크    //*[contains (@class, 'left')]    예약

*** Keywords ***
