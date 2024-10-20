{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "M-j";
    baseIndex = 1;
    clock24 = false;
    disableConfirmationPrompt = true;
    escapeTime = 0; # Time in milliseconds for which tmux waits after an escape is input.
    keyMode = "vi";
    mouse = true;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g status-position top
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
          set -g @catppuccin_status_modules_right "directory date_time"
          set -g @catppuccin_status_modules_left "session"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator " "
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"
          set -g @catppuccin_directory_text "#{b:pane_current_path}"
          set -g @catppuccin_date_time_text "%H:%M"
        '';
      }
      tmuxPlugins.sensible
      {
        plugin = tmuxPlugins.yank;
        extraConfig = ''
          set -g @shell_mode 'vi'
          set -g @yank_selection 'clipboard'
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.tmux-thumbs;
        extraConfig = ''
          set -g @thumbs-command 'tmux set-buffer -- {} && echo {} | xclip -selection clipboard && tmux display-message \"Copied {}\"'
          set -g @thumbs-upcase-command 'tmux set-buffer -- {} && echo {} | xclip -selection clipboard && tmx paste-buffer && tmux display-message \"Copied {}\"'
        '';
      }
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
        extraConfig = ''
          set -g @vim_navigator_mapping_left "C-Left C-h"
          set -g @vim_navigator_mapping_right "C-Right C-l"
          set -g @vim_navigator_mapping_up "C-k"
          set -g @vim_navigator_mapping_down "C-j"
          set -g @vim_navigator_mapping_prev ""
        '';
      }
    ];
    sensibleOnTop = false;
    shell = null;
    terminal = "screen-256color";
    tmuxinator.enable = false;
    newSession = false; # Automatically spawn a session if trying to attach and none are running.
    extraConfig = ''
      unbind C-b

      unbind-key -T copy-mode-vi Space
      unbind-key -T copy-mode-vi 'v'
      unbind-key '"'
      unbind-key %

      unbind p
      unbind n
      bind p previous-window
      bind n next-window

      bind r command-prompt "rename-window %%"

      bind s split-window -v -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"

      unbind j
      unbind k
      unbind l
      unbind h
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      set -g display-time 2000
      set -g renumber-windows on
      set -g set-clipboard on

      bind -T copy-mode-vi v send -X begin-selection

      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'
    '';
  };
}
