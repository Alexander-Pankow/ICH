# 1 Прогрессия увеличения
# Напишите программу, которая создаёт новый кортеж,
# состоящий из элементов изначального в том же порядке.
# Добавить в него только элементы,
# которые больше всех предыдущих значений в исходном кортеже.
# Данные:
# numbers = (3, 7, 2, 8, 5, 10, 1)
# Пример вывода:
# Кортеж по возрастанию: (3, 7, 8, 10)

# numbers = (3, 7, 2, 8, 5, 10, 1)
#
# new_numbers = [numbers[0]]
#
# for num in numbers[1:]:
#     if num > new_numbers[-1]:
#         new_numbers.append(num)
#
# ascending_tuple = tuple(new_numbers)
# print("Кортеж по возрастанию: ", ascending_tuple)



# 2 Повторяющиеся элементы
# Напишите программу, которая находит индексы элементов кортежа,
# встречающихся более одного раза.
# Вывести сами элементы и их индексы.
# Данные:
# numbers = (1, 2, 3, 4, 2, 5, 3, 6, 4, 2, 9)
# Пример вывода:
# Индексы элемента 2: 1 4 9
# Индексы элемента 3: 2 6
# Индексы элемента 4: 3 8

numbers = (1, 2, 3, 4, 2, 5, 3, 6, 4, 2, 9)

index_dict = {}  # создаём словарь для хранения индексов
index = 0        # ручной счётчик индексов

# Проходим по всем элементам кортежа
for value in numbers:
    if value in index_dict:
        index_dict[value].append(index)  # добавляем индекс, если элемент уже есть
    else:
        index_dict[value] = [index]      # создаём новую запись с индексом
    index += 1  # увеличиваем счётчик после каждого элемента

# Выводим только повторяющиеся элементы (без .items())
for value in index_dict:
    indexes = index_dict[value]  # получаем список индексов для каждого элемента
    if len(indexes) > 1:         # если элемент встречается больше одного раза
        print(f"Индексы элемента {value}: {' '.join(map(str, indexes))}")





