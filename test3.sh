#!/bin/bash

ALL_MEDIA=`cat $1 | grep 'media_.*\.ts '`

echo Android
echo 50 $(echo "$ALL_MEDIA" | grep ' Android ' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
echo 75 $(echo "$ALL_MEDIA" | grep ' Android ' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.75 - 0.5)]}')
echo 95 $(echo "$ALL_MEDIA" | grep ' Android ' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
echo iPhone
echo 50 $(echo "$ALL_MEDIA" | grep 'iPhone;' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
echo 75 $(echo "$ALL_MEDIA" | grep 'iPhone;' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.75 - 0.5)]}')
echo 95 $(echo "$ALL_MEDIA" | grep 'iPhone;' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
echo iPad
echo 50 $(echo "$ALL_MEDIA" | grep 'iPad;' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
echo 75 $(echo "$ALL_MEDIA" | grep 'iPad;' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.75 - 0.5)]}')
echo 95 $(echo "$ALL_MEDIA" | grep 'iPad;' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
echo Macintosh
echo 50 $(echo "$ALL_MEDIA" | grep 'Macintosh;' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
echo 75 $(echo "$ALL_MEDIA" | grep 'Macintosh;' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.75 - 0.5)]}')
echo 95 $(echo "$ALL_MEDIA" | grep 'Macintosh;' | awk '{print $7}' | sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
