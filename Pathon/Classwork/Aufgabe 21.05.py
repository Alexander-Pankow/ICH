# 0. Аннотации для функций
# Для каждой из функций, выбранных для решения, добавьте аннотации типов
# принимаемых и возвращаемых значений функции.
# 1.1. Фильтрация четных с функцией
# Напишите функцию-предикат, которая проверяет четный ли переданный элемент.
# Также напишите функцию, которая принимает функцию-предикат и список чисел.
# Она должна возвращать новый список, содержащий только элементы, для которых
# предикат возвращает True.
# Данные:
# nums = [1, 2, 3, 4, 5, 6]
# Пример вывода:
# [2, 4, 6]

from typing import Callable, List

# Функция-предикат: проверяет, является ли число четным
def is_even(n: int) -> bool:
    return n % 2 == 0

# Функция фильтрации: принимает предикат и список чисел
def filter_numbers(predicate: Callable[[int], bool], numbers: List[int]) -> List[int]:
    return [num for num in numbers if predicate(num)]

# Пример использования
nums = [1, 2, 3, 4, 5, 6]
result = filter_numbers(is_even, nums)
print(result)  # [2, 4, 6]


# 1.2. Фильтрация четных с filter
# Выполните те же условия, что в задаче "Фильтрация списка с функцией", но решите с
# помощью filter и lambda.
# Данные:
# nums = [1, 2, 3, 4, 5, 6]
# Пример вывода:
# [2, 4, 6]

from typing import List

def filter_even_numbers(numbers: List[int]) -> List[int]:
    return list(filter(lambda x: x % 2 == 0, numbers))

# Пример использования
nums = [1, 2, 3, 4, 5, 6]
result = filter_even_numbers(nums)
print(result)  # [2, 4, 6]

# 2.1. Фильтрация списка строк
# Отфильтруйте в новый список только слова, длина которых больше трех символов.
# Реализуйте в виде функции.
# Данные:
# words = ["hi", "Hello", "a", "python", "Ok"]
# Пример вывода:
# ['Hello', 'python']


from typing import List

def filter_long_words(words: List[str]) -> List[str]:
    #return [word for word in words if len(word) > 3]
     return list(filter(lambda w: len(w) > 3,words  ))
# Пример использования
words = ["hi", "Hello", "a", "python", "Ok"]
result = filter_long_words(words)
print(result)  # ['Hello', 'python']


# 2.2. Фильтрация списка строк по длине
# Доработайте функцию так, чтобы можно было передавать значение минимальной
# длины слов, которые нужно оставить.
# words = ["hi", "Hello", "a", "python", "Ok"]
# min_len = 2
# Пример вывода:
# ['hi', 'Hello', 'python', 'Ok']

from typing import List

def filter_words_by_length(words: List[str], min_len: int) -> List[str]:
    #return [word for word in words if len(word) >= min_len]
    return list(filter(lambda w: len(w) >= min_len, words))
# Пример использования
words = ["hi", "Hello", "a", "python", "Ok"]
min_len = 2
result = filter_words_by_length(words, min_len)
print(result)  # ['hi', 'Hello', 'python', 'Ok']


# 2.3. Фильтрация списка строк по критерию
# Доработайте функцию так, чтобы можно было передавать критерии отбора слов,
# которые нужно оставить. Например:
# ● слова, начинаются с заглавной буевы
# ● слова из одного символа
# ● слова начинаются и заканчиваются одной буквой, независимо от регистра
# words = ["hi", "Hello", "a", "python", "Ok", "Radar"]
# Пример вывода:
# ['Hello', 'Ok', 'Radar']
# ['a']
# ['a', 'Radar']

from typing import List

# 1. Фильтрация: слова, начинающиеся с заглавной буквы
def filter_starts_with_upper(words: List[str]) -> List[str]:
    """
    Возвращает список слов, которые начинаются с заглавной буквы.
    """
    return list(filter(lambda word: word[0].isupper() if word else False, words))


# 2. Фильтрация: слова длиной в один символ
def filter_single_char_words(words: List[str]) -> List[str]:
    """
    Возвращает список слов, состоящих из одного символа.
    """
    return list(filter(lambda word: len(word) == 1, words))


# 3. Фильтрация: слова, начинающиеся и заканчивающиеся одной буквой (без учёта регистра)
def filter_same_start_end(words: List[str]) -> List[str]:
    """
    Возвращает список слов, у которых первая и последняя буква совпадают (регистр не важен).
    """
    return list(filter(lambda word: word[0].lower() == word[-1].lower() if word else False, words))


