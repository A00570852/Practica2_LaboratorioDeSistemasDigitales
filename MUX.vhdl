entity MUX is
  port (i0,i1,i2,i3,a,b:in bit;
  x : out bit);
end MUX;
architecture ecuacion of MUX is
  begin
    x <= (not a and not b and i0 ) or (not a and b and i1) or (a and not b and i2) or (a and b and i3);
  end ecuacion;
