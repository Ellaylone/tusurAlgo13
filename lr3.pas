Program lr3;
var
	f, g : file of integer;
	// fn : array[0..49] of integer = (1, 3, 95, 51, 14, 9, 76, 85, 53, 61, 44, 39, 63, 31, 84, 28, 94, 2, 63, 27, 96, 7, 79, 20, 20, 37, 14, 69, 83, 21, 34, 39, 68, 72, 75, 72, 82, 66, 25, 55, 84, 26, 98, 52, 47, 95, 92, 48, 82, 31);
	fn : array[0..49] of integer;
	number, temp, i, j, j1, final : integer;
begin
	Assign (f, '/home/zhigulin_na/Sandbox/playground/tusur/algo/kr2/lr3/f.txt');
	// Rewrite(f);
	// for i := 0 to 49 do
	// Write(f, fn[i]);
	
	// Reset(f);
	i := -1;
	while not eof(f) do 
		begin
			// проверка на четность
			Read(f, number);
			if(number mod 2>0) then 
			begin
				Inc(i);
				fn[i]:=number;
			end;
		end;
	for j1 := i DownTo 0 do
		for j := 1 to j1 do
			if (fn[j-1] < fn[j]) then
			begin
				temp := fn[j-1];
				fn[j-1] := fn[j];
				fn[j] := temp;
			end;
	Assign (g, '/home/zhigulin_na/Sandbox/playground/tusur/algo/kr2/lr3/g.txt');
	Rewrite(g);
	for final := 0 to i do 
		write(g, fn[final]);

	Close(f);
	Close(g);
	writeln('Done!');
	readln();
end.
