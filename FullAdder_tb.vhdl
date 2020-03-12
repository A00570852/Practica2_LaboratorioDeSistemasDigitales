--  A testbench has no ports.
entity fullAdder_tb is
end fullAdder_tb;

architecture behav of fullAdder_tb is
  --  Declaration of the component that will be instantiated.
  component fullAdder
  port (a,b,cin: in bit;
  s,cout: out bit);
end component;

  --  Specifies which entity is bound with the component.
  for adder_0: fullAdder use entity work.fullAdder;
  signal a, b, cin, s, cout : bit;
begin
  --  Component instantiation.
  adder_0: fullAdder port map (a, b, cin, s, cout);

  --  This process does the real job.
  process
    type pattern_type is record
      --  The inputs of the adder.
      i0, i1, ci : bit;
      --  The expected outputs of the adder.
      s, co : bit;
    end record;
    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('0', '0', '0', '0', '0'),
       ('0', '0', '1', '1', '0'),
       ('0', '1', '0', '1', '0'),
       ('0', '1', '1', '0', '1'),
       ('1', '0', '0', '1', '0'),
       ('1', '0', '1', '0', '1'),
       ('1', '1', '0', '0', '1'),
       ('1', '1', '1', '1', '1'));
  begin
    --  Check each pattern.
    for i in patterns'range loop
      --  Set the inputs.
      a <= patterns(i).i0;
      b <= patterns(i).i1;
      cin <= patterns(i).ci;
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
