# 1 Проверка кодировки
# Напишите программу, которая принимает от пользователя один символ,
# и выводит его код в таблице Unicode
# и его принадлежность к диапазону ASCII (True/False).
# Пример вывода:
# Введите символ: A
# Код Unicode: 65
# ASCII символ: True

a = input("Enter a character: ")
b = ord(a)  # Получаем Unicode-код символа
print("Unicode code:", b)

if b > 127:
    print("ASCII character: False")
else:
    print("ASCII character: True")


# 2 Подстрока с заполнением
# Напишите программу, которая принимает строку и индексы начала и конца.
# Программа должна вывести подстроку на указанных позициях.
# Также если конечный индекс выходит за пределы строки,
# программа заполняет недостающие символы символами _.
# Пример вывода:
# Введите строку: Программирование
# Введите начальный индекс: 3
# Введите конечный индекс: 20
# Подстрока: граммирование_____


text = input("Enter a string: ")
start = int(input("Enter start index: "))
end = int(input("Enter end index: "))
lenght = len(text)    # узнаем длинну строки
superfluous = (end - len(text))  # отнимаем ее от заданного конечного индекса
print("Substring: ",text[start :] + "_" * superfluous) # заменяем их на "_" и выводим


# 3 Подсчёт символа
# Напишите программу, которая принимает строку и символ,
# а затем подсчитывает,
# сколько раз символ встречается в строке.
# Пример вывода:
# Введите строку: Hello, world!
# Введите символ: o
# Символ o встречается 2 раз(а).

text = input("Enter a string: ")     #("Введите строку: ")
char = input("Enter a character: ")  #("Введите символ: ")
count = text.count(char)  # Подсчёт вхождений
print("The character", "'",char,"'", "appears", count, "time(s).")

# 4 Инвертирование строки без цифр
# Напишите программу,
# которая принимает строку и выводит её в обратном порядке, пропуская все цифры.
# Пример вывода:
# Введите строку: n52uFs6Inoh67ty8P
# Результат: PythonIsFun


user_input = input("Enter a string: ")
revers = user_input[::-1]  #переворачиваем
output = ""
digits = "0123456789"

index = 0

while index < len(revers):
    if revers[index] not in digits:
        output += revers[index]
    index += 1                   #убираем цыфры

print("Result: ", output)