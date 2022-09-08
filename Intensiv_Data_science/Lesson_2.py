# word = input('Enter number ')

def isfloat(num):
    try:
        float(num)
        print('Correct')
    except ValueError:
        print('Wrong')


value = ['5', '3.4', '3.4.1', '1a', 'a3', '-123', '-5.321']

for i in value:
    isfloat(i)

