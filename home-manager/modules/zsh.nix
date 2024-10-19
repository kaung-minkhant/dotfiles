{ pkgs, ... }:
{
  programs.zsh = {
    enable = false;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };

    shellAliases = {
      hm-switch = "home-manager switch --impure";
    };
    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };
  };
}
