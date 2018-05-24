import turtle
import time
caught = False
score = 0
boxsize = 200

def up():
    mouse.forward(10)
    checkbound()


def left():
    mouse.left(45)


def right():
    mouse.right(45)


def back():
    mouse.backward(10)
    checkbound()


def qiutTurtles():
    window.bye()


def checkbound():
    global boxsize
    if int(float(mouse.xcor())) > boxsize:
        mouse.goto(boxsize, mouse.ycor())
    if int(float(mouse.xcor())) < -boxsize:
        mouse.goto(-boxsize, mouse.ycor())
    if int(float(mouse.ycor())) > boxsize:
        mouse.goto(mouse.xcor(), boxsize)
    if int(float(mouse.ycor())) < -boxsize:
        mouse.goto(mouse.xcor(), -boxsize)


window = turtle.Screen()#set up screen
mouse = turtle.Turtle()
cat = turtle.Turtle()
mouse.penup()
mouse.penup()
mouse.goto(100,100)

window.onkeypress(up, "Up")
window.onkeypress(left, "Left")
window.onkeypress(right, "Right")
window.onkeypress(back, "Down")
window.onkeypress(qiutTurtles, "Escape")
difficulty = window.numinput("Difficulty",
"Enter a difficulty from easy(1), for hard(5)",
minval=1, maxval=5)
window.listen()

while not caught:
    cat.setheading(cat.towards(mouse))
    cat.forward(8+difficulty)
    score = score + 1
    if cat.distance(mouse) < 5:
        caught = True
    time.sleep(0.2 - (0.01*difficulty))
window.textinput("GAME OVER", "Well done, You scored:" + str(score*difficulty))
window.bye()