entity halfAdder is
  port (a,b: in bit;
  s,c: out bit);
end halfAdder;

architecture estructura of halfAdder is
component MUX is
  port (i0,i1,i2,i3,a,b:in bit;
  x : out bit);
end component;
  begin
    MUX0: MUX port map ('0','1','1','0',a,b,s);
    MUX1: MUX port map ('0','0','0','1',a,b,c);
end estructura;
