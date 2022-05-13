# Add quaotes to Value of each key
cat $1 | sed 's/\(^[^=]*\)=\(.*\)/export \1="\2"/' > $1

# Add env that contains characters that are not allowed  
exec env spring.application_name=example-variable-name /bin/bash