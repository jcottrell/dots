if exists('g:polyglot_disabled') && index(g:polyglot_disabled, 'tmux') != -1
  finish
endif

setlocal commentstring=#\ %s
