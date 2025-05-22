# import tkinter as tk
# from tkinter import messagebox
#
# def congratulate():
#     messagebox.showinfo("Поздравление", "С 8 Марта! Желаю счастья, любви и весеннего настроения!")
#
# root = tk.Tk()
# root.title("Поздравление с 8 Марта")
# root.geometry("300x200")
#
# label = tk.Label(root, text="Дорогие женщины!", font=("Arial", 14))
# label.pack(pady=20)
#
# button = tk.Button(root, text="Получить поздравление", command=congratulate, font=("Arial", 12))
# button.pack(pady=20)
#
# root.mainloop()


# bill_amount = float(input("Введите сумму счёта: "))
# tip_percent = float(input("Введите процент чаевых: "))
# tip_amount = (tip_percent * bill_amount) / 100
# print(tip_amount)
#
# check = int(input("Напишите сумму счета: "))
# tee = int(input("Напишите процент чаевых: "))
# finaltee = print("Сумма чаевых: " + str(check * tee / 100))
#
# Rechnung = int(input("Введите сумму счёта: "))
# Procent_t_geld = int(input("Введите процент чаевых: "))
# # t_geld = ("Сумма чаевых: "))
#
# t_geld = Rechnung * 0.08
# print ("Сумма чаевых: " + str(t_geld))
#
# sum = int(input("Напишите сумму счета: "))
# chay = int(input("Напишите процент чаевых: "))
# sumchay = print("Сумма чаевых: " + str(check * tee / 100))
#
# a = float(input("Введите сумму счёта:  "))
# b = int(input("Введите процент чаевых:  "))
# total_cost = a * (b/100)
# print("Сумма чаевых: ", total_cost)


# elephant = input("Купи слона! ")
# elephant.lower()
# while True:
#     elephant = print("Все говорят", elephant, ", а ты купи слона")
#     elephant = input("Купи слона! ")

x = False
y = False
z = False

# print(x and y or z == False)  # должно быть True # x = 0 #y = 0 #z = 0
# print(not x or not y)  # должно быть True # x = 0 #y = 0 #z = 0
# print(x == y == 1)  # должно быть True   # x = 1 #y = 1 #z = 0  #___ = 1
# print((x or y) and not z)  # должно быть True # x = 1 #y = 1 #z = 0



print(x and y or z == False)  # должно быть True
print(not x or not y)  # должно быть True
print(x == y == 0)  # должно быть True
print((x or y) and not z)  # должно быть False