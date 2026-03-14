// PROTOTYPE System Configuration access point module
// Parameterizable-width vector
// PL output to hard block input

(*black_box*)
module AP_VECTOR_PL_HB #(
	parameter HARD_BLOCK = "",
	parameter INTERFACE  = "",
	parameter WIDTH      = 1
) (
	input wire [WIDTH-1:0] VECTOR
);
endmodule