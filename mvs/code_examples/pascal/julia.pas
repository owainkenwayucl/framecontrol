program Julia(input,output);
(* Generate Julia sets *)
var xres,yres,mi,i,px,py:integer;
    xmax,xmin,ymax,ymin,rmax,x0,y0,x,y,xt:real;
    r2:real;
    colours:array[0..51] of char;
    c,mc:integer;
    cx,cy:real;
begin
 read(xmax);
 read(xmin);
 read(ymax);
 read(ymin);
 read(xres);
 read(yres);
 read(mi);
 read(rmax);
 read(cx);
 read(cy);
 colours:='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
 mc:=52;
 for c:=51 downto 0 do
 begin
   if (colours[c]=' ') then
     begin
       mc:=c;
     end;
 end;
 writeln(' Julia Generator');
 writeln(' ===============');
 writeln('  ');
 writeln(' X range: ', xmin, ', ', xmax);
 writeln(' Y range: ', ymin, ', ', ymax);
 writeln(' Resolution: ', xres, ', ',yres);
 writeln(' Max iterations: ', mi);
 writeln(' Rmax: ', rmax);
 writeln(' C: ',cx, ' + ', cy,'i');
 writeln(' Colours: ', colours);
 writeln(' Number of colours: ', mc);
 writeln('  ');
 r2:=rmax * rmax;
 mc:=mc-1;
 for py:=yres downto 1 do
 begin
   y0 := ((py/yres) * (ymax - ymin)) + ymin;
   write(' ');
   for px:=1 to xres do
   begin
     x0 := ((px/xres) * (xmax -xmin)) + xmin;
     i := 0;
     y := y0;
     x := x0;
     while (((x*x+y*y)<r2) and (i < mi)) do
     begin
       xt := (x*x) - (y*y) + cx;
       y := 2.0 * x * y + cy;
       x := xt;
       i:=i+1;
     end;
     if (i = mi) then
       begin
         write(' ');
       end
     else
       begin
         c:=round((i/mi)*mc);
         write(colours[c]);
       end;
   end;
   writeln(' ');
 end;
end.
