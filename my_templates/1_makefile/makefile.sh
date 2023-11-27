#!/bin/bash

# Создаю сессию "work_session" и окно "project1"; После создания отключаюсь от сессии
tmux new-session -s work_session -n project1 -d

# Изменяю текущий каталог для созданной сессии; Сочетание C-m означает "Enter"
#tmux send-keys -t work_session 'cd ~/Projects/Makefile' C-m

# Создаю три панели
tmux split-window -v -t work_session
tmux split-window -v -t work_session

# Применяю свой макет расположения панелей
tmux select-layout "$(cat ~/.tmux/layouts/layout_1_3_pan)"


# Подключаюсь к сессии "work_session"
#tmux attach -t work_session
#tmux attach-session -t work_session 'cd ~/Projects/Makefile' C-m
tmux attach-session -t work_session -c ~/Projects/Makefile
# Открываю vim в сессии "work_session"
#tmux send-keys -t work_session 'vim' C-m

# Создаю ниже горизонтальное окно
#tmux split-window -v -t work_session

# Подключаюсь к сессии "work_session"
#tmux attach -t work_session

