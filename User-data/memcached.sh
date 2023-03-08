#!/bin/bash
yum install memcached -y
chkconfig memcached on
service memcached start
service memcached status
