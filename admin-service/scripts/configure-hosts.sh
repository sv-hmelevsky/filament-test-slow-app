#!/bin/bash
# Debug information: output current /etc/hosts
echo "Current content of /etc/hosts:"
cat /etc/hosts

# Adding an entry to /etc/hosts
echo "127.0.0.1 admin-service.ru" >> /etc/hosts

# And again the output of /etc/hosts after adding the entry
echo "Updated content of /etc/hosts:"
cat /etc/hosts

exec "$@"
