import turtle
window = turtle.Screen()
point = turtle.Turtle()
point.color("green", "black")
point.left(90)
point.forward(100)
point.right(90)
point.color("black", "black")
point.begin_fill()
point.circle(10)
point.end_fill()
for i in range(1,24):
    if point.color() == ("red", "black"):
        point.color("orange", "black")
    elif point.color() == ("orange", "black"):
        point.color("yellow", "black")
    else:
        point.color("red", "black")
    point.left(15)
    point.forward(50)
    point.left(157)
    point.forward(50)
window.exitonclick()