import pyautogui
import time

def find_target(img_file, timeout=30):
    start = time.time()
    target = None
    while target is None:
        target = pyautogui.locateCenterOnScreen(img_file, confidence=0.935)
        end = time.time()
        if end - start > timeout:
            break
    return target

def image_click(img_file, timeout=30):
    target = find_target(img_file, timeout)
    if target:
        pyautogui.click(target[0]/2, target[1]/2, clicks=1, button='left')
    else:
        print(f"Target not found ({img_file})")

def image_moveTo(img_file, timeout=30):
    target = find_target(img_file, timeout)
    if target:
        pyautogui.moveTo(target[0]/2, target[1]/2)
    else:
        print(f"Target not found ({img_file})")

def mouse_scroll():
    pyautogui.scroll(-1000)