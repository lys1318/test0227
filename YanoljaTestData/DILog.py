import requests, json
import time
from datetime import datetime
import logging as log
# import pages.device as device
from time import sleep
from bs4 import BeautifulSoup
from collections import OrderedDict
log.basicConfig(level=log.INFO)


class DILog():

    LOG_SERVER_WAIT_TIME = 7

    # defining the api-endpoint
    endPointLog = "https://dilog-api.di.yanolja.in/api/qa/logs"
    endPointLogDevice = "https://dilog-api.di.yanolja.in/api/find/device?service=YanoljaCX"

    # def getAdid(self):

    #     sleep(Log.LOG_SERVER_WAIT_TIME)
    #     deviceName = device.getDeviceName()
    #     response = requests.get(Log.endPointLogDevice).json()

    #     #Set Filter deviceName
    #     response = list(filter(lambda x:x["deviceName"]==deviceName, response))
    #     if response is None:
    #         return False

    #     log.info("Google ADID: %s \t" % response[0]["adid"])


    def getLogPageNameEventType(self, pageName, eventType, date, desc=None, count=1, adid=None):
        """
        | pageName | 접근 페이지 명 | ( MotelHome, LiveCommerceHome 등 ) |
        | eventType | 이벤트 타입 | ( click, view 등 ) |
        | date | 시간 | 테스트 수행 전 시간 값을 인자로 받음 |
        | dese | 설명 | pageName, eventType 이 같은 경우 구별을 위해 선택 값으로 받음 |
        """
        
        # if testmode == 'iOS':
        #     params = {  'key': 'adid',
        #     # iPhone 13 Pro Simulator
        #     'value': 'idfv_B3E2B397-CB0E-4169-AAFE-C78C11B44B41',
        #     'osName': 'iOS',
        #     'service': 'YanoljaCX'}
        
        # elif testmode == 'iOS_REAL':
        #     params = {  'key': 'adid',
        #     # iPhone 11 Pro Max
        #     'value': 'idfv_5DD42063-75D8-4551-872F-CD541C9F72E7',
        #     'osName': 'iOS',
        #     'service': 'YanoljaCX'}

        # elif testmode == 'web':
        #     params = {  'key': 'cgntId',
        #     # iPhone 13 Pro Simulator
        #     'value': 'idfv_B3E2B397-CB0E-4169-AAFE-C78C11B44B41',
        #     'osName': 'web',
        #     'service': 'YanoljaCX'}

        # else:
        #     params = {  'key': 'adid',
        #     # iPhone 13 Pro Simulator
        #     'value': 'idfv_B3E2B397-CB0E-4169-AAFE-C78C11B44B41',
        #     'osName': 'iOS',
        #     'service': 'YanoljaCX'}

        if adid == '':
            params = {  'key': 'adid',
            # iPhone 11 Pro Max
            'value': 'idfv_5DD42063-75D8-4551-872F-CD541C9F72E7',
            'osName': 'iOS',
            'service': 'YanoljaCX' }

        elif 'ap-northeast' in adid:
            params = {  'key': 'cgntId',
            # iPhone 11 Pro Max
            'value': adid,
            'osName': 'web',
            'service': 'YanoljaCX' }

        else:
            params = {  'key': 'adid',
            # iPhone 11 Pro Max
            'value': adid,
            'osName': 'iOS',
            'service': 'YanoljaCX' }

        log.info('DILog Search Start')
        log.info(params)
        date_timestamp = int(datetime.strptime(date, '%Y-%m-%d %H:%M:%S.%f').timestamp())
        log.info(date_timestamp)
        sleep(DILog.LOG_SERVER_WAIT_TIME)

        response = None
        response = requests.get(DILog.endPointLog, params).json()

        # testTs = DILog.getNowTs() - DILog.LOG_SERVER_WAIT_TIME
        # log.info(testTs)

        response = list(filter(lambda x:int(str(x["raw"]["system"]["createdTs"])[:-3]) > date_timestamp, response))
        #log.info(response)
        if not response:
            message = "Not Found Log - 테스트 시작 시간인 " + str(date) + " 이후의 로그가 없습니다."
            log.error(message)
            return False, message

        #Set Filter pageName
        response = list(filter(lambda x:x["raw"]["pageName"]==pageName, response))
        if not response:
            message = "Not Found Log with pageName : " + str(response)
            log.error(message)
            #log.info(response)
            return False, message

        #Set Filter eventType
        response = list(filter(lambda x:x["raw"]["eventType"]==eventType, response))
        if not response:
            message = "Not Found Log with eventType : " + str(response)
            log.error(message)
            #log.info(response)
            return False, message
        else:
            if desc != '':
                log.info('desc is not none')
                log.info(desc)
                log.info('response')
                log.info(response)

                #response = list(filter(lambda x:x["def"]["desc"]==desc, response))
                response = list(filter(lambda x:x.get("def", {}).get("desc", None)==desc, response))

                if not response:
                    message = "Not Found Log with desc : " + str(response)  
                    log.error(message)
                    #log.info(response)
                    return False, message


            log.info(response)
            response_dict = response[0]['def']
            response_dict2 = response[0]["raw"]["raw"]
            response_isValid = response[0]['isValid']
            create_time = str(datetime.fromtimestamp(response[0]['raw']['system']['createdTs']/1000))
            if 'ap-northeast' in adid:
                #log.info("Yanolja APP Version :" + response[0]['raw']['system']['appVersion'])
                #log.info("OS Name : " + response[0]['raw']['system']['osName'])
                log.info("로그 기록 시간 : " + create_time)
                
                response_dict["time"] = create_time 
                #response_dict["app_ver"] = response[0]['raw']['system']['appVersion']
                response_dict["app_ver"] = 'web'
                response_dict["os_name"] = 'web'                           
                log.info(response_dict)
            else:
                log.info("Yanolja APP Version :" + response[0]['raw']['system']['appVersion'])
                log.info("OS Name : " + response[0]['raw']['system']['osName'])
                log.info("로그 기록 시간 : " + create_time)
                
                response_dict["time"] = create_time 
                response_dict["app_ver"] = response[0]['raw']['system']['appVersion']
                response_dict["os_name"] = response[0]['raw']['system']['osName']                            
                log.info(response_dict)

            
            #log.info(response_dict2)
            #log.info(type(response_dict2))
            #log.info(type(response_dict))
            # datetime.fromtimestamp(response_dict2['createdTs'])
            # response_ = BeautifulSoup(response[0]["raw"]["raw"], 'html.parser')
            # response2 = BeautifulSoup(response[0]["def"], 'html.parser')
            
            log.info('response count = ' + str(len(response))) 

        
            if len(response) != count:
                message = "로그 기록 결과가 " + str(count) + "개 여야 하는데, " + str(len(response)) + "개 입니다. : " + str(response)
                log.error(message)
                log.info(response)

                return False, message
            elif response_isValid != True:
                message = "로그 기록 결과가 " + str(count) + "만큼 기록 되었으나 isValid 가 False 입니다."
                log.error(message)
                log.info(response)

                return False, message

            return True, response_dict


    def getNowTs():
        nowTs = datetime.now().timestamp()
        log.info("Current Test Time: %s \t" % datetime.fromtimestamp(int(nowTs)))
        return int(nowTs)