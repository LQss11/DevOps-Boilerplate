# Library chart
In this example you can find a chart with type `library` which will allow us to reuse the same definitions multiple times through multiple charts/subcharts

# Quick Start
Once your library templates ready, there are few simple steps to follow:
- Create a new chart (where you want to use the libchart)
- Add the following lines in **Chart.yaml** to reference the libchart:
```yaml
dependencies:
  - name: <libchart-name> # specified in Chart.yaml of the library chart  
    version: 0.1.0 # libchart version
    repository: file://path/to/libchart # you can use file://../libs/libchart or  file://libs/libchart as examples (you could use URL aswell) ...
```
- Now that you have specified that chart you will have to either run `helm dependency update` or `helm dependency build`

>Running this command will generate a **Chart.lock** file about the information of the libraries used and create a compressed file in **/charts** DIR.

- Now you can use multiple subcharts inside that chart and you will only need to specify **.yaml** files inside **/templates** and you are ready to go to use the libchart **.tpl** definitions. 

>All subcharts of that chart will have access to the library's definitions aswell
## Notice
In order to tell that this is a library chart you will need to update the `type` value in **Chart.yaml** to library instead of application.