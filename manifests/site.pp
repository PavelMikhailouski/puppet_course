#$set0 = ['ntp', 'tmux']

node default {
include lamp
}

node 'vm1' {
include ntp
include tmux
include git
}
