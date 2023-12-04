from os import chdir, path, walk, mkdir
from shutil import which, copyfileobj

# all branches which contain meaningful configs
all_branches = [
    'desktop',
    'laptop',
    'hpc'
]

# running from git-clone (hopefully)
git_folder = path.dirname(__file__)

# check if git is actually installed properly
if not which('git'):
    print('[!] git is either not installed or missing from PATH')
    exit(1)

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

home = path.expanduser("~")

# iterate over all files
for root, dirs, files in walk('.'):
    if '.git' in root:
        continue

    for file in files:
        local_name = path.join(root, file)
        new_name = path.join(home, local_name)
        print(f'copying {local_name} to {new_name}')

        # create directory if it doesn't exist
        new_dirname = path.dirname(new_name)
        if not path.exists(new_dirname):
            mkdir(new_dirname)

        # copy file over in append mode
        with open(local_name, 'r') as source:
            with open(new_name, 'a') as dest:
                copyfileobj(source, dest)

print('Done!')
