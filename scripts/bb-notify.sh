if [ -x ./bb ]
then
    nice /bin/bash ./bb "$@"
    status=$?
else
    nice bb "$@"
    status=$?
fi

if [ $status -eq 0 ]; then
    [ -r "$HOME/work/config/scripts/checkmark.png" ] && icon="$HOME/work/config/scripts/checkmark.png" || icon="info"
    message="SUCCESS"
else
    [ -r "$HOME/work/config/scripts/exclamation.png" ] && icon="$HOME/work/config/scripts/exclamation.png" || icon="error"
    message="FAILED"
fi

notify-send --expire-time=5000 -i $icon "$message: bb $*"

exit $status
