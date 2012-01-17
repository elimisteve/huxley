#!/bin/bash
# Steve Phillips / elimisteve
# 2011.11.09

# Uncomment lines beginning with #0.0.0.0
sed -i 's/^#0.0.0.0/0.0.0.0/g' /etc/hosts
