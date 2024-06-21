#!/bin/bash

hostid=$(($1 * 2))
r1='172.0.0.'$hostid
r2='172.32.0.'$hostid
r3='172.64.0.'$hostid
r4='172.96.0.'$hostid
r5='172.128.0.'$hostid
r6='172.160.0.'$hostid
r7='172.192.0.'$hostid
r8='172.224.0.'$hostid
ns1='192.168.0.'$(($hostid+1))
ns2='192.168.0.'$(($hostid+2))
ipmi='192.168.10.'$(($1+1))
echo "Ping all networks of GPU host $1"
echo
echo "------ East-West Fabric ------"
echo -n "ping rail0 ($r1)    : "  
ping $r1 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo -n "ping rail1 ($r2)   : "  
ping $r2 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo -n "ping rail2 ($r3)   : "
ping $r3 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo -n "ping rail3 ($r4)   : "
ping $r4 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo -n "ping rail4 ($r5)  : "
ping $r5 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo -n "ping rail5 ($r6)  : "
ping $r6 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo -n "ping rail6 ($r7)  : "
ping $r7 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo -n "ping rail7 ($r8)  : "
ping $r8 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo
echo "------ North-South Fabric ------"
echo -n "ping eth9  ($ns1)  : "  
ping $ns1 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo -n "ping eth10 ($ns2)  : "  
ping $ns2 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo
echo "------ IPMI/BMC ------"
echo -n "ping eth11 ($ipmi)  : "  
ping $ipmi -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
echo -n "ping Default GW (192.168.10.254)    : "  
ping 192.168.10.254 -c 1 -q -W 0.5 | awk '/packets/{if ($4) {print "OK";} else {print "Timeout"} }'
