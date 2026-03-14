// PROTOTYPE System Configuration access point module
// Parameterizable-width vector
// Hard block output to PL input

(*black_box*)
module AP_VECTOR_HB_PL # (
	parameter HARD_BLOCK = "",
	parameter INTERFACE  = "",
	parameter WIDTH      = 1
) (
	output wire [WIDTH-1:0] VECTOR
);
endmodule