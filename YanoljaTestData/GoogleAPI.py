import gspread
from oauth2client.service_account import ServiceAccountCredentials
import logging as log
import os
from datetime import datetime, timedelta


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

	def get_value_on_cell(self, url, worksheet, cell):
		"""
		| url | 스프레드 시트 URL 주소 |
		| worksheet | 시트 명 |
		| cell | A1, A2 와 같은 Cell 위치 값 |
		"""
		self.setup()
		doc = gc.open_by_url(url)
		worksheet = doc.worksheet(worksheet)

		# return worksheet.get(cell)[0][0]
		return worksheet.acell(cell).value

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

		log.info(worksheet.update_acell(cell, str(value)))


	def batch_update(self, url, worksheet, update_range, *update_value):
		self.setup()
		doc = gc.open_by_url(url)
		worksheet = doc.worksheet(worksheet)

		update_value = list(update_value)
		print("TEST")
		print(update_value)
		print("TEST")
		update_value.insert(5, '')
		update_value.insert(6, '')
		update_value.insert(7, '')
		update_value.insert(10, '')
		update_value.insert(11, '')
		update_value[12] = str(update_value[12])
		#update_value[7] = str(update_value[7])
		#update_value.insert(14, ' ')
		update_value = [update_value]
		print(update_value)
		log.info(worksheet.batch_update([{
				'range'		: update_range,
				'values'	: update_value
			}]))
		print(worksheet.batch_update([{
				'range'		: update_range,
				'values'	: update_value
			}]))	



	def empty_batch_update(self, url, worksheet, update_range, count):
		self.setup()
		doc = gc.open_by_url(url)
		worksheet = doc.worksheet(worksheet)

		update_value = list()
		for i in range(0, int(count)):
			update_value.insert(i, [''])
		#update_value = [update_value]
		print(update_value)

		print(worksheet.batch_update([{
				'range'		: update_range,
				'values'	: update_value
			}]))	



	def create_file(self, file_name, folder_id=None):
		self.setup()
		gs = gc.create(file_name, folder_id)

		return gs


	def create_sheet(self, url, sheet_name):
		self.setup()
		doc = gc.open_by_url(url)
		sheet = doc.add_worksheet(title=sheet_name, rows='1', cols='1')

		return sheet


	def copy_file(self, file_name, file_id, folder_id=None):
		self.setup()
		sh = gc.copy(file_id=file_id, folder_id=folder_id, title=file_name)

		return sh.url


	# 주차 수 구하기 TEMP
	def get_date(self, y, m, d):
	  '''y: year(4 digits)
	   m: month(2 digits)
	   d: day(2 digits'''
	  s = f'{y:04d}-{m:02d}-{d:02d}'
	  return datetime.strptime(s, '%Y-%m-%d')


	def get_week_no(self, y, m, d):
	    target = self.get_date(y, m, d)
	    firstday = target.replace(day=1)
	    if firstday.weekday() == 6:
	        origin = firstday
	    elif firstday.weekday() < 3:
	        origin = firstday - timedelta(days=firstday.weekday() + 1)
	    else:
	        origin = firstday + timedelta(days=6-firstday.weekday())
	    return (target - origin).days // 7 + 1


	def copy_sheet_TEMP(self, destination_sheet_name, url):
		self.setup()
		doc = gc.open_by_url(url)
		# 만약 있을 시 그냥 리턴
		for index in doc.worksheets():
			if index.title == destination_sheet_name:
				return "동일한 시트가 이미 있음"
		template = doc.get_worksheet(1)
		copy_template = doc.duplicate_sheet(source_sheet_id=template.id)
		copy_template.update_title(title=destination_sheet_name)
		copy_template.update_index(len(doc.worksheets()))


	def update_sheet_TEMP(self, destination_sheet_name, url):
		self.setup()
		doc = gc.open_by_url(url)
		# 만약 있을 시 그냥 리턴
		for index in doc.worksheets():
			if index.title == destination_sheet_name:
				return "동일한 시트가 이미 있음"
		template = doc.get_worksheet(1)
		#copy_template = doc.duplicate_sheet(source_sheet_id=template.id)
		template.update_title(title=destination_sheet_name)
		#template.update_index(len(doc.worksheets()))






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