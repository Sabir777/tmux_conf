#!/bin/bash

# Создаю сессию "makefile_hello" и окно "editor"; После создания отключаюсь от сессии
tmux new-session -s makefile_hello -n editor -d

# Изменяю текущий каталог для созданной сессии; Сочетание C-m означает "Enter"
tmux send-keys -t makefile_hello 'cd ~/Projects/Makefile/src' C-m

# Открываю vim в сессии "makefile_hello"
tmux send-keys -t makefile_hello 'vim' C-m

# Создаю ниже горизонтальное окно
tmux split-window -v -t makefile_hello

# Подключаюсь к сессии "makefile_hello"
tmux attach -t makefile_hello

