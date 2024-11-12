# init
```bash
# zellij
curl https://sh.rustup.rs -sSf | sh
cargo install --locked zellij
mkdir ~/.config/zellij
zellij setup --dump-config > ~/.config/zellij/config.kdl


sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved

brew install mcfly
echo 'eval "$(mcfly init zsh)"' >> ~/.zshrc
```
