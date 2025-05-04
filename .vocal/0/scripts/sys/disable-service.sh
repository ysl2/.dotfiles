#!/bin/sh

main() {
    sudo rm /etc/systemd/system/"$1".service
    sudo rm /etc/systemd/system/multi-user.target.wants/"$1".service
}

main "$@"
