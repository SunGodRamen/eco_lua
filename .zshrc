#!usr/bin/env
#                   ...-''''''-...
#              ..-''     ....     ''-.
#          ..-'   ..--'''    ''''-..  '.
#       .-'    ..'                  '.. '-.
#      ;    .-'                        '.  '-.
#      '-.-'           .----..           '-.  '-...
#                  .-''...... ''..          '-.    ''-........
#               .-'.-'';'    '... '-.          ''-...         ;
#             .' .'  .'        '.'-. '-.             ''''--'''
#         ..-' .'    .              '.  '-..
#       .' .-''      .          '     '-..  ''-..
#      '.. ''--.      .         '         '-.... ''--..
#         '''--.''-..  .      .'       .....---'       '''--..
#               '''-.;'''-..-'....--'''....--------------....'
#                   :     ........---''
#                   ;  ..:
#                  .-  :',;
#                .'    : '.;
#                 '.   :  ' .
#                  '.  :  ' '
#                   ;  :   ' '
#                    : :    ' '
#                    : :     ' '
#                    ; :      ' '.                       .''.
#                   :  :       '. '..                   :    ;
#                   :  :         ''. '..                '.   ;
#                    ; :            ''-.''-....          .  ;
#                    : :                ''---..'''''----'.-'
#                     '                        ''''''''''
ZSH_CUSTOM=$HOME/.ra/omz-custom

export PATH=$HOME/bin:/usr/local/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

#     update mode
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14   
# zstyle ':omz:update' mode disabled

#     command correction
ENABLE_CORRECTION="true"

#     command hyphen mode
HYPHEN_INSENSITIVE="true"

#     waiting dots*temp (black, red, green, yellow, blue, magenta, cyan and white)
COMPLETION_WAITING_DOTS="%F{magenta}waiting...%f"

HIST_STAMPS="dd.mm.yyyy"

PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}] '$PROMPT

##  Include-Plugins ....................................................................... <<--Include-Plugins-<<

plugins=(
    git
)

#     the f*ck plugin
eval $(thefuck --alias)

##  ........................................................................................ <<--SOURCE-O-M-Z--<<
source $ZSH/oh-my-zsh.sh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


