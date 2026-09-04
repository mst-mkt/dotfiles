# mst-mkt/dotfiles

Declarative [NixOS](https://github.com/NixOS/nixpkgs) and [nix-darwin](https://github.com/nix-darwin/nix-darwin) configurations with [Home Manager](https://github.com/nix-community/home-manager), structured with [Denix](https://github.com/yunfachi/denix).

| Host       | Machine                    | System         | Type   | Usage    | Status |
| ---------- | -------------------------- | -------------- | ------ | -------- | ------ |
| dirtmouth  | ASUS Zenbook 14 (UX3405MA) | x86_64-linux   | laptop | personal | active |
| crossroads | GMKtec NucBox G3 Plus      | x86_64-linux   | server | personal | active |
| greenpath  | MacBook Pro (M2 Pro)       | aarch64-darwin | laptop | work     | active |

## Usage

```sh
nh os switch ~/dotfiles
```

```sh
nh darwin switch ~/dotfiles
```

## Structure

- `denix/` denix extensions (host submodules, features)
- `hosts/` host definitions
  - `nixos/` NixOS hosts
  - `darwin/` nix-darwin hosts
- `modules/` configuration modules
  - `core/` base system (nix, boot, users, ...)
  - `desktop/` desktop environments
    - `linux/` (niri, fcitx5, gtk, ...)
    - `macos/` (azookey)
  - `programs/` applications (ghostty, neovim, git, ...)
  - `services/` system services (pipewire, openssh, ...)
- `secrets/` age-encrypted secrets
- `wallpapers/` wallpaper images

## Setup

### NixOS

Boot the [NixOS installer](https://nixos.org/download) on the target machine and clone this repository.

```sh
nix-shell -p git
git clone https://github.com/mst-mkt/dotfiles ~/dotfiles
```

Define the host in `hosts/nixos/<host>/` (`default.nix`, `disko.nix`, `hardware.nix`), following the existing hosts, and stage it.

```sh
nixos-generate-config --no-filesystems --show-hardware-config > ~/dotfiles/hosts/nixos/<host>/hardware.nix
git -C ~/dotfiles add hosts/nixos/<host>
```

Partition the disk with disko and install.

```sh
sudo nix run --extra-experimental-features "nix-command flakes" github:nix-community/disko/latest -- --mode destroy,format,mount --flake ~/dotfiles#<host>
```

```sh
sudo nixos-install --flake ~/dotfiles#<host>
```

Copy the repository into the new system.

```sh
cp -r ~/dotfiles /mnt/home/mst-mkt/dotfiles
sudo nixos-enter --root /mnt -- chown -R mst-mkt:users /home/mst-mkt/dotfiles
```

### macOS

Install Nix with the [official installer](https://nixos.org/download) and clone this repository.

```sh
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh
```

```sh
nix-shell -p git
git clone https://github.com/mst-mkt/dotfiles ~/dotfiles
```

Define the host in `hosts/darwin/<host>/` (`default.nix`), following the existing hosts, and stage it.

```sh
git -C ~/dotfiles add hosts/darwin/<host>
```

Activate the system with nix-darwin.

```sh
sudo nix run --extra-experimental-features "nix-command flakes" nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles#<host>
```
