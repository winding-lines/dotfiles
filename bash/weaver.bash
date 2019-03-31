#
# WEAVER
#
export PS1='{$( fc -ln -1 | weaver prompt)} \W $ '

# Bind Ctrl-x w to run the weaver action
alias weaver_cmd='WA=`weaver actions -p` && history -s "$WA" && echo "$WA" && eval "$WA"'
bind '"\C-xw":"weaver_cmd\n"'
# /WEAVER
