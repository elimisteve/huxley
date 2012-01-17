#!/bin/bash
# Steve Phillips / elimisteve
# 2012.01.17

if [ `whoami` != 'root' ]; then
    echo 'Please re-run as root'
    exit 1
fi

# Back up /etc/hosts
cp /etc/hosts /etc/hosts-prehuxley-`date +%s`
cp /etc/hosts ~/hosts-prehuxley-`date +%s`

# Alternative, arguably not-so-great way to generate /etc/hosts.
# Should work well on Debian-based Linux machines, though I'm not sure
# about... anything other OS :-D
#sed "s/YOUR_HOSTNAME/`hostname`/" hosts-sample > /etc/hosts

# Use contents of badsites.txt to generate sites blocked by /etc/hosts
echo -n "" > append_to_hosts
for badsite in `cat badsites.txt`; do
    ./huxley_blocksite.sh $badsite >> append_to_hosts
done

# Prepare /etc/hosts for our arrival
echo -e "\n\n" >> /etc/hosts
echo "####################################################################" >> /etc/hosts
echo "## Prove Huxley wrong. Do not fall prey to infinite trivialities. ##" >> /etc/hosts
echo "####################################################################" >> /etc/hosts
echo -e "\n\n" >> /etc/hosts

# Block bad sites!
cat append_to_hosts >> /etc/hosts

echo 'Bad sites blocked! Run'
echo '    sudo nano /etc/hosts'
echo 'to edit /etc/hosts, where you can manually block or unblock sites at will. Run'
echo '    sudo ./huxley_blocksite.sh yahoo.com >> /etc/hosts'
echo 'to block Yahoo, for example.'
