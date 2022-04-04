require("igraph")
require("iotables")
require("ioanalysis")

# sample input-output table
germany <- iotable_get( source = "germany_1995" )
germany_iot <- input_flow_get(germany_iot)

# the number of nodes of the final Graph correspond to the number
# of entries in the input/output table
nNodes <- length(germany_iot) - 1

# convert the input output table into a Graph where nodes are
# industries/products and edges wieghts are associated with values in
# the table, e.g. if the flow of goods from "agriculture" to "construction"
# is assigned with the value "1", it means that there is an edge from
# the node "agriculture" to the node "construction" with weight "1".
m <- as.matrix(germany_iot[1:nNodes-1,2:nNodes])
g <- graph_from_adjacency_matrix(m, mode="directed", weighted=TRUE)


