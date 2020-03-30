entity multiplier is
  port (a,b: in bit_vector (3 downto 0);
  z: out bit_vector(7 downto 0));
end multiplier;

architecture Behavioral of multiplier is
  signal C1, C2, C3: bit_vector (3 downto 0);
  signal S1, S2, S3: bit_vector (3 downto 0);
  signal XY0, XY1, XY2, XY3: bit_vector (3 downto 0);

  component fullAdder is
    port (a,b,cin: in bit;
    s,cout: out bit);
  end component;

  component halfAdder is
    port (a,b: in bit;
    s,c: out bit);
end component;

  begin

  XY0(0) <= a(0) and b(2); XY1 (0) <= a(0) and b(3);
  XY0(1) <= a(1) and b(2); XY1 (1) <= a(1) and b(3);
  XY0(2) <= a(2) and b(2); XY1 (2) <= a(2) and b(3);
  XY0(3) <= a(3) and b(2); XY1 (3) <= a(3) and b(3);

  FA1: fullAdder port map (XY0(2), XY1(1), C1(0), S1(1), C1(1));
  FA2: fullAdder port map (XY0(3), XY1(2), C1(1), S1(2), C1(2));
  FA3: fullAdder port map (S1(2), XY2(1), C2(0), S2(1), C2(1));
  FA4: fullAdder port map (S1(3), XY2(2), C2(1), S2(2), C2(2));
  FA5: fullAdder port map (C1(3), XY2(3), C2(2), S2(3), C2(3));
  FA6: fullAdder port map (S2(2), XY3(1), C3(0), S3(1), C3(1));
  FA7: fullAdder port map (S2(3), XY3(2), C3(1), S3(2), C3(2));
  FA8: fullAdder port map (C2(3), XY3(3), C3(2), S3(3), C3(3));

  HA1: halfAdder port map (XY0(1), XY1(0), S1(0), C1(0));
  HA2: halfAdder port map (XY0(3), C1(2), S1(3), C1(3));
  HA3: halfAdder port map (S1(1), XY2(0), S2(0), C2(0));
  HA4: halfAdder port map (S2(1), XY3(0), S3(0), C3(0));

  z(0) <= XY0(0); z(1) <= S1(0); z(2) <= S2(0);
  z(3) <= S3 (0); z(4) <= S3(1); z(5) <= S3(2);
  z(6) <= S3 (3); z(7) <= C3(3);

  end Behavioral;
