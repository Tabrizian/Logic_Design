library verilog;
use verilog.vl_types.all;
entity f2_and_or is
    port(
        O               : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        d               : in     vl_logic
    );
end f2_and_or;