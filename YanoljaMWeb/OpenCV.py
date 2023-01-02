import cv2 as cv
import numpy as np
import logging as log


class OpenCV():
	
	def setup(self):
		print(1)

	def get_image(self, ori, template, result_path, add):
		"""
		| url | 스프레드 시트 URL 주소 |
		| worksheet | 시트 명 |
		| cell | A1, A2 와 같은 Cell 위치 값 |
		"""
		log.info(ori)
		log.info(template)
		log.info(result_path)

		image = cv.imread(ori)
		image_gray = cv.cvtColor(image, cv.COLOR_BGR2GRAY)
		template = cv.imread(template, 0)
		temp_image = cv.imread(ori, 0)
		w1, h1 = temp_image.shape[::-1]
		log.info(w1)
		log.info(h1)
		w, h = template.shape[::-1]

		result = cv.matchTemplate(image_gray, template, cv.TM_CCOEFF_NORMED)
		min_val, max_val, min_loc, max_loc = cv.minMaxLoc(result)

		startX, startY = max_loc # 만약 cv.TM_SQDIFF 혹은 cv.TM_SQDIFF_NORMED를 사용했을경우 최솟값을 사용해야한다.
		endX, endY = startX + w, startY + h
		cv.rectangle(image, (startX, startY), (endX, endY), (0,0,255), 1)

		cv.imwrite(result_path, image)

		#x = ((startX/2) + (endX/2)) / 2
		#y = ((startY/2) + (endY/2)) / 2
		x = ((startX/2) + (endX/2))
		y = ((startY/2) + (endY/2)) + add

		return x, y

	def get_image_six(self, ori, template, result_path):
		img = cv.imread(ori,0)
		img2 = img.copy()
		template = cv.imread(template,0)
		w, h = template.shape[::-1]


		# All the 6 methods for comparison in a list
		methods = ['cv.TM_CCOEFF', 'cv.TM_CCOEFF_NORMED', 'cv.TM_CCORR',
		            'cv.TM_CCORR_NORMED', 'cv.TM_SQDIFF', 'cv.TM_SQDIFF_NORMED']
		i = 0
		for meth in methods:
		    i = i+1
		    img = img2.copy()
		    method = eval(meth)


		    # Apply template Matching
		    res = cv.matchTemplate(img,template,method)
		    min_val, max_val, min_loc, max_loc = cv.minMaxLoc(res)
		    # If the method is TM_SQDIFF or TM_SQDIFF_NORMED, take minimum
		    if method in [cv.TM_SQDIFF, cv.TM_SQDIFF_NORMED]:
		        top_left = min_loc
		    else:
		        top_left = max_loc



		    bottom_right = (top_left[0] + w, top_left[1] + h)
		    cv.rectangle(img,top_left, bottom_right, 255, 2)

		    # temp
		    cv.imwrite(result_path + str(i) + '.png', img)

		    # plt.subplot(121),plt.imshow(res,cmap = 'gray')
		    # plt.title('Matching Result'), plt.xticks([]), plt.yticks([])
		    # plt.subplot(122),plt.imshow(img,cmap = 'gray')
		    # plt.title('Detected Point'), plt.xticks([]), plt.yticks([])
		    # plt.suptitle(meth)
		    # plt.show()