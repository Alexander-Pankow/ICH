#  1 Одно слово
# Напишите программу, которая обрабатывает список из строк и удаляет все строки,
# содержащие более одного слова, а также преобразует оставшиеся строки к нижнему регистру.
# Данные:
# text_list = ["Hello", "Python Programming", "World", "Advanced Topics", "Simple"]
# Пример вывода:
# Обработанный список: ['hello', 'world', 'simple']

text_list = ["Hello", "Python Programming", "World", "Advanced Topics", "Simple"]
result = []
for i in text_list:
    if " " not in i:  # если есть пробел убираем
        result.append(i.lower())
print(f"Обработанный список: {result} ")



text_list = ["Hello", "Python Programming", "World", "Advanced Topics", "Simple"]
text = []
for i in text_list:
    if " " not in i:
        text.append(i.lower())


#  2 Обновление цен товаров
# Дан список товаров с ценами.
# Программа должна применить скидку к каждому товару
# и добавить в список элемент с новой ценой.
# В конце вывести таблицу с новой ценой.
# Данные:
# products = [["Laptop", 1200], ["Mouse", 25], ["Keyboard", 75], ["Monitor", 200]]
# Пример вывода:
# Введите скидку (в процентах): 17
# Товар          Старая цена    Новая цена
#
# Laptop            1200.00$       996.00$
#
# Mouse                25.00$         20.75$
#
# Keyboard           75.00$         62.25$
#
# Monitor            200.00$       166.00$

products = [["Laptop", 1200], ["Mouse", 25], ["Keyboard", 75], ["Monitor", 200]]
discount = float(input("Введите скидку (в процентах): "))
print(f"{"Товар":<10}{"Старая цена":<15}{"Новая цена"}")

for product in products:
    technique = product[0]  # вытаскиваем технику
    price = product[1]      # вытаскиваем цену
    n_price = (100 - discount) / 100 * price # считаем новую цену
    print(f"{technique:<10}{price:>10.2f}${n_price:>13.2f}$")


#string = input("input value: ")
string = "([({}()){}])"
res = []

for i in string:
    if i in '([{':
        res.append(i)
    elif i in ')]}':
        if not res or \
           (i == ')' and res[-1] != '(') or \
           (i == ']' and res[-1] != '[') or \
           (i == '}' and res[-1] != '{'):
            print("Скобки:", string)
            print("Валидны: False")
            break
        res.pop()
else:
    if res:
        print("Скобки:", string)
        print("Валидны: False")
    else:
        print("Скобки:", string)
        print("Валидны: True")