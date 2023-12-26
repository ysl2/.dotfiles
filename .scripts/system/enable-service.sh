#!/bin/sh

main() {
    sudo ln -s /lib/systemd/system/"$1".service /etc/systemd/system/"$1".service
    sudo ln -s /lib/systemd/system/"$1".service /etc/systemd/system/multi-user.target.wants/"$1".service
}

main "$@"
