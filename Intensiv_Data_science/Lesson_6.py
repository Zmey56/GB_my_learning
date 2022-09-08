import os
import string

def read_file(path_to_txt):
    text = ""
    with open(path_to_txt, "r") as stream:
        text = stream.read()

        # Data Clean up
        text = text.lower()
        for val in string.punctuation:
            if val not in ("'"):
                text = text.replace(val, "")

        words = text.split()
        words = sorted(set(words))
        return(words)

def save_file(path_to_save, words):
    words = sorted(words)
    count_words = len(words)

    with open(path_to_save, 'w', encoding='UTF-8') as f:
        f.write(f'Total unique words: {count_words}\n')
        f.write('== == == == == == == == == == == \n')

        for w in words:
            f.write(f'{w}\n')

    pass

if __name__ == "__main__":
    path_to_txt = os.path.abspath(os.path.join("./", "Lesson_6/data.txt"))
    path_to_save = os.path.abspath(os.path.join("./", "Lesson_6/data_uniq.txt"))

    words = read_file(path_to_txt)

    save_file(path_to_save, words)