#!/bin/bash

# Имя сессии
name_session=work_session

# Имя окна
name_window=project

# Путь до проекта
path=~/Projects/Makefile

# Путь до макета
path_layout=~/.tmux/layouts/layout_1_3_pan

# Создаю сессию и окно; После создания отключаюсь от сессии
tmux new-session -s $name_session -n $name_window -d

# Создаю три панели
for i in {1..2}
do
  tmux split-window -v -t $name_session
done

# Применяю свой макет расположения панелей
tmux select-layout "$(cat $path_layout)"

# Устанавливаю во всех панелях путь до проекта
for i in {1..3}
do
  tmux send-keys -t $name_session:1.$i "cd $path" C-m
done

# Перехожу в папку с исходными файлами в первой панели
tmux send-keys -t $name_session:1.1 'cd src' C-m

# Открываю все файлы в виде вкладок
tmux send-keys -t $name_session:1.1 'vim *.h *.cpp' C-m
tmux send-keys -t $name_session:1.1 ':tab all' C-m

# Фокусируюсь на первой панели, в которой были открыты вкладки
tmux select-pane -t $name_session:1.1 

# Вывожу сессию на экран
tmux attach -t work_session

