Zeroeth Control Panel
=====================

[![Build Status](https://travis-ci.org/kkhuong/ZeroCP.svg?branch=master)](https://travis-ci.org/kkhuong/ZeroCP)

Zeroeth Control Panel, or ZeroCP, is an online web hosting control panel that provides a web-based GUI and automation tools to simplify the process of hosting a website or managing a shared web hosting server. It is designed to be a cPanel alternative for Debian based operating systems, particularly Ubuntu.

To-Do
-----
- [ ] Build a simple web UI for end users and server admins at port 2082 and 2086, respectively in PHP
- [X] Learn how to work with sockets to open up a port

Development Process
-------------------
The `master` branch contains the latest code that has been written. It is regularly built and tested, but is not guaranteed to be completely stable. [Tags](https://github.com/kkhuong/ZeroCP/tags) are created to indicate a stable version of ZeroCP.

Implementation Remarks
----------------------
We realized that the web application will be heavily accessed by multiple WSO simutaneously. Web applications are usually implemented in interpreted languages; which lacks compiler optimizations before it is deployed and running. Therefore, we are implementing our web applications in PHP, instead of Node.js or Ruby, so that they can be compiled and optimized by Zend Guard.
