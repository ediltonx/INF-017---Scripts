#!/bin/bash

ifconfig enp0s3 up; 
dhclient enp0s3;
ifconfig;

