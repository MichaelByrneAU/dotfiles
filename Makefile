.PHONY: bootstrap brew-update install-dotfiles install-rustup install-completions update-everything

# Directory that will contain all built-from-source software.
PREFIX ?= "$(HOME)/Builds"

# Run this first when setting up a new machine.
bootstrap:
	xcode-select --install
	sudo xcodebuild -license accept

# Manage brew installations using the local Brewfile.
brew-install-everything:
	brew update
	brew bundle
	brew cleanup

# Update symlinks to dotfiles.
install-dotfiles:
	mkdir -p $(HOME)/.config/fish
	stow --target $(HOME)/.config/fish fish

	mkdir -p $(HOME)/.config/wezterm
	stow --target $(HOME)/.config/wezterm wezterm

	mkdir -p $(HOME)/.config/helix
	stow --target $(HOME)/.config/helix helix

	mkdir -p $(HOME)/.config/zellij
	stow --target $(HOME)/.config/zellij zellij

	mkdir -p $(HOME)/.config/git
	stow --target $(HOME)/.config/git git

# Install Rustup to a custom prefix.
install-rustup:
	chmod +x ./scripts/install-rustup.fish
	./scripts/install-rustup.fish --prefix $(PREFIX)

# Install Zigup to a custom prefix.
install-zigup:
	chmod +x ./scripts/install-zigup.fish
	./scripts/install-zigup.fish --prefix $(PREFIX)

# Run completion generation scripts where available.
install-completions:
	chmod +x ./scripts/install-completions.fish
	./scripts/install-completions.fish

# Update everything that can be updated. 
update-everything:
	brew update
	brew cleanup
	rustup update
	zigup master --install-dir ~/Builds/zigup/zig --path-link ~/Builds/zigup/bin/zig
