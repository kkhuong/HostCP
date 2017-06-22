Zeroeth Control Panel
=====================
[![Build Status](https://travis-ci.org/kkhuong/ZeroCP.svg?branch=master)](https://travis-ci.org/kkhuong/ZeroCP)

Zeroeth Control Panel, or ZeroCP, is an online web hosting control panel that provides a web-based GUI and automation tools to simplify the process of hosting a website or managing a shared web hosting server. It is designed to be a cPanel alternative for Debian based operating systems, particularly Ubuntu.


How to setup
------------
Unfortunately, we do not have an one command installer. Therefore, to use this software, you will need to do the following

- Login as `root`
- `./install1.sh`  # this makes `kkhuong` with password `TEMP_PASSWORD`
- Logout

- Login as `kkhuong`
- `./install1_1.sh`  # this install dependencies and rvm
- Logout

- Login as `kkhuong`
- `./install2.sh`
- Logout

- Login as `adminuser` with password `TEMP_PASSWORD`
- `rvm reinstall ruby-2.3.3`
- `rvm --default use ruby-2.3.3`
- `./install2_1.sh`
- Logout

- Login as `root`
- `./install3.sh`
- Logout

- Login as `kkhuong`
- `sudo chown -R :rvm /usr/local/rvm`  # do this everytime you instlled a new ruby version also do `gem install rails`
- ** We acknowledge that this is a very insecure world since any customer can simply wipe out the entire ruby directory. However this will ensure it works for now. As a counter measure, we will require a photocopy of the customer's photo id or passport before letting them have shell access for one hour.

To-Do
-----
- [ ] Update `install-dependencies.sh` to copy user default files to `/etc/skel`
- [ ] Throw away C++ code
- [ ] Create new Rails app
- [ ] Install Postgres SQL. Setup the database and have the Rails app make use of that
- [ ] Update Travis CI configuration to reflect our changes
- [ ] Get the app to take in simple commands to create new Unix user
- [ ] Write a simple test to check if number of users is 1 after the first insert
- [ ] Update Travis CI configuration to reflect our changes
- [X] Learn how to work with sockets to open up a port


Development Process
-------------------
The `master` branch contains the latest code that has been written. It is regularly built and tested, but is not guaranteed to be completely stable. [Tags](https://github.com/kkhuong/ZeroCP/tags) are created to indicate a stable version of ZeroCP.


Testing
-------
ZeroCP is still in the pre-development phrase. However, we will occasionally write new [tests](test/) for ZeroCP.

### Unit Tests

Unit test for new code, will be added as needed. Unit tests can be compiled and run
(assuming they weren't disabled in configure) with: `make check`.

### Integration Tests

There are also integration tests, written
in Python, that are run automatically on the build server.

The Travis CI system makes sure that every push to the `master` branch is built for Windows, Linux, and OS X, and that unit/sanity tests are run automatically.

Implementation Remarks
----------------------
ZeroCP is a sysadmin software. As a result, we are using Ruby to implement the API system that will be installed on shared hosting servers. The so-called API system will take commands through HTTPS and perform sysadmin tasks directly on the server. This system will also feature a file manager for direct file uploading. Note that the entire system does not have an UI; it will be built separately.
