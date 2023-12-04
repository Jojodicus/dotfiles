from os import system, chdir, path
from shutil import which

# all branches which contain meaningful configs
all_branches = [
    'desktop',
    'laptop',
    'hpc'
]

git_folder = '/tmp/dotfiles'

# are we running from web (i.e. the short version install script)?
if '__file__' in vars(__builtins__):
    # then we have to clone the repo (after checking if git is installed)
    if not which('git'):
        print('git is either not installed or missing from PATH')
        exit(1)

    system(f'git clone https://github.com/Jojodicus/dotfiles {git_folder}')
else:
    # running from git-clone (hopefully)
    git_folder = path.dirname(__file__)

chdir(git_folder)

while True:
    print('What config do you want to load?')
    for index, branch in enumerate(all_branches):
        print(f'[{index}] {branch}')

    user_input = input('Your selection (default [0]): ')
    if user_input == '':
        user_input = 0

    try:
        selected_branch_index = int(user_input)
        # valid selection?
        if 0 <= int(selected_branch_index) < len(all_branches):
            break
    except ValueError:
        pass

    print('Please select a valid option')

selected_branch = all_branches[selected_branch_index]

print(f'loading config from branch {selected_branch}')

system(f'git checkout {selected_branch}')
