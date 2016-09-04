# 1. Методы Ruby Std-lib API
#

# Для модуля Base64:
#
#     Методы модуля для кодирования/декодирования строки в base64

require "Base64"
string_origin = "Hello! How are you?"
string64code=Base64.encode64(string_origin)
p string64code
p Base64.decode64(string64code)



#
# Для модуля Benchmark:
#
#     Метод модуля, принимающий блок и вычисляющий время его выполнения

require 'Benchmark'
def example(n)
  arr = 0
  for i in (1..n)
    arr = i**i
  end
  arr
end
puts Benchmark.measure {example(5000)}

#
# Для модуля Find:
#
#     Метод модуля для рекурсивного обхода дерева каталогов относительно имени заданного каталога
#(передаётся в качестве аргумента)
require 'find'
Find.find("D:/Programming/Ruby/code") {|path| p path if FileTest.directory?(path)}
#
# Для класса Digest::MD5:
#
#     Метод класса, вычисляющий md5 хэш от строки
require 'digest'
p Digest::MD5.file('D:/Programming/Ruby/code/test.txt').hexdigest

#
# Для модуля Timeout:
#
#     Метод модуля, выкидывающий исключение, если код исполняемый в блоке вычисляется более N секунд
require 'timeout'
status = Timeout::timeout(1) {
  example(10000)
}
