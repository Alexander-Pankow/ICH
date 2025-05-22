#  1 Звёздочки вместо чисел
# Напишите программу, которая заменяет все цифры в строке на звёздочки *.
# text = "My number is 123-456-789"
# Пример вывода:
# Строка: My number is 123-456-789
# Результат: My number is ***-***-***

text = "My number is 123-456-789"
digits = "0123456789"
result = ""
index = 0

while index < len(text):
    if text[index] in digits:
        result += "*"
    else:
        result += text[index]
    index += 1
print("String: ", text)
print("Result: ", result)


#  2 Количество символов
# Напишите программу, которая подсчитывает количество вхождений всех символов в строке.
# Нужно вывести только символы, которые встречаются более 1 раза (игнорируя регистр),
# с указанием их количества. Выводите повторяющиеся символы только один раз.
# text = "Programming in python"
# Пример вывода:
# Строка: Programming in python
# Символ 'p' встречается 2 раз(а)
# Символ 'r' встречается 2 раз(а)
# Символ 'o' встречается 2 раз(а)
# Символ 'g' встречается 2 раз(а)
# Символ 'm' встречается 2 раз(а)
# Символ 'i' встречается 2 раз(а)
# Символ 'n' встречается 3 раз(а)
# Символ ' ' встречается 2 раз(а)

text = "Programming in python"
text = text.lower()
result = ""

for i in text:
    if text.count(i) > 1 and i not in result:
        print("Symbol " "'" + i + "'"" occurs", text.count(i),"times(s)")
        result += i




#  3 Увеличение чисел
# Напишите программу, которая заменяет все числа в строке на их эквивалент, умноженный на 10.
# text = "I have 5 apples and 10 oranges, price is 0.5 each. Card number is ....3672."
# Пример вывода:
# I have 50.0 apples and 100.0 oranges, price is 5.0 each. Card number is ....3672.


text = "I have 5 apples and 10 oranges, price is 0.5 each. Card number is ....3672.".split()
tx = ""

for i in text:
    if i.replace('.', '', 1).isdigit():  # только так нашел как перемножить 0.5
        tmp = float(i) * 10
        tx += str(tmp) + " "
    else:
        tx += i + " "

print("Результат:", tx.strip())