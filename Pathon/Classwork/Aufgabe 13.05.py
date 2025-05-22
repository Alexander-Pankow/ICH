#  1 Популярные слова
# Реализуйте функцию, которая принимает любое количество строк с текстом.
# Функция должна возвращать подсчет самых популярных слов в количестве,
# переданном в функцию. Программа должна игнорировать регистр слов. Выведите 5
# самых популярных слов и их количество.
# Данные:
# text1 = "This is a sample text with some repeated words."
# text2 = "Another sample text with different words."
# text3 = "Text processing is fun when words repeat."
# Пример вывода:
# 5 самых популярных слов:
# words: 3
# text: 3
# with: 2
# sample: 2
# is: 2

from collections import Counter

text1 = "This is a sample text with some repeated words."
text2 = "Another sample text with different words."
text3 = "Text processing is fun when words repeat."

# Объединяем все тексты и приводим к нижнему регистру
all_text = ' '.join([text1, text2, text3]).lower()

# Удаляем знаки препинания вручную и разбиваем на слова
clean_text = ''
for char in all_text:
    if char.isalnum() or char.isspace():
        clean_text += char

words = clean_text.split()

# Считаем самые популярные слова
counter = Counter(words)

# Выводим 5 самых популярных слов
print("5 самых популярных слов:")
for word, count in counter.most_common(5):
    print(f"{word}: {count}")

text1 = "This is a sample text with some repeated words."
text2 = "Another sample text with different words."
text3 = "Text processing is fun when words repeat."



# 2 Группировка задач по категории
# Реализуйте функцию, которая принимает словарь задач с категориями и группирует
# задачи по их категориям.
# Данные:
# Python
# Unset
# Python
# tasks = {
#  "task1": "работа",
#  "task2": "учёба",
#  "task3": "развлечения",
#  "task4": "работа",
#  "task5": "учёба"
# }
# Пример вывода:
# Группировка по категориям:
# {
#  'работа': ['task1', 'task4'],
#  'учёба': ['task2', 'task5'],
#  'развлечения': ['task3']
# }




# 3 Поиск задач
# Реализуйте функцию, которая принимает словарь задач с категориями и нужную
# категорию. Функция должна возвращать список задач для указанной категории.
# Данные:
# tasks = {
# Unset
# Python
#  "task1": "работа",
#  "task2": "учёба",
#  "task3": "развлечения",
#  "task4": "работа",
#  "task5": "учёба"
# }
# category = "учёба"
# Пример вывода:
# Задачи для категории 'учёба':
# ['task2', 'task5']





# 4 Очередь задач с приоритетом
# Есть очередь задач, где каждая задача имеет приоритет: "высокий", "средний",
# "низкий".
# Реализуйте функцию, которая сортирует очередь задач таким образом, чтобы более
# высокий приоритет был в начале очереди.
# Нужно изменить исходную очередь, а не создавать новую.
# Данные:
# from collections import OrderedDict
# tasks = OrderedDict({
#  "task1": "низкий",
# Unset
# Python
#  "task2": "средний",
#  "task3": "высокий",
#  "task4": "низкий",
#  "task5": "высокий"
# })
# Пример вывода:
# Очередь задач:
#  task3: высокий






# 5 Подсчёт посещений страниц
# Реализуйте функцию, которая принимает список посещённых страниц и
# подсчитывает количество посещений каждой страницы, используя defaultdict.
# Данные:
# pages = ["home", "about", "home", "products", "home", "contact", "products"]
# Пример вывода:
# Unset
# Python
# Unset
# Python
# Посещения страниц:
# {'home': 3, 'about': 1, 'products': 2, 'contact': 1}





#  6 Группировка слов по длине
# Реализуйте функцию, которая группирует слова по их длине и возвращает словарь с
# ними.
# Данные:
# words = ["apple", "banana", "kiwi", "grape", "orange", "peach"]
# Пример вывода:
# Слова по длине:
# 5: ['apple', 'grape', 'peach']
# 6: ['banana', 'orange']
# 4: ['kiwi']



# 7 Создание глобального счётчика
# Создайте функцию increment_counter, которая использует глобальную
# переменную counter для подсчёта вызовов этой функции.
# Пример вызова:
# increment_counter()
# Unset
# Python
# Unset
# increment_counter()
# print(counter)
# Пример вывода:
# Вызовов функции: 2





# 8 Очередь с LRU-кэшированием
# Реализуйте функцию, которая поддерживает механизм LRU-кэша для очереди задач.
# Функция должна принимать:
# ● Текущую очередь задач.
# ● Новые задачи для добавления.
# ● Максимальный размер очереди.
# Если лимит очереди превышен, удаляйте задачи, которые не использовались дольше
# всех.
# Данные:
# tasks = ["task1", "task2", "task3", "task4", "task5", "task6"]
# new1 = "task4"
# new2 = "task1"
# new3 = "task7"
# new4 = "task2"
# Пример вывода:
# Очередь из 4 новых задач: ['task4', 'task1', 'task7', 'task2']




