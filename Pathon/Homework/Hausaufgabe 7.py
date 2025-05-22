# 1 Сумма цифр числа
# Напишите программу, которая вычисляет сумму цифр введённого числа.
# Пример вывода:
# Введите число: 12345
# Сумма цифр: 15

a = int(input("Enter number: "))
sum = 0
while a > 0:
    sum += a % 10
    a = a // 10
print("Sum of digits:", sum)

#  2 Палиндром
# Напишите программу,
# которая запрашивает у пользователя целое число и определяет,
# является ли оно палиндромом. Число является палиндромом,
# если оно читается одинаково слева направо и справа налево.
# Пример вывода:
# Введите число: 12321
# Число 12321 является палиндромом.
# Введите число: 1234
# Число 1234 не является палиндромом.

num = int(input("Введите число: "))
original_num = num
reversed_num = 0

while num > 0:
    digit = num % 10
    reversed_num = reversed_num * 10 + digit
    num //= 10  # переворачиваем число

if original_num == reversed_num:
    print("Число", original_num, "является палиндромом.")
else:
    print("Число", original_num, "не является палиндромом.")




#  3 Проверь интуицию
# Напишите программу,
# которая генерирует случайное число от 1 до 100 включительно и дает пользователю 10 попыток,
# чтобы угадать это число. Программа должна подсказывать,
# больше или меньше загаданное число.
# После завершения игры программа оценивает,
# насколько хорошая интуиция у игрока.
# Пример вывода:
# Угадайте число от 1 до 100. У вас 10 попыток.
# Ваше предположение: 50
# Загаданное число меньше вашего
# Ваше предположение: 25
# Загаданное число больше вашего
# Ваше предположение: 30
# Поздравляем! Вы угадали число: 30.
# Вы угадали число за 3 попытки. Отличный результат!

import random

number = random.randint(1, 100)
attempts = 0
max_attempts = 10

print("Guess a number between 1 and 100. You have 10 attempts.")

while attempts < max_attempts:
    guess = int(input("Your guess: "))  # считает попытки
    attempts += 1

    if guess < number:
        print("The secret number is higher than your guess.")
    elif guess > number:
        print("The secret number is lower than your guess.")
    else:
        print("Congratulations! You guessed the number:  ", number)
        break           # подсказывает что бы угадать номер

if guess == number:
    if attempts <= 3:
        print("You guessed the number in", attempts, "attempts. Excellent result!")
    elif attempts <= 7:
        print("You guessed the number in", attempts, "attempts. Good result!")
    else:
        print("You guessed the number in", attempts, "attempts. Better luck next time!")
else:
    print("You didn't guess the number. The secret number was", number)    #подсчитывает наш результат



