module Imm_Gen (
    input [31:0] inst,
    output reg [31:0] imm
);
    always @(*) begin
	$display("Imm_Gen: Cycle=%0d, inst=%h, imm=%h", $time/10, inst, imm);
        case (inst[6:0]) 
            7'b0010011:
                imm = {{20{inst[31]}}, inst[31:20]};
            7'b0000011:
                imm = {{20{inst[31]}}, inst[31:20]};
            7'b0100011: 
                imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
            7'b1100011: 
                imm = {{19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
            7'b1101111: 
                imm = {{11{inst[31]}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};
            7'b0110111: 
                imm = {inst[31:12], 12'h000};
            7'b0010111:
                imm = {inst[31:12], 12'h000};
            default: imm = 32'h00000000;
        endcase
    end
endmodule