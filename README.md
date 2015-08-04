# Meteor.sh

## What?

Meteor-tools.sh is a simple Shellscript to setup a Meteor server and deploy Meteor apps to it.

## Why?

Because deploying to custom servers should be as simple as everything else in Meteor.

## Awesome, tell me what to do.

### Before we start:

Meteor.sh assumes that you have some kind of Debian-Server and root access to it.

### Example:

* meteor deploy server
* setup debian minimal 64 Bit with root password
* etc/apt/sources.list  #remove cd-rom

apt-get install ssh git

git clone https://github.com/harald42/meteor-tools.sh.git

nano /etc/ssh/sshd_config

FROM:
PermitRootLogin without-password
TO:
PermitRootLogin yes

/etc/init.d/ssh restart

--------------------------------

Move the `meteor.sh` file into your project dir and change the `APP_HOST` variable.

Meteor.sh will try to SSH as root to `APP_HOST`.

#### A note on EC2 support:

If your server happens to be an Amazon EC2 instance, uncomment the `EC2_PEM_FILE` variable and point it to your pem file. Meteor.sh will then do the right things for those instances.

### Install the server:

```
copy the meteor-debianx64-setup.sh to your server
./meteor-debian64-setup.sh
```

This will install Node, Mongo and other dependencies for Meteor and Meteor.sh on `APP_HOST`.

### Deploy your app:

```
./meteor.sh deploy
```

Deploys your app to the server and starts it as a service.

## Meteorite support

Meteor.sh will detect if your project uses Meteorite and use it accordingly.
