#!/bin/bash

dd if=/dev/zero of=/swapfile bs=1M count=8192

chmod 600 /swapfile

mkswap /swapfile

swapon /swapfile

swapon --show
free -h
