Autostart Alternative
---------------------

I consider ``systemd/user`` as a good alternative for ``dex``'s autostart
functionality and switched to it recently. In particular, systemd solves the
issue of ``dex`` losing control over the started processes which causes
processes to live longer than the X session which could cause additional
annoyances like reboots taking a lot of time because the system is waiting for
the processes to terminate.

The following steps will help you to get to a working ``systemd/user``
configuration:

- Create the systemd user directory: ``mkdir -p ~/.config/systemd/user``
- Create an autostart target at ``~/.config/systemd/user/autostart.target``
  with the following content::

        [Unit]
        Description=Current graphical user session
        Documentation=man:systemd.special(7)
        RefuseManualStart=no
        StopWhenUnneeded=no

- Create service files at ``~/.config/systemd/user/<service name>.service`` that
  service the same purpose as the ``<service>.desktop`` files created by
  ``dex``. The service file should have at least the following content::

        [Unit]
        Description=<service description>

        [Service]
        ExecStart=<path to the executable> [<parameters>]

  - Attention: for the service to work properly it mustn't fork. Systemd will
    take care of the service management but it can only do this when the service
    doesn't fork! If the services forks and terminates the main process, systemd
    will kill all the processes related to the service. The service will
    therefore not run at all! The man page of the service should list the
    required parameters that need to be provided to the service to avoid
    forking.

- Register a service with systemd:

      ``systemctl --user add-wants autostart.target <service name>.service``

  - Unregister a service:

      ``systemctl --user disable <service name>.service``

  - List currently active services:

      ``systemctl --user list-units``

- Finally, start all services in the autostart target during startup by
  replacing the ``dex -a`` command with:

      ``systemctl --user start autostart.target``

  - Reload all service configurations after making changes to a service file:

        ``systemctl --user daemon-reload``

  - Start a service:

        ``systemctl --user start <service name>.service``

  - Check the status of a service:

        ``systemctl --user status <service name>.service``

  - Stop a service:

        ``systemctl --user stop <service name>.service``
