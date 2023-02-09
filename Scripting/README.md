# Useful linux scripts and commands
```sh
# Remove all newlines from end of file
sed -e :a -e '/^\n*$/{$d;N;};/\n$/ba' $FILE
# Merge multiple files line by line (useful for csv merge)
paste -d ";" file1.csv file2.csv 
```