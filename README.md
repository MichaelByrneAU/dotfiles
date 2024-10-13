# Personal Dotfiles

This repository contains my personal, idiosyncratic machine configuration, specifically compatible with my current Apple Silicon Macbook. 
It is meant to be cloned into `~/Sources/public/dotfiles`. 
Here is a high-level overview of the repository structure:

```
┌─────────┐
│dotfiles/│░
└─────────┘░
 ░░░░│░░░░░░
     │      ┌──────────┐
     ├──────▶ [app]/   │ (app-specific configuration directories)
     │      └──────────┘
     │      ┌──────────┐
     ├──────▶ scripts/ │ (installation scripts for software not managed by Brew)
     │      └──────────┘
     │
     ├──────▶ Brewfile   (macOS package management)
     │
     │
     └──────▶ Makefile   (package installation and dotfile administration)
```

The main components of this setup include [WezTerm](https://github.com/wez/wezterm) as the terminal emulator, [Zellij](https://github.com/zellij-org/zellij) for terminal multiplexing, [Helix](https://github.com/helix-editor/helix) as the text editor, and [Fish](https://fishshell.com) as the shell.
The Makefile is the central tool for managing the installation and configuration of software, using [Homebrew](https://brew.sh) for package management and [GNU Stow](https://www.gnu.org/software/stow/) for symlinking dotfiles to their appropriate locations within the home folder. 

Custom Fish scripts are used to install tools like Rustup and Zigup into a controlled prefix.
Such software, as well as everything built from source, are installed into the `Builds` folder in the home directory, keeping these installations isolated and manageable. 

To set up this configuration: 

1. Clone this repository into `~/Sources/public/dotfiles`.
2. Run `make bootstrap` (**NOTE**: This target is currently incomplete and will be finalised when moving to a new machine).
3. Run `make brew-install-everything` to install all required packages via Homebrew. 
4. Run `make install-dotfiles` to symlink configuration files to their appropriate locations. 
5. Run `make install-rustup` and `make install-zigup` to install the Rust and Zig toolchains respectively. 
6. Run `make install-completions` to setup shell completions. 

To update all managed software and configurations, run the `update-everything` command, which is an alias defined in the Fish configuration that runs the corresponding target in the Makefile.

[1Password](https://1password.com) is used for managing SSH authentication and signing keys. 
Use the built-in configuration tools within 1Password to modify the `~/.ssh/config` file automatically.
