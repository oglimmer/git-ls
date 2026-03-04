# git-ls

A command-line tool that lists directories with git repository status information, similar to `ls -l` but enhanced with git status details.

## Features

- Lists all subdirectories in a given path
- Shows git repository status with color-coded output
- Displays file permissions and modification times
- Provides detailed change indicators:
  - `↑` Staged changes
  - `✗` Unstaged changes
  - `?` Untracked files
- Color coding:
  - **Green**: Clean repository (no changes)
  - **Yellow**: Repository with changes
  - No color: Not a git repository

## Requirements

- Python 3.6+
- Git command-line tools

## Installation

### Homebrew (recommended)

```bash
brew tap oglimmer/git-ls https://github.com/oglimmer/git-ls
brew install git-ls
```

### Manual

1. Clone the repository:
```bash
git clone https://github.com/oglimmer/git-ls.git
cd git-ls
```

2. Make the script executable:
```bash
chmod +x git-ls
```

3. Add to your PATH:
```bash
# Add to ~/.bashrc or ~/.zshrc
export PATH="$PATH:/path/to/git-ls"
```

## Usage

List subdirectories in the current directory:
```bash
./git-ls
```

List subdirectories in a specific directory:
```bash
./git-ls /path/to/directory
```

## Output Format

```
PERMISSIONS  MODIFIED     GIT STATUS      NAME
----------------------------------------------------
drwxr-xr-x   Jan 15 10:30 clean           my-clean-repo
drwxr-xr-x   Jan 14 09:15 2↑ 1✗ 3?      my-active-repo
drwxr-xr-x   Jan 13 14:20 -               not-a-repo
```

The output columns are:
- **PERMISSIONS**: Unix-style directory permissions
- **MODIFIED**: Last modification timestamp
- **GIT STATUS**: Git repository status or `-` for non-repos
- **NAME**: Directory name

## Git Status Indicators

- **clean**: No uncommitted changes
- **N↑**: N staged changes ready to commit
- **N✗**: N unstaged modifications
- **N?**: N untracked files
- **error**: Error checking git status
- **timeout**: Git status check timed out (>5s)

## How It Works

The tool scans all subdirectories (excluding hidden ones starting with `.`) and checks each for a `.git` directory. For git repositories, it runs `git status --porcelain` to determine the current state and displays a summary with visual indicators.

## License

MIT
