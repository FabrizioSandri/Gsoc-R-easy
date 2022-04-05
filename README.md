#  Easy tests for GSOC-R
This repository contains some basic tests for the project "Network analysis for input output tables" of GSOC 2022.
Results for the Medium and Hard parts can be found [here](https://github.com/FabrizioSandri/Gsoc-R).

## Installation
Before running the script, it is mandatory to install all the missing dependencies needed for the correct execution of the code.
This simple project depends on the following packages:
* iotables
* ioanalysis
* igraph

To install them all just follow the standard package installation routine from CRAN
```R
install.packages("iotables", "ioanalysis", "igraph")
```

## Tests description
All the tests are written in the `iot.R` file. To execute the tests just source `iot.R` into a working R environment after installing all the dependencies specified in the previous section.

In the first part `iotables` package is used in order to load the sample Input-Output Table `Germany 1995` and extract the input flow.
All the tests are based on this small Input-Output Table, which is taken from the Eurostat Manual.

In the second part the library `ioanalysis` is used with its functions to perform some basic economic analysis, like calculating the Leontief inverse matrix. This matrix is calculated using `as.inputoutput` which loads an Input-Output Table and performs some preprocessing to calculate the Leontief inverse matrix and other useful function in order to simplify some other function of the library.

In the third and last part the Input-Output Table is parsed into a graph suitable for the library `igraph`. This library has some useful functions that allow you to quickly calculate some centrality measures. The centrality measures calculated in this project are 4 : `Betweenness`, `Closeness`, `Eigenvector` and `Degree`.

All this results are printed to the standard output.


## Future work
The graph obtained at the third step described in the previous section can be easily sent to a Rcpp library, like to the `Dijkstra` algorithm written for the [Medium-Hard tests](https://github.com/FabrizioSandri/Gsoc-R).
For example the distance vector for the `construction` node of the graph can be obtained with the same procedure illustrated in the following code snippet.

```R
require("Dijkstra")
distanceVector <- dijkstraSparseMatrix(as_adj(g, attr = "weight"), "construction")
```

Where `g` is the graph generated from the Input-Output Table `Germany 1995`.