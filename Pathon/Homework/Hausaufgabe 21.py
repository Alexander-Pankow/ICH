# Письма речи
# Для реализации этой функции текст и язык создаются подсчётом количества каждой буквы,
# добавляемого в регистр.
# Данные:
# text = "Programming is fun!"
# Пример вывода:
# {'p': 1, 'r': 2, 'o': 1, 'g': 2, 'a': 1, 'm': 2, 'i': 2, 'n': 2, 's': 1, 'f': 1, 'u': 1}

from collections import Counter

text = "Programming is fun!"

def letter_count(text):

    text = text.lower()
    #filtered_text = ''.join([char for char in text if char.isalpha()])  # убираем знаки препинания
    #result = Counter(filtered_text)
    return dict(Counter(char for char in text if char.isalpha()))

print(letter_count(text))




# Группа студентов по классу
# общая структура для групп студентов по классам.
# Оказывать поддержку студентам в многоэтнической группе.
# Данные:
# students = [("class1", "Элис"), ("class2", "Боб"), ("class1", "Чарли"), ("class3", "Дейзи")]
# Пример вывода:
# {'class1': ['Элис', 'Чарли'], 'class2': ['Боб'], 'class3': ['Дейзи']}

from collections import defaultdict

students = [("class1", "Элис"), ("class2", "Боб"), ("class1", "Чарли"), ("class3", "Дейзи")]

def class_by_students(students):
    result = defaultdict(list)
    for cls, name in students:
         result[cls].append(name)
    return dict(result)

print(class_by_students(students))


