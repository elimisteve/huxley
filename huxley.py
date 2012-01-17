#!/usr/bin/env python
# Steve Phillips / elimisteve
# 2011.11.04

# Huxley, v0.1

# 'As Huxley remarked in Brave New World Revisited, the
# civil libertarians and rationalists who are ever on the alert
# to oppose tyranny "failed to take into account
# man's almost infinite appetite for distractions."'
# --Neil Postman

import os, sys, time

def block_distracting_websites():
    """
    Uncomments lines in /etc/hosts that redirect traffic (e.g., HTTP
    GET requests) from distracting sites to localhost
    """

    try:
        hosts_file = open('/etc/hosts', 'w')
    except IOError, e:
        print e
        print "Try `sudo python %s`" % (sys.argv[0])
        return

    old_contents = open('/etc/hosts', 'r').readlines()

    new_contents = []
    for line in old_contents:
        if line.startswith('#0.0.0.0'):
            line = line[1:]
        new_contents.append(line)

    hosts_file.write(''.join(new_contents))
    hosts_file.close()

    return


if __name__ == '__main__':
    delay_in_mins = 20
    while True:
        block_distracting_websites()
        time.sleep(delay_in_mins * 60)
