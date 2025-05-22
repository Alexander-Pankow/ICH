# 1. Подключение данных в линию
# Напишите функцию, которая принимает список любых данных (строки, числа, таблицы, словари)
# и получает их строковое представление, объединенное через " | ".
# Предоставьте документацию и аннотационные советы по всем параметрам и значениям роста.
# Данные:
# data = [42, "hello", [1, 2, 3], {"a": 1, "b": 2}]
# Пример вывода:
# 42 | hello | [1, 2, 3] | {'a': 1, 'b': 2}

from typing import  List

data = [42, "hello", [1, 2, 3], {"a": 1, "b": 2}]

def join_data_line(data: List) -> str:

   """
   Accepts a list of elements of any type and returns their string representations
    joined by the separator " | ".

   :param data: - data (List[Any]): A list containing elements of any type (numbers, strings, lists, dictionaries, etc.)


   :return: - str: A single string where all elements are converted to strings and joined by " | "
   """
   return " | ".join(map(str, data))

print(join_data_line(data))

# 2. Сумма вложенных чисел
# Напишите функцию, которая принимает список словаря,
# где каждый словарь содержит имя списка баллов пользователя.
# Функция должна быть такой же, как и прежде.
# Предоставьте документацию и аннотационные советы по всем параметрам и значениям роста.
# Данные:
# data = [
#  {"name": "Alice", "scores": [10, 20, 30]},
#  {"name": "Bob", "scores": [5, 15, 25]},
#  {"name": "Charlie", "scores": [7, 17, 27]}
# Пример вывода:
# Total score: 156

data = [
 {"name": "Alice", "scores": [10, 20, 30]},
 {"name": "Bob", "scores": [5, 15, 25]},
 {"name": "Charlie", "scores": [7, 17, 27]}]

from typing import  List

def sum_nested_scores(data: List) -> int:
    """
    Returns the total sum of all scores from a list of dictionaries.
    Each dictionary contains a user name and a list of scores.

    :param data: A list of dictionaries with keys "name" and "scores".

    :return: The total sum of all scores.

    """
    total = 0
    for user in data:
        for score in user["scores"]:
            total +=score
    return  total

print("Total score:", sum_nested_scores(data))