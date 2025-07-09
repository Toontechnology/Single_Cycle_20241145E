module ALU (
    input [31:0] op1,
    input [31:0] op2,
    input [3:0] alu_op,
    output reg [31:0] result,
    output reg zero
);
    always @(*) begin
	$display("ALU: Cycle=%0d, op1=%h, op2=%h, alu_op=%b, result=%h",
                 $time/10, op1, op2, alu_op, result);
        case (alu_op)
            4'b0000: result = op1 + op2; 
            4'b0001: result = op1 - op2; 
            4'b0010: result = op1 & op2; 
            4'b0011: result = op1 | op2; 
            4'b0100: result = op1 ^ op2; 
            4'b0101: result = op1 << op2[4:0]; 
            4'b0110: result = op1 >> op2[4:0]; 
            4'b0111: result = $signed(op1) >>> op2[4:0]; 
            4'b1000: result = ($signed(op1) < $signed(op2)) ? 32'h1 : 32'h0; 
            4'b1001: result = (op1 < op2) ? 32'h1 : 32'h0; 
            default: result = 32'h00000000;
        endcase
        zero = (result == 32'h00000000);
    end
endmodule