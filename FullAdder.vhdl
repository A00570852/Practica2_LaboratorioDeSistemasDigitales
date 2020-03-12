entity fullAdder is
  port (a,b,cin: in bit;
  s,cout: out bit);
end fullAdder;

architecture estructura of fullAdder is
  signal ncin: bit;
  component MUX is
  port (i0,i1,i2,i3,a,b:in bit;
  x : out bit);
end component;

begin
  ncin <= not cin;
  MUX0: MUX port map (cin,ncin, ncin,cin, a, b, s);
  MUX1: MUX port map ('0', cin, cin, '1', a, b, cout);
end estructura;
