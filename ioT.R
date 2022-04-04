require("igraph")
require("iotables")
require("ioanalysis")

# sample input-output table
germany <- iotable_get( source = "germany_1995" )
germany_iot <- input_flow_get(germany_iot)

