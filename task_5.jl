#= Задача 5
Дано: Робот - в произвольной клетке ограниченного прямоугольного поля, на котором могут находиться также внутренние прямоугольные 
перегородки (все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки)
Результат: Робот - в исходном положении и в углах поля стоят маркеры =#

using HorizonSideRobots
r = Robot(animate=true)


function mark_angles(r)
    num_steps=[]
    while isborder(r,Sud)==false || isborder(r,West) == false 
        push!(num_steps, moves!(r, West))
        push!(num_steps, moves!(r, Sud))
    end
    for side in (Nord,Ost,Sud,West)
        movements!(r,side)
        putmarker!(r)
    end





    for (i,n) in enumerate(num_steps) 
        side = isodd(i) ? Ost : Nord 
        movements!(r,side,n)
    end
end








