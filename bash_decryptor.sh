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

echo yasm printString
yasm -f elf64 -g dwarf2 -o printString.o printString.s

echo yasm en_de_cryptFunc
yasm -f elf64 -g dwarf2 -o en_de_cryptFunc.o en_de_cryptFunc.s

echo yasm decryptor
yasm -f elf64 -g dwarf2 -o decryptor.o decryptor.s

echo linkfile
ld -o decryptor decryptor.o inputFile.o  createOutputFile.o fileread.o filewrite.o printString.o en_de_cryptFunc.o inputKey.o
echo "---------------- run file ----------------"
echo "------------------------------------------"
./decryptor
