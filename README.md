# DBD PAK Files Extractor

Распаковщик .pak-файлов Dead by Daylight.

## Как пользоваться

Для запуска скрипта необходим [Git Bash](https://git-scm.com/download/win).

1. В файле `dbd-pak-files-extractor.sh` в первой строке указать правильный путь к установленной игре.
2. Запустить скрипт командой `sh dbd-pak-files-extractor.sh`

### Ключи

- `-s`

	Распаковать .pak в отдельные директории.

- `-l`

	Распаковать только те .pak, которые содержат файлы `.locres`.

- `-c`

	Удалить каталог `output` перед распаковкой.
