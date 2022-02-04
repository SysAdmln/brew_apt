#!/bin/bash

help(){
  cat <<__EOF__
  Использование: apt [параметры] команда
  apt — надстройка над brew. Что бы было привычнее Debianщикам.
  
  Основные команды:
    list - показать список пакетов на основе указанных имён
    search - искать в описаниях пакетов
    show - показать дополнительные данные о пакете
    install - установить пакеты
    reinstall - переустановить пакеты
    remove - удалить пакеты
    autoremove - автоматически удалить все неиспользуемые пакеты
    update - обновить список доступных пакетов
    upgrade - обновить систему, устанавливая/обновляя пакеты
__EOF__
}

list(){
  brew list
}

search(){
  brew search $1
}

show(){
  brew info $1
}

install(){
  brew install $1
}

remove(){
  brew uninstall $1
}

autoremove(){
  brew cleanup
}

update(){
  brew update
}

upgrade(){
  brew upgrade && brew cu -a -c -f -y
}

case "$1" in
    help)
        help
        ;;
    list)
    	  shift
    	  list
    	  ;;
    search)
        shift
        search "$@"
        ;;
    show)
        shift
        show "$@"
        ;;
	  install)
	      shift
	      install "$@"
	      ;;
	  reinstall)
	      shift 
	      install "$@"
	      ;;
	  remove)
	      shift 
	      remove "$@"
	      ;;
	  purge)
	      shift 
	      remove "$@"
	      ;;
	  autoremove)
	      shift 
	      autoremove
	      ;;
	  clean)
	      shift 
	      autoremove
	      ;;
	  update)
	      shift 
	      update
	      ;;
	  upgrade)
	      shift 
	      upgrade
	      ;;
    *)
        help
        ;;
esac
