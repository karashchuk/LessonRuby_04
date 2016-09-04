# 2. Моделирование реальности
#
# Подумайте над любой задачей из реального мира, определите сущность из этой задачи и опишите её с помощью класса. Желательно чтобы в классе было:
#
#     Метод-конструктор initialize
#
#     Переменные экземпляра
#
#     Способность обращаться к переменным экземпляра за пределами области видимости объекта
#
#     Метод to_s который будет переопределять такой же метод из класса Object и представлять ваш объект в строковом виде.
#Например, вы можете вывести словесное название объекта и его переменные экземпляра
#
#     Пара методов, реализующих какое-либо поведение объекта

class Phone
  attr_reader :model, :memory, :accumulator, :energy

  def initialize(model:, memory: 2, accumulator: 2000, energy: 100) #память в Gb,аккумулятор в mAh, энергия в процентах
    @model = model
    @memory = memory #память в Gb
    @accumulator = accumulator #аккумулятор в mAh
    @energy = energy #энергия в процентах
    @video = 10.0 #-можно смотреть столько часов видео
    @call = 20.0 # - столько часов можно разговаривать по телефону
    @chec = nil
  end

  def to_s
    "Phone: \"#{@model}\" - #{@memory}Gb - #{@accumulator}mAh"
  end

  def calculate(time:, duration:)
    myenergy = time*100.0/duration
    if @energy < myenergy
      @energy = 0
      @check = "You can not use for this time! Left #{@energy}%"
    else
      @energy = @energy - myenergy
    end
  end

  # def look_video(time:) # time in hour
  #   calculate(time:time, duration: @video)
  #   p "looking #{time} hours. Left #{@energy}%"
  # end
  #
  # def call(time:) # time in hour
  #   calculate(time:time, duration: @call)
  #   p "calling #{time} hours. Left #{@energy}%"
  # end

  def using (time:, use:)
    case use
    when "call"
      calculate(time:time, duration: @call)
    when "look"
      calculate(time:time, duration: @video)
    else
      @check = "There are not using - #{use}!"
    end
    unless @check
      p "#{use} - #{time} hours. Left #{@energy}%"
    else
      p @check
      @check = nil
    end
  end

  def charge(time:) # Время зарядки в часах, полная зарядка происходит за 4 часа.
    myenergy = time*100/4
    @energy +=myenergy
    if @energy > 100
      @energy = 100
    end
    p "Charging #{time} hours. Energy = #{@energy}%"
  end
end
myphone = Phone.new(model:'Samsung')
puts myphone
# myphone.look_video(time: 6)
# myphone.call(time:6)
myphone.using(time:3,use: "call")
myphone.charge(time: 12)
myphone.using(time:3,use: "call")
myphone.using(time:4,use: "look")
myphone.using(time:10,use: "call")
myphone.using(time:10,use: "hear")
myphone.using(time:2,use: "call")
myphone.charge(time: 3)
myphone.using(time:3,use: "call")
myphone.using(time:3,use: "call")
#
