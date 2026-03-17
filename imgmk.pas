program imgmk;

uses
    Unix, BaseUnix, SysUtils;

var
   output_filename: String;
   fd      : cint;
   zero     : cint;
   bytes   : cint;
   buf: array[0..1048575] of Byte;
   size: Integer;
   count: Integer;

begin

     if ParamCount = 2 then
        begin
        output_filename := ParamStr(1);
        size := StrToInt(ParamStr(2));
        WriteLn(output_filename + ' ' + IntToStr(size) + 'MB' );
        end
     else
        begin
        WriteLn('MISSING ARGUMENT');
        Exit;
        end;

     //transferSize := 0;
     count := size;
     FillChar(buf,SizeOf(buf),0);
     fd := fpOpen(output_filename,O_WrOnly or O_Creat or O_Trunc, 438);
        repeat
	      if count > 0 then
              FpWrite(fd, buf, SizeOf(buf));
	      count := count - 1;
              until count <= 0;
              
    fpFsync(fd);
    fpClose(fd);

end.
