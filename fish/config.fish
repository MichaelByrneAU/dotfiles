# Disable the default greeting. 
set -U fish_greeting

# Vi key bindings.
fish_vi_key_bindings

# Special environment variables.
set -gx VISUAL hx
set -gx RUSTUP_HOME $HOME/Builds/rustup
set -gx CARGO_HOME $HOME/Builds/cargo

# Define the builds prefix. 
set -l PREFIX $HOME/Builds

# Path.
fish_add_path /opt/homebrew/bin
fish_add_path $PREFIX/cargo/bin
fish_add_path $PREFIX/zigup/bin

# Aliases.
alias lg='lazygit'
alias update-everything='make -C ~/Sources/public/dotfiles update-everything'

# Hooks.
if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
    atuin init fish | source
    zoxide init fish | source
end
