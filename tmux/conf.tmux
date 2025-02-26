#set -g default-terminal "screen-256color"
set-option -a terminal-features 'xterm-256color:RGB'
# set -g default-terminal "tmux-256color"

set -g prefix C-Space
unbind C-b
bind-key C-Space send-prefix

unbind %
bind | split-window -h

unbind '"'
bind - split-window -v

unbind r
bind r source-file ~/.tmux.conf \; display "reloaded!";

bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

bind -r h select-pane -L  # move left
bind -r j select-pane -D  # move down
bind -r k select-pane -U  # move up
bind -r l select-pane -R  # move right

bind -r m resize-pane -Z

# Use leader + space to return to previous window
bind Space last-window

# Enable mouse
set -g mouse on

# Set numbering to start at 1 instead of 0
set -g base-index 1
setw -g pane-base-index 1

# Shift the tmux bar to be on top
set-option -g  status-position top

# set-window-option -g mode-keys vi

bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode after dragging with mouse

# tpm plugin
set -g @plugin 'tmux-plugins/tpm'

# Initializing catppuccin
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -g @catppuccin_flavor 'macchiato' 

set -g @catppuccin_status_background "none"
set -g @catppuccin_window_status_style "none"
set -g @catppuccin_pane_status_enabled "no"
set -g @catppuccin_pane_border_status "off"
set -g @catppuccin_window_number_position "right"
set -g @catppuccin_window_default_text "#W"
set -g @catppuccin_window_current_text "#W"

# Add icons and status on right side
set -g status-right-length 200
set -g status-right ""
set -ga status-right "#{?client_prefix,#{#[bg=#{@thm_red},fg=#{@thm_bg},bold]  #S },#{#[bg=#{@thm_bg},fg=#{@thm_green}]  #S }}"
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_maroon}]  #{pane_current_command} "
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom,|}"
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_blue}] 󰭦 %Y-%m-%d 󰅐 %H:%M "


# Set properties for left side of bar
set -g status-left " "


# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
