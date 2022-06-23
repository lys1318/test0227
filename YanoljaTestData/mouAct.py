from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
# import time

driver = webdriver.Chrome('/Users/youngsung.lee/Desktop/pythonWorkspace/테스트프로젝트/chromedriver')
action = ActionChains(driver)

def find_element(self, element, timeout=30):
    location = WebDriverWait(self.driver, timeout).until(EC.presence_of_element_located((By.XPATH, element)))
    action.move_to_element(location).perform()