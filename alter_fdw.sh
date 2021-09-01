#!/bin/bash
dir=`pwd`
file="$dir/$1"
> $dir/alter_fdw_sql.sh
while IFS=: read -r f1 f2 f3
do
> $dir/test.sql
echo "begin;"   >> $dir/test.sql
echo "ALTER SERVER meta_server OPTIONS (SET host '172.24.2.3', SET dbname 'META_5.0_NEW',SET port '5432');"   >> $dir/test.sql
echo "commit;"   >> $dir/test.sql
cp $dir/test.sql $dir/teda_$f1.sql
echo "PGPASSWORD=Tr@deEdge181 psql -h $f3  -U \"$f2\" -d \"$f1\" -p 5432 -f \"$dir/teda_$f1.sql\" > \"$dir/Out_$f1.txt\""   >> $dir/alter_fdw_sql.sh
done <"$file"
