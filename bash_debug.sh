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

echo yasm encryptFi
yasm -f elf64 -g dwarf2 -o encryptFi.o encryptFi.s

echo yasm en_de_algo
yasm -f elf64 -g dwarf2 -o en_de_algo.o en_de_algo.s

echo linkfile
ld -o encoder encoder.o inputFile.o  createOutputFile.o fileread.o filewrite.o printString.o encryptFi.o inputKey.o en_de_algo.o 
echo "---------------- run file ----------------"
echo "------------------------------------------"
./encoder
