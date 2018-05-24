import sys
from PySide.QtCore import *
from PySide.QtGui import *
from PySide.QtWebKit import *

class Browser(QWidget):

	def __init__(self):
		super(Browser, self).__init__()

		self.webview = QWebView(self)
		self.webview.load("https://www.baidu.com/")
		self.setGeometry(0, 0, 800, 600)

		self.menu_bar = QHBoxLayout()
		self.main_layout = QVBoxLayout()
		self.main_layout.addLayout(self.menu_bar)
		self.main_layout.addWidget(self.webview)
		self.setLayout(self.main_layout)


class BrowserWindow(QMainWindow):
	def __init__(self):
		super(BrowserWindow, self).__init__()
		self.widget = Browser()
		self.setCentralWidget(self.widget)


app = QApplication(sys.argv)
window = BrowserWindow()
window.show()

app.exec_()
sys.exit()