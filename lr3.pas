Program lr3;
var
	f, g : file of integer;
	// fn : array[0..49] of integer = (1, 3, 95, 51, 14, 9, 76, 85, 53, 61, 44, 39, 63, 31, 84, 28, 94, 2, 63, 27, 96, 7, 79, 20, 20, 37, 14, 69, 83, 21, 34, 39, 68, 72, 75, 72, 82, 66, 25, 55, 84, 26, 98, 52, 47, 95, 92, 48, 82, 31);
	fn, finalArray : array[0..49] of integer;
	number, temp, i, j, j1, final : integer;
	fName, gName : string;
	duplicate : Boolean;
begin
	{Получаем путь к файлу}
	writeln('Source file name:');
	readln(fName);
	Assign (f, fName);
	{Пример записи в фаил}
	// Rewrite(f);
	// for i := 0 to 49 do
	// Write(f, fn[i]);
	reset(f);
	i := -1;
	while not eof(f) do 
		begin
			{Для каждого числа в файле выполняем проверку на четность, записываем нечетные в массив}
			Read(f, number);
			if(number mod 2>0) then 
			begin
				Inc(i);
				fn[i] := number;
			end;
		end;
	{Сортировка чисел в массиве}
	for j1 := i DownTo 0 do
		for j := 1 to j1 do
			if (fn[j-1] < fn[j]) then
			begin
				temp := fn[j-1];
				fn[j-1] := fn[j];
				fn[j] := temp;
			end;
	{Удаляем дубликаты}
	finalArray[1] := fn[1];
	j := 1;
	temp := 1;
	while j < i do
	begin
		Inc(j);
		duplicate := false;
		for j1 := 1 to temp do
			if fn[j] = finalArray[j1] then begin
				duplicate := true;
				break;
			end;
			if duplicate=false then begin
				inc(temp);
				finalArray[temp] := fn[j];
			end;
	end;
	{Получаем путь к файлу в который нужно записать результат}
	writeln('Output file name:');
	readln(gName);
	Assign (g, gName);
	Rewrite(g);
	{Записываем результат, параллельно выводим его в консоль}
	for final := 0 to i do begin
		if finalArray[final] <> 0 then begin
			write(g, finalArray[final]);
			write(finalArray[final], ' ');
		end;
	end;
	{Закрываем оба файла}
	Close(f);
	Close(g);
	writeln('Done!');
	readln();
end.
