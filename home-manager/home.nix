{ config, pkgs, ... }:
let
  username = "kaungminkhant";
  homeDirectory = "/home/${username}";
  relativeHomeDirectory = ../..;

  dotfilesGit = pkgs.fetchgit {
    url = "https://github.com/kaung-minkhant/dotfiles.git";
    hash = "sha256-xEeqvAjDHqo+BKAtlhaIHpGHYVZvTxnbLQX5lG8VOJg="; 
  };

  dotfilesLocal = homeDirectory + "/dotfiles";

  dotfiles = dotfilesLocal;
in
{
  imports = [ 
    ./modules/tmux.nix 
    ./modules/zsh.nix
  ];
  home.username = username;
  home.homeDirectory = homeDirectory;

  home.stateVersion = "24.05";

  home.packages = with pkgs; [

    # editor
    unstable.neovim

		# version control
    gh
    lazygit

    # archives
    zip 
		xz
		unzip
		p7zip

    # i3 related
    feh ## image viewer / wallpaper setter
    arandr ## monitor settings
    pulseaudioFull
    playerctl
    lxappearance
    i3blocks
    xdotool
    acpi
    pavucontrol
    # xorg.xf86videointel

    # clipboards
    xclip
    wl-clipboard

    # downloaders
    curl

    # build tools
    gcc9 
    glib
    gnumake

		# utils
    moreutils
    neofetch
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    iw
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

		# productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')


    # programming
    nodejs_22
    go
  ] ;

  programs = {
    git = {
      enable = true;
      userEmail = "kaungminkhant.official@gmail.com";
      userName = "kaung-minkhant";
      aliases = {
        co = "checkout";
        br = "branch";
        st = "status";
        cm = "commit";
      };
    };
    vim = {
      enable = true;
      settings = {
        relativenumber = true;
        number = true;
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
      };
      extraConfig = ''
        imap jj <Esc>
      '';
    };
    vscode = {
      enable = false;
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        bbenoist.nix
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "remote-ssh-edit";
          publisher = "ms-vscode-remote";
          version = "0.47.2";
          sha256 = "sha256-LxFOxkcQNCLotgZe2GKc2aGWeP9Ny1BpD1XcTqB85sI=";
        }
      ];
      userSettings = {
        "terminal.integrated.defaultProfile.linux" = "null";
        #"terminal.integrated.shell.linux" = "/run/current-system/sw/bin/bash";
      };
    };
    chromium = {
      enable = false;
      package = pkgs.brave;
      extensions = [
        {
          id = "jlmpjdjjbgclbocgajdjefcidcncaied";
        }
      ];
    };
    direnv = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    bash.enable = false;
    starship = {
      enable = false;
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    #".screenrc".source = /home/kaung-min-khant/dotfiles/screenrc;
    #"config/.hello".source = dotfiles/hello;
    "sample" = {
      source = dotfiles + "/sample";
      target = "/.config/.sample";
      enable = true;
    };
    "starship" = {
      source = dotfiles + "/starship.toml";
      target = "/.config/starship.toml";
      enable = false;
    };
    "nvim" = {
      source = dotfiles + "/nvim";
      target = "/.config/nvim";
      recursive = true;
      enable = true;
    };
    "i3blocks" = {
      source = dotfiles + "/i3/blocks/config";
      target = "/.config/i3blocks/config";
      enable = true;
    };
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kaung-min-khant/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
		HELLO = "hello kaung";
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
