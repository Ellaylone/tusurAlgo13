Program lr3;
var
	f, g : file of integer;
	fn : array[0..49] of integer;
	number, temp, i, j, j1, final : integer;
	fName, gName : string;
begin
	{Получаем путь к файлу}
	writeln('Source file name:');
	readln(fName);
	Assign (f, fName);
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
	{Получаем путь к файлу в который нужно записать результат}
	writeln('Output file name:');
	readln(gName);
	Assign (g, gName);
	Rewrite(g);
	{Записываем результат, параллельно выводим его в консоль}
	for final := 0 to i do begin
		write(g, fn[final]);
		write(fn[final]);
	end;
	{Закрываем оба файла}
	Close(f);
	Close(g);
	writeln('Done!');
	readln();
end.
