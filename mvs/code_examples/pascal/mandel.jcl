//MANDEL   JOB (PASCAL),
//             'Mandelbrot',
//             CLASS=A,
//             MSGCLASS=A,
//             TIME=1440,REGION=9000K,
//             MSGLEVEL=(1,1)
//MANDEL   EXEC PASCG,PARM.GO='//STACK=8400K'
//COMPILE.SYSIN DD *
program Mandel(input,output);
(* Skeleton PASCAL program *)
var xres,yres,mi,i,px,py:integer;
    xmax,xmin,ymax,ymin,rmax,x0,y0,x,y,xt:real;
    r2:real;
    colours:array[0..51] of char;
    c,mc:integer;
begin
 read(xmax);
 read(xmin);
 read(ymax);
 read(ymin);
 read(xres);
 read(yres);
 read(mi);
 read(rmax);
 colours:='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
 mc:=52;
 for c:=49 downto 0 do
 begin
   if (colours[c]=' ') then
     begin
       mc:=c;
     end;
 end;
 writeln(' Mandelbrot Generator');
 writeln(' ====================');
 writeln('  ');
 writeln(' X range: ', xmin, ', ', xmax);
 writeln(' Y range: ', ymin, ', ', ymax);
 writeln(' Resolution: ', xres, ', ',yres);
 writeln(' Max iterations: ', mi);
 writeln(' Rmax: ', rmax);
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
     y := 0.0;
     x := 0.0;
     while (((x*x+y*y)<r2) and (i < mi)) do
     begin
       xt := (x*x) - (y*y) + x0;
       y := 2.0 * x * y + y0;
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
/*
//GO.OUTPUT DD SYSOUT=*,DCB=(LRECL=160,BLKSIZE=16000,RECFM=FBA)
//GO.SYSIN  DD *
1.0
-2.0
1.0
-1.0
130
50
50
2.0
/*
//
