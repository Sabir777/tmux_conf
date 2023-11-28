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
  tmux split-window -v -t work_session
done

# Применяю свой макет расположения панелей
tmux select-layout "$(cat $path_layout)"

# Устанавливаю во всех панелях путь до проекта
for i in {1..3}
do
  tmux send-keys -t work_session:1.$i "cd $path" C-m
done

# Вывожу сессию на экран
tmux attach -t work_session

