# Напишите программу, которая получает от пользователя цену на товар и количество товара. Программа должна рассчитать итоговую сумму заказа со скидкой, исходя из количества товара.
# Условия скидки:
# Если количество товара от 10 до 19 — скидка 5%.
# Если количество товара от 20 до 49 — скидка 10%.
# Если количество товара от 50 до 99 — скидка 15%.
# Если количество товара 100 и более — скидка 20%.


price = float(input("Введите сумму товара: "))
quantity = float(input("Введите количество : "))

sale = 0
if 10 <= quantity < 20:
    sale = 0.05
elif 20 <= quantity < 50:
    sale = 0.1
elif 50 <= quantity < 100:
    sale = 0.15
elif quantity >= 100:
    sale = 0.2

total_price = quantity * price * (1 - sale)
print("Итоговая сумма оплаты: ", total_price)



#задание  из лекции

age = int(input("Age: "))

if age > 18:
    driver_license = bool(int(input("Введите 0, если не имеете или 1 если имеете: ")))
    if driver_license:
        print("Вы можете водить машину.")
    else:
        print("You can't drive a car.")

# другой способ

age = int(input("Age: "))
driver_license = bool(int(input("Введите 0, если не имеете или 1 если имеете: ")))

if age > 18 and driver_license == True:
    print("Вы можете водить машину.")
else:
    print("You can't drive a car.")

res = "Вы можете водить машину." if age > 18 and driver_license == True else "You can't drive a car."
print(res)