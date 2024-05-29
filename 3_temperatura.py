#================================================================
#Autor: Júlio Miranda
#Data: 28/05/2024
#Versão: 1.0
#Descrição: Faça um algoritmo que receba a temperatura em
#           °C e converta para °F e k
#           ----------------------------------------------------
#           Exemplo de execução:
#           Insira a temperatura em Celsius: 0
#           Fahrenheit: 32°F
#           Kelvin: 273,15 K
#           --------------------------------------------------
#
#================================================================
#variaveis
celsius = 0 #temperatura inserida pelo usuário
fahrenheit = 0 #temperatura em Fahrenheit vinda da conversão
kelvin = 0 #temperatura em Kelvin vinda da conversão
#entrada
celsius = float(input('Insira a temperatura em Celsius: '))
#precessamento
fahrenheit = (celsius * (9/5)) + 32
kelvin = celsius + 273.15
#saida
# print('Fahrenheit', fahrenheit)
print(celsius, '°C equivalem', fahrenheit, '°F')
print(celsius, '°C equivalem', kelvin, 'K')
# print('Kelvin', kelvin)
#================================================================
