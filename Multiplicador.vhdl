entity multiplicador is
  port (a,b: in  bit_vector(3 downto 0);
        z: out bit_vector (7 downto 0);
end multiplicador;

architecture estructura of multiplicador is
component fullAdder is
  port (a,b,cin: in bit;
  s,cout: out bit);
end fullAdder;

component halfAdder is
  port (a,b: in bit;
  s,c: out bit);
end halfAdder;

signal c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11: bit;
signal s0, s1, s2, s3, s4, s5: bit;

begin
  z(0) <= a(0) and b(0);
  HA1: halfAdder port map ((a(0) and b(1)), (a(1) and b(0)), z(1), c0);
  FA1: fullAdder port map ((a(1) and b(1)), (a(2) and b(0)), c0, s0, c1);
  FA2: fullAdder port map ((a(2) and b(1)), (a(3) nand b(0)), c1, s1, c2);
  FA3: fullAdder port map ((a(3) nand b(1)), '1', c2, s2, c3);

  HA2: halfAdder port map ((a(0) and b(2)), s0, z(2), c4);
  FA4: fullAdder port map ((a(1) and b(2)), s1, c4, s3, c5);
  FA5: fullAdder port map ((a(2) and b(2)), s2, c5, s4, c6);
  FA6: fullAdder port map ((a(3) and b(2)), c3, c6, s5, c7);

  HA3: halfAdder port map ((a(0) and b(3)), s3, z(3), c8);
  FA7: fullAdder port map ((a(1) and b(3)), s4, c8, z(4), c9);
  FA8: fullAdder port map ((a(2) and b(3)), s5, c9, z(5), c10);
  FA9: fullAdder port map ((a(3) and b(3)), c7, c10, z(6), c11);
  HA4: halfAdder port map ('1', c11, z(7));

end estructura;
