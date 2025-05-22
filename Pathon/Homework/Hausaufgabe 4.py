# 1. Логические операции
# Напишите программу, которая получит два логических значения от пользователя
# и выведет результат логических операций and, or, not для этих значений,
# а также сравнение на равенство и неравенство.
# Для операции not используйте первое число.
# Продумайте в каком виде получать ввод от пользователя для логического значения.

# Пример вывода:
# Enter first value: <value1>
# Enter second value: <value1>
# and: True
# or: True
# not: False
# equal: False
# not equal: True

first_n =int(input("Enter the first number: "))
second_n =int(input("Enter the second number: "))
print("and:", bool(first_n and second_n))
print("or:", bool(first_n or second_n))
print("not:", bool(not first_n))
print("equal:", first_n == second_n)
print("not equal:", first_n != second_n)



# 2. Проверка условий
# Напишите программу, которая принимает на вход логические значения двух переменных
# (свет включён и окно открыто) и проверяет:
# Оба ли условия выполнены.
# Хотя бы одно из условий выполнено.
# Пример вывода:
# Свет включён? True
# Окно открыто? False
# Оба условия выполнены? False
# Хотя бы одно условие выполнено? True

light =str(input("is the light on? (True/False): "))
window =str(input("is the window open? (True/False): "))

print("Are both conditions met?", light and window)
print("Is at least one condition met?", light or window)

# 3.Стоимость мобильного тарифа
# Напишите программу для расчёта стоимости использования мобильного тарифа:
# Базовая стоимость: 30 евро.
# Каждый мегабайт интернета сверх 500 МБ стоит 0.2 евро.
# Программа должна запросить у пользователя количество использованных мегабайтов
# и вывести сколько всего он заплатил (базовый и переплата).
# Пример вывода:
# Введите использованные мегабайты: 510
# Общая стоимость: 32.0

traffic = int(input("How many megabytes did you use?: "))

base_cost = 30
base_mb = 500
extra_cost = 0.2

extra_mb_cost = (traffic - base_mb) * extra_cost * (traffic >base_mb)
total_cost = base_cost + extra_mb_cost
print("Total cost: " , int(total_cost))
