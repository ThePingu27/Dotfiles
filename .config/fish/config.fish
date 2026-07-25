if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_greeting
        echo ""
        fastfetch
        echo ""
    end
end

# Python virtual environment for fish shell
# Source: https://github.com/sanjay2911/pyenv-fish-config

set -g DEFAULT_ENV ".venv"

# ---- Create Environment ----
function mkenv
    # Usage: mkenv [env_name] [python_executable]
    set env_name $DEFAULT_ENV
    if test (count $argv) -ge 1
        set env_name $argv[1]
    end
    set py_exec (which python3)
    if test (count $argv) -ge 2
        set py_exec $argv[2]
    end

    if test -d $env_name
        echo "❌ Environment '$env_name' already exists."
        return 1
    end

    echo "📦 Creating virtual environment '$env_name' using $py_exec..."
    $py_exec -m venv $env_name
    if test $status -eq 0
        echo "✅ Environment '$env_name' created."
    else
        echo "❌ Failed to create environment."
    end
end

# ---- Activate Environment ----
function venv
    # Usage: venv [env_name]
    set env_name $DEFAULT_ENV
    if test (count $argv) -ge 1
        set env_name $argv[1]
    end

    if not test -d $env_name
        echo "❌ Environment '$env_name' does not exist."
        return 1
    end

    if not test -f $env_name/bin/activate.fish
        echo "❌ No activate.fish found in $env_name/bin"
        return 1
    end

    echo "🐍 Activating virtual environment '$env_name'..."
    source $env_name/bin/activate.fish >/dev/null 2>&1
end

# ---- Remove Environment ----
function rmenv
    # Usage: rmenv [env_name]
    set env_name $DEFAULT_ENV
    if test (count $argv) -ge 1
        set env_name $argv[1]
    end

    if not test -d $env_name
        echo "❌ Environment '$env_name' does not exist."
        return 1
    end

    echo "⚠️ Removing environment '$env_name'..."
    rm -rf $env_name
    echo "✅ Environment '$env_name' removed."
end

# ---- Auto-activate .venv if present ----
# ---- Auto-activate .venv if present ----
function auto_venv --on-variable PWD
    # Fires on cd
    if test -d $DEFAULT_ENV
        if test -f $DEFAULT_ENV/bin/activate.fish
            if test "$VIRTUAL_ENV" != (realpath $DEFAULT_ENV)
                echo "🔄 Auto-activating virtual environment from $DEFAULT_ENV"
                source $DEFAULT_ENV/bin/activate.fish >/dev/null 2>&1
            end
        end
    end
end

# ---- Auto-activate at terminal startup ----
# Call once when shell starts (in addition to cd trigger)
if test -d $DEFAULT_ENV; and test -f $DEFAULT_ENV/bin/activate.fish
    if test "$VIRTUAL_ENV" != (realpath $DEFAULT_ENV)
        begin
            source $DEFAULT_ENV/bin/activate.fish
        end >/dev/null 2>&1
        echo "🐍 Activated $DEFAULT_ENV automatically on shell start"
    end
end

# ---- yazi shell wrapper ----
# 
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end
