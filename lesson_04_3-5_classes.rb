# 3. Дополнительное поведение класса Point
#
#     Добавьте метод similar_quarter? для проверки того, лежат ли обе точки в одной четверти координатной плоскости. Метод должен возвращать true или false
#
#     Метод проверяющий лежит ли точка в начале координат
#
#     Метод, устанавливающий точку в начало координат
#
#     Метод + для сложения двух объектов класса Point
class Point

  attr_accessor :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  include Comparable

  def to_s
    "Point: (#{@x}; #{@y})"
  end

  def similar_quarter?(point)
    if @x*point.x > 0 && @y*point.y > 0
      true
    else
      false
    end
  end

  def zero?
    if @x==0 && @y==0
      true
    else
      false
    end
  end

  def zero!
    @x=0
    @y=0
  end

  def +(point)
    Point.new(@x + point.x, @y + point.y)
  end

  def <=> point
    if point.class==Point
      p1 = @x**2 + @y**2
      p2 = point.x**2 + point.y**2
      if p1 == p2
        0
      elsif p1 < p2
        -1
      else
        1
      end
    else
      nil
    end
  end



end
p1 = Point.new(-1,-2)
p2 = Point.new(-2,-1)
puts p1,p2
p p1.similar_quarter?(p2)
p p1.zero?
p3 = p1 + p2
puts p3
p3.zero!
puts p3
#
# 4. Методы сравнения для класса Point
#
# Подмешайт е в класс Point модуль Comparable для получения методов сравнения.
# Чтобы получить возможность сравнивать объекты класса Point на основе их расстояния от начала координат,
# в классе Point необходимо определить метод <=>. Он должен возвращать -1, если первая точка ближе к началу координат,
# чем вторая, 1 – если она дальше и 0 – если расстояние от начала координат до каждой из точек одинаково.
#
# Метод <=> также должен возвращать nil, если аргумент не является объектом класса Point.
#
# Затем просто подключите модуль Comparable, и вы получите методы сравнения. Это позволит вычислить такое выражение:
#
# class Point
#
#   include Comparable
#
#   def initialize x:, y:
#     @x = x
#     @y = y
#   end
#
#   def <=> other_point
#     # TODO: Заставь меня работать!
#   end
#
# end

# Изменения кода смотри выше
p Point.new(1,2) < Point.new(3,4) # => true
p Point.new(1,2) > Point.new(3,4) # => false
p Point.new(1,2) == Point.new(2,1) # => true
#


# 5. Вычисление площади и периметра
#
# Напишите класс Rectangle для вычисления периметра и площади прямоугольника.
#
# Класс Rectangle должен реализовывать 2 метода: Rectangle#area и Rectangle#perimeter — для вычисления площади и периметра соответственно.
#
# Rectangle::new принимает 2 аргумента, каждый из которых — экземпляр класса Point. Таким образом, прямоугольник задаётся двумя вершинами (левая верхняя и правая нижняя).
#
class Rectangle

  def initialize start_point, end_point
    @start_point = start_point
    @end_point   = end_point
    @length = @end_point.x - @start_point.x
    @width = @end_point.y - @start_point.y
  end

  def area
    @length*@width
  end

  def perimeter
    (@length + @width)*2
  end

end

ground = Rectangle.new(Point.new(1,1), Point.new(10, 10))

p "Area = #{ground.area}"
p "Perimeter = #{ground.perimeter}"
