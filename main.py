#!/usr/bin/python3
try:
    while True:
        asked_order = input('$ ')
        list_of_invalid = ['import' in asked_order,
        'from' in asked_order,
        'os' in asked_order,
        'sys' in asked_order,
        'subprocess' in asked_order,
        'IMPORT' in asked_order, 
        'FROM' in asked_order,
        'OS' in asked_order,
        'SYS' in asked_order,
        'SUBPROCESS' in asked_order]
        if any(list_of_invalid):
            print('Sike it\'s wrong command !!')
        else:
            exec(asked_order)
except:
    pass
