# My dotfiles

This repo includes my dotfiles for different systems, categorized by the git branches.
Currently, these configs are available:

- [Desktop](https://github.com/Jojodicus/dotfiles/tree/desktop)
- [Laptop](https://github.com/Jojodicus/dotfiles/tree/laptop)
- [HPC and non-root systems](https://github.com/Jojodicus/dotfiles/tree/hpc)

## Express installation

For convenience, a script for express installation is provided.
The script applies the selected config to the current user's home, appending existing files.

To execute the script:

(short version)
```bash
python3 -c "$(curl -s https://raw.githubusercontent.com/Jojodicus/dotfiles/master/install.py)"
```

(verbose version)
```bash
git clone https://github.com/Jojodicus/dotfiles
cd dotfiles
python3 install.py
```