# Пример использования
words = ["hi", "Hello", "a", "python", "Ok", "Radar"]

print(filter_starts_with_upper(words))  # ['Hello', 'Ok', 'Radar']
print(filter_single_char_words(words))  # ['a']
print(filter_same_start_end(words))

# 3. Агрегирование списка
# Вычислите произведение всех элементов списка с помощью функции высшего
# порядка.
# Данные:
# numbers = [1, 2, 3, 4, 5]
# Пример вывода:
# 120

def sort_by_length(words: list[str]) -> list[str]:
    return sorted(words, key=lambda word: (len(word), word[0]))

words = ["apple", "banana", "kiwi", "grape"]
print(sort_by_length(words))

# 4. Сортировка списка по длине
# Отсортируйте список слов по длине, используя параметр.
# Данные:
# words = ["apple", "banana", "kiwi", "grape"]
# print(sort_by_length(words))
# Пример вывода:
# ['kiwi', 'grape', 'apple', 'banana']
# 5. Очередь с ограничением времени
# Реализуйте функцию, которая принимает очередь задач с указанием времени их
# выполнения и лимит.
# Если суммарное время превышает заданный лимит, программа должна удалять из
# очереди задачи с минимальным временем выполнения, пока лимит не будет
# соблюдён или не останется выполнимых за остаток времени задач.
# Данные:
# tasks = {"task1": 5, "task2": 3, "task3": 7, "task4": 2}
# time_limit = 10
# Пример вывода:
# Задачи с лимитом по времени:
# {'task3': 7, 'task2': 3}
# 6. Анализ оценок студентов
# Дан список студентов с их оценками по разным предметам.
# Напишите программу, которая:
# ● Вычисляет среднюю оценку для каждого студента.
# ● Возвращает словарь студентов с их средней оценкой, отсортированный по
# убыванию оценок.
# Данные:
# students = [
# {"name": "Alice", "grades": [90, 85, 88]},
# {"name": "Bob", "grades": [78, 81, 75]},
# {"name": "Charlie", "grades": [95, 92, 90]},
# {"name": "Diana", "grades": [88, 84, 82]}
# ]
# Пример вывода:
# {'Charlie': 92.33, 'Alice': 87.67, 'Diana': 84.67, 'Bob': 78.0}
# 7*. Поиск максимального элемента
# Отсортируйте слова в списке исходя из суммы порядковых номеров всех символов
# в слове.
# К примеру "kiwi" = ord("k") + ord("i") + ord("w") + ord("i") = 107 + 105 + 119 + 105 = 436.
# Попробуйте решить в одну строку с помощью lambda и функций высшего порядка.
# Данные:
# words = ["banana", "kiwi", "grapefruit", "apple"]
# Пример вывода:
# ['kiwi', 'apple', 'banana', 'grapefruit']
# 8*. Цепочка шифрования строки
# Реализуйте функции:
# 1. Преобразуйте все буквы в предложении в верхний регистр.
# 2. Зашифруйте строку, сдвинув символы на 5 элементов вправо.
# 3. Переверните строку.
# Реализуйте функцию шифрования, которая последовательно применит каждую из
# списка переданных функций к переданной строке.
# Данные:
# sentence = "Functional programming is powerful"
# functions = [to_uppercase, shift_encrypt, reverse_string]
# Пример вывода:
# QZKWJ\TU%XN%LSNRRFWLTWU%QFSTNYHSZK



# бинарное вычисление

def binary_search(arr: list[int], target: int, left: int, right: int) -> int:
    if left > right:  # Базовый случай: элемент не найден
        return -1

    mid = (left + right) // 2
    if arr[mid] == target: # arr[3] == 5 | 7 == 5
        return mid
    elif arr[mid] < target:
        return binary_search(arr, target, mid + 1, right)  # Поиск в правой части
    else:
        return binary_search(arr, target, left, mid - 1)  # Поиск в левой части

array = [1, 3, 5, 7, 9, 11, 13]
print(binary_search(array, 5, 0, len(array) - 1))



def factorial_iterative(n: int) -> int:
    accumulator = 1
    while n > 1:
        accumulator *= n
        n -= 1
    return accumulator
print(factorial_iterative(5))

"""
Обход дерева (DFS - поиск в глубину)
Обход графа (DFS, рекурсивный поиск путей)
Разбор выражений и синтаксический анализ
Ханойские башни
Разбиение на подмножества и комбинаторика
"""