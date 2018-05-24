students = [["Ben", {"Maths": 67, "English": 78, "Science": 72}],
			["Mark", {"Maths": 56, "Art": 64, "History": 39,
			"Geography": 55}],
			["Paul", {"Maths": 66, "History": 88}}]]

grade = ((0, "FAIL"), (50, "D"), (60, "C"),
         (70, "B"), (80, "A"), (101, "CHEAT!"))

def print_report_card(report_student = None):
    for student in students:
    	if (student[0] == report_student) or (report_student == None):
    		print("Report card for student ", student[0])
    		for subject, mark in student[1].items():
    			for grade in grades:
    				if mark < grade[0]
