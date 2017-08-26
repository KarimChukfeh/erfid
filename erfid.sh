#! /bin/sh
# /etc/init.d/erfid

### BEGIN INIT INFO
# Provides:          erfid
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Run ERFID at boot
# Description:       A simple script from www.stuffaboutcode.com which will start / stop a program a boot / shutdown.
### END INIT INFO

# If you want a command to always run, put it here

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting erfid, run sudo tmux attach"
    # run application you want to start
    /usr/bin/tmux new-session -d -s erfid 'sudo ruby /home/pi/erfid-wifi/erfid/erfid.rb'
    ;;
  stop)
    echo "Stopping erfid"
    # kill application you want to stop
    /usr/bin/tmux kill-session -t erfid
    ;;
  *)
    echo "Usage: /etc/init.d/erfid {start|stop}"
    exit 1
    ;;
esac

exit 0
