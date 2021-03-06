# Meteor-tools.sh

Meteor-tools.sh is a simple Shellscript to setup a Meteor server and deploy Meteor apps to it.

## Why?

Because deploying to custom servers should be as simple as everything else in Meteor.

### Developer PC

On OS X or Linux?

Install the latest official Meteor release from your terminal:

```
curl https://install.meteor.com/ | sh
```

Install the latest official Meteor-Kitchen release from your terminal:

```
curl http://www.meteorkitchen.com/install | /bin/sh
```

Install the latest official Meteor-Tools release from your terminal:

```
apt-get install git
git clone https://github.com/harald42/meteor-tools.sh.git
```

Move the `meteor.sh` file into your project dir and change the `APP_HOST` variable.

Meteor.sh will try to SSH as root to `APP_HOST`.

### Deploy your app:

```
./meteor.sh deploy
```

Deploys your app to the server and starts it as a service.

### Before we deploy:

Meteor.sh assumes that you have some kind of Debian-Server and root access to it.

### Example:

#### Debian-x64 meteor deploy server

* setup debian minimal 64 Bit with root password
* etc/apt/sources.list  #remove cd-rom


```
apt-get install ssh git
git clone https://github.com/harald42/meteor-tools.sh.git
nano /etc/ssh/sshd_config
```

FROM:
PermitRootLogin without-password
TO:
PermitRootLogin yes

```
/etc/init.d/ssh restart
```

Install dependencies for Meteor the server:

```
./meteor-debian64-setup.sh
```

This will install Node, Mongo and other dependencies for Meteor and Meteor.sh on `APP_HOST`.

----


#### A note on EC2 support:

If your server happens to be an Amazon EC2 instance, uncomment the `EC2_PEM_FILE` variable and point it to your pem file. Meteor.sh will then do the right things for those instances.

## Meteorite support

Meteor.sh will detect if your project uses Meteorite and use it accordingly.
