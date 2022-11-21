# Battery Notify

[Original post](https://www.ejmastnak.com/tutorials/arch/basics/battery-alert.html)

## Copy files
```bash
cp battery-notify.sh $HOME/scripts/battery-notify.sh
cp battery-notify.service $HOME/.config/systemd/user/battery-notify.service
cp battery-notify.timer $HOME/.config/systemd/user/battery-notify.timer
```

## Enable & start
```bash
systemctl --user daemon-reload
systemctl --user enable --now battery-notify.timer

# Optionally check that the timer is active
systemctl --user list-timers
```
