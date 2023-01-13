# Useful linux scripts and commands
```sh
# Remove all newlines from end of file
sed -e :a -e '/^\n*$/{$d;N;};/\n$/ba' $FILE
```