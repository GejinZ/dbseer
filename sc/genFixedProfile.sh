#!/bin/bash

win=2500
episode=5
tps=2000

#header
echo "680 10000 100 0 0 0 0 0 0 0 0 0 0" > t1
echo "680 10000 0 100 0 0 0 0 0 0 0 0 0" > t2
echo "680 10000 0 0 100 0 0 0 0 0 0 0 0" > t3
echo "680 10000 0 0 0 100 0 0 0 0 0 0 0" > t4
echo "680 10000 0 0 0 0 100 0 0 0 0 0 0" > t5
echo "680 10000 20 20 20 20 20 0 0 0 0 0 0" > t12345
echo "680 10000 10 30 20 10 30 0 0 0 0 0 0" > t12345-diff
echo "680 10000 50 50 0 0 0 0 0 0 0 0 0" > t12
echo "680 10000 50 0 50 0 0 0 0 0 0 0 0" > t13
echo "680 10000 50 0 0 50 0 0 0 0 0 0 0" > t14
echo "680 10000 50 0 0 0 50 0 0 0 0 0 0" > t15
echo "680 10000 0 50 50 0 0 0 0 0 0 0 0" > t23
echo "680 10000 0 50 0 50 0 0 0 0 0 0 0" > t24
echo "680 10000 0 50 0 0 50 0 0 0 0 0 0" > t25
echo "680 10000 0 0 50 50 0 0 0 0 0 0 0" > t34
echo "680 10000 0 0 50 0 50 0 0 0 0 0 0" > t35
echo "680 10000 0 0 0 50 50 0 0 0 0 0 0" > t45

echo "650 1 100 0 0 0 0 0 0 0 0 0 0" >> t1
echo "650 1 0 100 0 0 0 0 0 0 0 0 0" >> t2
echo "650 1 0 0 100 0 0 0 0 0 0 0 0" >> t3
echo "650 1 0 0 0 100 0 0 0 0 0 0 0" >> t4
echo "650 1 0 0 0 0 100 0 0 0 0 0 0" >> t5
echo "650 1 20 20 20 20 20 0 0 0 0 0 0" >> t12345
echo "650 1 10 30 20 10 30 0 0 0 0 0 0" >> t12345-diff
echo "650 1 50 50 0 0 0 0 0 0 0 0 0" >> t12
echo "650 1 50 0 50 0 0 0 0 0 0 0 0" >> t13
echo "650 1 50 0 0 50 0 0 0 0 0 0 0" >> t14
echo "650 1 50 0 0 0 50 0 0 0 0 0 0" >> t15
echo "650 1 0 50 50 0 0 0 0 0 0 0 0" >> t23
echo "650 1 0 50 0 50 0 0 0 0 0 0 0" >> t24
echo "650 1 0 50 0 0 50 0 0 0 0 0 0" >> t25
echo "650 1 0 0 50 50 0 0 0 0 0 0 0" >> t34
echo "650 1 0 0 50 0 50 0 0 0 0 0 0" >> t35
echo "650 1 0 0 0 50 50 0 0 0 0 0 0" >> t45


for ((i=100;i<=1000;i=i+100))
do 
echo "120 $i 100 0 0 0 0 0 0 0 0 0 0" >> t1
echo "120 $i 0 100 0 0 0 0 0 0 0 0 0" >> t2
echo "120 $i 0 0 100 0 0 0 0 0 0 0 0" >> t3
echo "120 $i 0 0 0 100 0 0 0 0 0 0 0" >> t4
echo "120 $i 0 0 0 0 100 0 0 0 0 0 0" >> t5
echo "120 $i 20 20 20 20 20 0 0 0 0 0 0" >> t12345
echo "120 $i 10 30 20 10 30 0 0 0 0 0 0" >> t12345-diff
echo "120 $i 50 50 0 0 0 0 0 0 0 0 0" >> t12
echo "120 $i 50 0 50 0 0 0 0 0 0 0 0" >> t13
echo "120 $i 50 0 0 50 0 0 0 0 0 0 0" >> t14
echo "120 $i 50 0 0 0 50 0 0 0 0 0 0" >> t15
echo "120 $i 0 50 50 0 0 0 0 0 0 0 0" >> t23
echo "120 $i 0 50 0 50 0 0 0 0 0 0 0" >> t24
echo "120 $i 0 50 0 0 50 0 0 0 0 0 0" >> t25
echo "120 $i 0 0 50 50 0 0 0 0 0 0 0" >> t34
echo "120 $i 0 0 50 0 50 0 0 0 0 0 0" >> t35
echo "120 $i 0 0 0 50 50 0 0 0 0 0 0" >> t45

echo "360 1 100 0 0 0 0 0 0 0 0 0 0" >> t1
echo "360 1 0 100 0 0 0 0 0 0 0 0 0" >> t2
echo "360 1 0 0 100 0 0 0 0 0 0 0 0" >> t3
echo "360 1 0 0 0 100 0 0 0 0 0 0 0" >> t4
echo "360 1 0 0 0 0 100 0 0 0 0 0 0" >> t5
echo "360 1 20 20 20 20 20 0 0 0 0 0 0" >> t12345
echo "360 1 10 30 20 10 30 0 0 0 0 0 0" >> t12345-diff
echo "360 1 50 50 0 0 0 0 0 0 0 0 0" >> t12
echo "360 1 50 0 50 0 0 0 0 0 0 0 0" >> t13
echo "360 1 50 0 0 50 0 0 0 0 0 0 0" >> t14
echo "360 1 50 0 0 0 50 0 0 0 0 0 0" >> t15
echo "360 1 0 50 50 0 0 0 0 0 0 0 0" >> t23
echo "360 1 0 50 0 50 0 0 0 0 0 0 0" >> t24
echo "360 1 0 50 0 0 50 0 0 0 0 0 0" >> t25
echo "360 1 0 0 50 50 0 0 0 0 0 0 0" >> t34
echo "360 1 0 0 50 0 50 0 0 0 0 0 0" >> t35
echo "360 1 0 0 0 50 50 0 0 0 0 0 0" >> t45

done

18 1 20 20 20 20 20 0 0 0 0 0 0
18 1 20 20 20 20 20 0 0 0 0 0 0
