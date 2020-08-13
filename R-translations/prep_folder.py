import os

# TODO: add more invalid/inappropriate characters
table = str.maketrans(dict.fromkeys(',:!"\'')) 

def get_folder_name(kata: str) -> str:
    """
    formats the string to be compatible with a
    valid folder name while retaining meaning
    """
    kata = kata.translate(table)
    return "-".join(kata.split())

def make_folder(folder: str) -> None:
    os.mkdir(folder)

def make_file(folder: str, file: str) -> None:
    with open(file, 'w') as f:
        pass

files = ['url.txt', 'description.md', 'solution.R', 'test_cases.R', 'py_test_cases_file.py']

def prep_folder(kata: str) -> None:
    folder = get_folder_name(kata)
    make_folder(folder)
    
    os.chdir(folder)   # move down into folder
    for file in files: # make the files in folder
        make_file(folder = folder, file = file)
    os.chdir('..')     # move up out of folder
        
        