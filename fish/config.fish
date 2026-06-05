# ~/.config/fish/config.fish
# Main Fish shell configuration

# ============================================
# Environment Variables
# ============================================

# Set default editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Add personal bin directories to PATH (using fish_add_path is cleaner)
fish_add_path ~/.local/bin
fish_add_path ~/bin

# ============================================
# Interactive-only Settings
# ============================================

if status is-interactive
    # Disable welcome message
    set -g fish_greeting
    
    # Command Aliases (using `abbr` for expansion)
    abbr --add ll 'ls -alF'
    abbr --add la 'ls -A'
    abbr --add l 'ls -CF'
    abbr --add g 'git'
    abbr --add gs 'git status'
    abbr --add ga 'git add'
    abbr --add gc 'git commit'
    abbr --add gp 'git push'
    abbr --add gl 'git log --oneline'
    abbr --add .. 'cd ..'
    abbr --add ... 'cd ../..'
    
    # Package management shortcuts
    abbr --add apt-update 'sudo apt update'
    abbr --add apt-upgrade 'sudo apt upgrade'
    abbr --add apt-install 'sudo apt install'
    abbr --add apt-search 'apt search'
end

# ============================================
# Login Shell Settings
# ============================================

if status is-login
    # Commands that should run only in login shells
    # Example: Start SSH agent
    # eval (ssh-agent -c) > /dev/null
end

# ============================================
# Custom Prompt Function
# ============================================

function fish_prompt
    # Exit code display (shows if last command failed)
    set -l last_status $status
    
    # User@Host (color: green for root, cyan for user)
    if test "$USER" = "root"
        set -l user_host (set_color red)"$USER"(set_color white)"@"(set_color red)(hostname -s)
    else
        set -l user_host (set_color cyan)"$USER"(set_color white)"@"(set_color cyan)(hostname -s)
    end
    
    # Current directory (blue, shortened home to ~)
    set -l current_dir (set_color blue)(prompt_pwd)
    
    # Git branch information (if in a git repo)
    set -l git_info ""
    if command -sq git
        set -l branch (git symbolic-ref --short HEAD 2>/dev/null)
        if test -n "$branch"
            set git_info (set_color green)" ($branch)"
        end
    end
    
    # Exit code indicator
    set -l exit_indicator ""
    if test $last_status -ne 0
        set exit_indicator (set_color red)" ✘"
    end
    
    # Build the prompt
    echo -n -s $user_host $current_dir $git_info $exit_indicator (set_color normal) "> "
end