def last_char_len(s):
    return s[-1], len(s)

words = ['mango', 'grape', 'apple', 'strawberry', 'banana', 'pineapple', 'kiwi', 'blueberry']
# Сортировка по последнему символу и длине (последовательно)
result = sorted(words, key=last_char_len)
print(result)
def last_char_len(s):
    return s[-1], len(s)

words = ['mango', 'grape', 'apple', 'strawberry', 'banana', 'pineapple', 'kiwi', 'blueberry']
# Сортировка по последнему символу и длине (последовательно)
result = sorted(words, key=last_char_len)
print(result)

result_lambda = sorted(words, key=lambda s: (s[-1], len(s)))
print(result)


def add(x, y):
    return x + y


def multiply(x, y):
    return x * y


# Функции можно хранить в списках, словарях и передавать их динамически
operations = {
    "+": add,
    "*": multiply
}
# choice = input("Выберите операцию (+, *): ")
# Из словаря получена функция и скобки с аргументами запускают её
print(operations["+"](10, 5))
print(operations["*"](10, 5))


# 1. Список квадратов чисел
# Напишите функцию, которая сформирует список квадратов из полученного списка,
# без использования циклов или списковых включений.
# Данные:
# numbers = [1, 2, 3, 4, 5]
# Пример вывода:
# [1, 4, 9, 16, 25]

def power_num(numbers):
    return list(map(lambda x: x**2, numbers))

# Данные
numbers = [1, 2, 3, 4, 5]

# Вызов функции
result = power_num(numbers)
print(result)


# 2 Сортировка по возрасту
# Отсортируйте список кортежей (имя, возраст) по возрасту.
# Данные:
# people = [
#     ("Mike", 19), ("Nancy", 35), ("Charlie", 23), ("Oscar", 33), ("Eve", 29),
#     ("Frank", 33), ("Bob", 20), ("Grace", 27), ("Isabella", 19), ("Jack", 24),
#     ("Alice", 25), ("Kevin", 28), ("Laura", 31), ("Diana", 30), ("Henry", 19)]
# Пример вывода:
# [('Mike', 19), ('Isabella', 19), ('Henry', 19), ('Bob', 20), ('Charlie', 23), ('Jack', 24), ('Alice', 25),
#  ('Grace', 27), ('Kevin', 28), ('Eve', 29), ('Diana', 30), ('Laura', 31), ('Oscar', 33), ('Frank', 33), ('Nancy', 35)]

people = [
    ("Mike", 19), ("Nancy", 35), ("Charlie", 23), ("Oscar", 33), ("Eve", 29),
    ("Frank", 33), ("Bob", 20), ("Grace", 27), ("Isabella", 19), ("Jack", 24),
    ("Alice", 25), ("Kevin", 28), ("Laura", 31), ("Diana", 30), ("Henry", 19)]

sorted_people = sorted(people, key=lambda person: person[1])

print(sorted_people)


# 3 Сортировка по возрасту и имени
# Отсортируйте список кортежей (имя, возраст) по убыванию возраста, в рамках одинакового возраста отсортируйте также по имени по алфавиту.
# Данные:
# people = [
#     ("Mike", 19), ("Nancy", 35), ("Charlie", 23), ("Oscar", 33), ("Eve", 29),
#     ("Frank", 33), ("Bob", 20), ("Grace", 27), ("Isabella", 19), ("Jack", 24),
#     ("Alice", 25), ("Kevin", 28), ("Laura", 31), ("Diana", 30), ("Henry", 19)]
# Пример вывода:
# [('Nancy', 35), ('Frank', 33), ('Oscar', 33), ('Laura', 31), ('Diana', 30), ('Eve', 29),
#  ('Kevin', 28), ('Grace', 27), ('Alice', 25), ('Jack', 24), ('Charlie', 23),
#  ('Bob', 20), ('Henry', 19), ('Isabella', 19), ('Mike', 19)]

people = [
     ("Mike", 19), ("Nancy", 35), ("Charlie", 23), ("Oscar", 33), ("Eve", 29),
    ("Frank", 33), ("Bob", 20), ("Grace", 27), ("Isabella", 19), ("Jack", 24),
     ("Alice", 25), ("Kevin", 28), ("Laura", 31), ("Diana", 30), ("Henry", 19)]


sorted_people = sorted(people, key=lambda person: (-person[1], person[0]))

print(sorted_people)