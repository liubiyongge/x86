##实验数据处理代码

#求平均值
data = input("请输入一组数据，用空格隔开\n")#输入数据字符形式
data = data.split()#按空格分开
sum = 0#求和
for i in range(len(data)):
	sum = sum + float(data[i])
average = sum/len(data)#平均值

#求标准差
sumq = 0#记录总和
for i in range(len(data)):
	sumq = sumq + (float(data[i]) - average)**2
aveq = sumq/(len(data) - 1)
theta = aveq**0.5#标准差
print(theta)
#A类不确定度theta/x
