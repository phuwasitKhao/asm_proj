echo yasm inputFile
yasm -f elf64 -g dwarf2 -o inputFile.o inputFile.s

echo yasm fileread
yasm -f elf64 -g dwarf2 -o fileread.o fileread.s

echo yasm createOutputFile.s
yasm -f elf64 -g dwarf2 -o createOutputFile.o createOutputFile.s

echo yasm filewrite
yasm -f elf64 -g dwarf2 -o filewrite.o filewrite.s

echo yasm inputKey
yasm -f elf64 -g dwarf2 -o inputKey.o inputKey.s

echo yasm encoder
yasm -f elf64 -g dwarf2 -o encoder.o encoder.s

echo yasm printString
yasm -f elf64 -g dwarf2 -o printString.o printString.s


echo linkfile
ld -o encoder encoder.o inputFile.o fileread.o createOutputFile.o filewrite.o printString.o 
echo "---------------- run file ----------------"
echo "------------------------------------------"
./encoder