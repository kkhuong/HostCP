Zeroeth Control Panel
=====================

To-Do
-----
- [ ] Build a simple web UI for end users and server admins at port 2082 and 2086, respectively in PHP
- [X] Learn how to work with sockets to open up a port

Remarks
-------
We realized that the web application will be heavily accessed by multiple WSO simutaneously. Web applications are usually implemented in interpreted languages; which lacks compiler optimizations before it is deployed and running. Therefore, we are implementing our web applications in PHP, instead of Node.js or Ruby, so that they can be compiled and optimized by Zend Guard.
