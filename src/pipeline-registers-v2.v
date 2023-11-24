module IF_ID_Register(
    input clk,
    input reset,
    input [31:0] instruction_in,
    input [31:0] pc_in,
    output reg [31:0] instruction_out,
    output reg [31:0] pc_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        instruction_out <= 32'b0;
        pc_out <= 32'b0;
    end else begin
        instruction_out <= instruction_in;
        pc_out <= pc_in;
    end
end

endmodule

module ID_EX_Register(
    input clk,
    input reset,
    input [31:0] instruction_in,
    input [31:0] pc_in,
    input [8:0] control_signals_in, // Adjust the width as needed
    output reg [31:0] instruction_out,
    output reg [31:0] pc_out,
    output reg [8:0] control_signals_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        instruction_out <= 32'b0;
        pc_out <= 32'b0;
        control_signals_out <= 9'b0;
    end else begin
        instruction_out <= instruction_in;
        pc_out <= pc_in;
        control_signals_out <= control_signals_in;
    end
end

endmodule

module EX_MEM_Register(
    input clk,
    input reset,
    input [31:0] alu_result_in,
    input [31:0] write_data_in, // Data to be written to memory
    input [4:0] write_reg_in,   // Register to write back to
    input [8:0] control_signals_in,
    output reg [31:0] alu_result_out,
    output reg [31:0] write_data_out,
    output reg [4:0] write_reg_out,
    output reg [8:0] control_signals_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        alu_result_out <= 32'b0;
        write_data_out <= 32'b0;
        write_reg_out <= 5'b0;
        control_signals_out <= 9'b0;
    end else begin
        alu_result_out <= alu_result_in;
        write_data_out <= write_data_in;
        write_reg_out <= write_reg_in;
        control_signals_out <= control_signals_in;
    end
end

endmodule

module MEM_WB_Register(
    input clk,
    input reset,
    input [31:0] alu_result_in,
    input [31:0] mem_data_in, // Data read from memory
    input [4:0] write_reg_in,
    input [8:0] control_signals_in,
    output reg [31:0] alu_result_out,
    output reg [31:0] mem_data_out,
    output reg [4:0] write_reg_out,
    output reg [8:0] control_signals_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        alu_result_out <= 32'b0;
        mem_data_out <= 32'b0;
        write_reg_out <= 5'b0;
        control_signals_out <= 9'b0;
    end else begin
        alu_result_out <= alu_result_in;
        mem_data_out <= mem_data_in;
        write_reg_out <= write_reg_in;
        control_signals_out <= control_signals_in;
    end
end

endmodule