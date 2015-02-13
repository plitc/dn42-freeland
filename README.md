
Background
==========
* dn42 address space

Dependencies
============
* lang/ruby + gems

install dn42-freeland on FreeBSD inside Jail
============================================
```
pkg install devel/ruby-gems
pkg install devel/rubygem-json
pkg install www/rubygem-sinatra
pkg install devel/git
gem install netaddr

adduser freeland
git clone https://github.com/plitc/dn42-freeland.git

# ./dn42-freeland.sh
```

Features
========
```
Occupancy of dn42 address space,
computed from 'inetnum' objects in
the registry. Hover a bar to get
information.
```
Platform
========
* Unix/Linux

Usage
=====
```
# vi /etc/crontab

### ### ###
*/1       *       *       *       *       freeland   (/home/freeland/github/dn42-freeland; /home/freeland/github/dn42-freeland/dn42-freeland.sh)
### ### ###
```
Screenshot
==========
![dn42-freeland](/content/dn42-freeland.jpg)

Errata
======

