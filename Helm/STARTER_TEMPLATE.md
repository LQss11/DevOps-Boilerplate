# Create custom template
to create a custom template first get the appropriate files and formats you need then run this command:
```sh
find . -type f -exec sed -i "s/chartname/<CHARTNAME>/g" {} \;
```
execute this command `export HELMDATADIR=helm env HELM_DATA_HOME` then run :
```sh
mkdir -p $HELMDATADIR/starters
cd .. 
mv chartname $HELMDATADIR/starters
helm create --starter chartname mynewchart
```
