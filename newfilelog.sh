#!/bin/bash

cat log | awk '{for(i=1;i<=16;i++)printf("%s ",$i);print "\r"}' >> $1.log
