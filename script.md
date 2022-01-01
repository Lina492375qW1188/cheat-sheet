Mac OS

Remove the first line
```
sed -i '' '1d' filename
```

Clusters

For loop
```
for i in {1..3};
do
sed -i '' '2,5d' $i/filename
done
```
