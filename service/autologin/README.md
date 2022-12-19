https://jackcuthbert.dev/blog/automated-login-in-arch-linux


Not working ...


https://unix.stackexchange.com/a/42362

This is described in the [ArchWiki](https://wiki.archlinux.org/title/Getty#Automatic_login_to_virtual_console):

Create a new service file similar to getty@.service by copying it to `/etc/systemd/system/`

```
cp /usr/lib/systemd/system/getty@.service /etc/systemd/system/autologin@.service
```

This basically copies the already existing `getty@.service` to a new file `autologin@.service` which can be freely modified. It is copied to `/etc/systemd/system` because that's where site-specific unit files are stored. `/usr/lib/systemd/system` contains unit files provided by packages so you shouldn't change anything in there.


You will then have to symlink that autologin@.service to the getty service for the tty on which you want to autologin, for examply for tty1:

```
ln -s /etc/systemd/system/autologin@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
```

Up to now, this is still the same as the usual getty@.service file, but the most important part is to modify the `autologin@.service` to actually log you in automatically. To do that, you only need to change the `ExecStart` line to read

```
ExecStart=-/sbin/agetty -a USERNAME %I 38400
```

The difference between the `ExecStart` line in `getty@.service` and `autologin@.service` is only the `-a USERNAME` which tells agetty to log the user with the username USERNAME in automatically.

Now you only have to tell systemd to reload its daemon files and start the service:

```
systemctl daemon-reload
systemctl start getty@tty1.service
```

(I'm not sure if the service will start properly if you're already logged in on tty1, the safest way is probably to just reboot instead of starting the service).

If you then want to automatically start X, insert the following snippet into your `~/.bash_profile` (taken from [the wiki](https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login) again):

```
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi
```
You will have to modify your `~/.xinitrc` to start your desktop environment, how to do that depends on the DE and is probably described in the ArchWiki as well.