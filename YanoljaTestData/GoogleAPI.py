import gspread
from oauth2client.service_account import ServiceAccountCredentials
import logging as log
import os


class GoogleAPI():
	
	def setup(self):
		scope = ['https://spreadsheets.google.com/feeds','https://www.googleapis.com/auth/drive']
		
		path = os.path.dirname(os.path.abspath(__file__))
		log.info(path)

		json_file_name = path + '/logtest-331607-87761eaa4a67.json'
		credentials = ServiceAccountCredentials.from_json_keyfile_name(json_file_name, scope)
		global gc
		gc = gspread.authorize(credentials)
		# spreadsheet_url = 'https://docs.google.com/spreadsheets/d/1trh7Lt8apTJPo-RsXNtspcfj2VZF5gjWfBYm2EyXnlU/edit#gid=1492031789'
		# doc = gc.open_by_url(url)
		# worksheet = doc.worksheet('LogAutoTEST')	
		# row_data = worksheet.row_values(14)
		# print(row_data)

	def write_value_on_cell(self, url, worksheet, cell, value):
		"""
		| url | 스프레드 시트 URL 주소 |
		| worksheet | 시트 명 |
		| cell | A1, A2 와 같은 Cell 위치 값 |
		| value | 입력할 값 |
		"""
		self.setup()
		doc = gc.open_by_url(url)
		worksheet = doc.worksheet(worksheet)

		log.info(worksheet.update_acell(cell, value))


	def batch_update(self, url, worksheet, update_range, *update_value):
		self.setup()
		doc = gc.open_by_url(url)
		worksheet = doc.worksheet(worksheet)

		update_value = list(update_value)
		update_value.insert(5, '')
		update_value.insert(6, '')
		update_value.insert(7, '')
		update_value.insert(9, '')
		update_value.insert(11, 'N/A')
		update_value.insert(12, 'N/A')
		update_value[13] = str(update_value[13])
		update_value.insert(14, ' ')
		update_value = [update_value]
		log.info(worksheet.batch_update([{
				'range'		: update_range,
				'values'	: update_value
			}]))	



# 아래 사용 안함
	# def insert_value_on_row(self, url, worksheet, row, *args):
	# 	self.setup()
	# 	doc = gc.open_by_url(url)
	# 	worksheet = doc.worksheet(worksheet)

	# 	args = list(args)
	# 	args.insert(0, '')
	# 	log.info(worksheet.insert_row(args, row))


	# def update_value_on_row(self, url, worksheet, range_name, *args):
	# 	self.setup()
	# 	doc = gc.open_by_url(url)
	# 	worksheet = doc.worksheet(worksheet)

	# 	args = list(args)
	# 	args.insert(0, '')
	# 	log.info(worksheet.update(range_name, args))
