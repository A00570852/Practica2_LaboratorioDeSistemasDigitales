--  A testbench has no ports.
entity halfAdder_tb is
end halfAdder_tb;

architecture behav of halfAdder_tb is
  --  Declaration of the component that will be instantiated.
  component halfAdder
  port (a,b: in bit;
  s,c: out bit);
end component;

  --  Specifies which entity is bound with the component.
  for adder_0: halfAdder use entity work.halfAdder;
  signal a, b, s, cout : bit;
begin
  --  Component instantiation.
  adder_0: halfAdder port map (a, b, s, cout);

  --  This process does the real job.
  process
    type pattern_type is record
      --  The inputs of the adder.
      i0, i1: bit;
      --  The expected outputs of the adder.
      s, co : bit;
    end record;
    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('0', '0', '0', '0'),
       ('0', '1', '1', '0'),
       ('1', '0', '1', '0'),
       ('1', '1', '0', '1'));
  begin
    --  Check each pattern.
    for i in patterns'range loop
      --  Set the inputs.
      a <= patterns(i).i0;
      b <= patterns(i).i1;
      --  Wait for the results.
      wait for 1 ns;
      --  Check the outputs.
      assert s = patterns(i).s
        report "bad sum value" severity error;
      assert cout = patterns(i).co
        report "bad carry out value" severity error;
    end loop;
    assert false report "end of test" severity note;
    --  Wait forever; this will finish the simulation.
    wait;
  end process;

end behav;
