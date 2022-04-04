require("igraph")
require("iotables")
require("ioanalysis")

# sample input-output table for germany_1995
germany <- iotable_get( source = "germany_1995" )
germany_iot <- input_flow_get(germany_iot)


# the number of nodes of the final Graph correspond to the number
# of entries in the input/output table
nNodes <- length(germany_iot) - 1



# Perform some economics analysis like calculating the leontief inverse.
# NOTE: the function as.inputoutput performs some economics analysis like
# calculating the Leontief inverse
transactions = germany_iot[1:nNodes,1:nNodes+1]
labels <- cbind("" ,names(germany_iot[-1]))
totals <- germany_iot[nNodes,1:nNodes+1]

io <- as.inputoutput(Z = transactions, RS_label = labels, X = totals)

print("==================== LEONTIEF INVERSE ====================")
print(io$L)


# convert the input output table into a Graph where nodes are
# industries/products and edges wieghts are associated with values in
# the table, e.g. if the flow of goods from "agriculture" to "construction"
# is assigned with the value "1", it means that there is an edge from
# the node "agriculture" to the node "construction" with weight "1".
m <- as.matrix(germany_iot[1:nNodes,1:nNodes+1])
g <- graph_from_adjacency_matrix(m, mode="directed", weighted=TRUE)


# calculate some centrality measures for the graph obtained from the
# sample germany_1995 iot.
Betweenness <- betweenness(g)
Closeness <- closeness(g)
Eigen <- evcent(g)$vector
Degree <- degree(g)

centralities <- cbind(Betweenness, Closeness, Eigen, Degree)

print("================== CENTRALITY MEASURES ==================")
print(centralities)
