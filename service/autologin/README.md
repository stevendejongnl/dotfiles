# Automated Login In Arch Linux

Create a directory named `getty@tty1.service.d/` inside the systemd system unit files directory:

```bash
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
```

Create a file in this folder called override.conf with the following content:

```conf
# /etc/systemd/system/getty@tty1.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin YOUR_USERNAME_HERE --noclear %I $TERM
```
> **_NOTE:_**  The empty ExecStart clears the execution. The second one wil set our new execution.

That's it! On next reboot, it will skip the tty1 login step and go straight to your window manager.