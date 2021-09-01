#!/bin/bash
dir=`pwd`
outpt=$1
echo $outpt | cut -c1-9
ot=`echo $outpt | cut -c1-9`
file="$dir/$1"
> $dir/alter_fdw.sql
while read line
do
echo "begin;"   >> $dir/alter_fdw.sql
echo "ALTER SERVER meta_server OPTIONS (SET host '172.24.2.3', SET dbname 'META_5.0_NEW',SET port '5432');"   >> $dir/alter_fdw.sql
echo "Commit;"   >> $dir/alter_fdw.sql
done <"$file"
mv $dir/alter_fdw.sql  $dir/alter_fdw_$ot.sql
chmod 777 $dir/*
