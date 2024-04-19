import configparser
import argparse
import os
import json

def get_config():
    global FILENAME
    config = configparser.ConfigParser()
    try:
        config.read('config.ini')
        FILENAME = config['DEFAULT']['todofile']
    except FileNotFoundError:
        pass
    except AttributeError:
        pass
    
def get_args_parser():
    parser = argparse.ArgumentParser(
                        prog='Command Line Todo App',
                        description='Save, update, delete, display todos')  
    parser.add_argument('-c', '--create', nargs='*', metavar='<todo>', help='enter a todo')
    parser.add_argument('-d', '--delete', nargs=1, type=int, metavar='<int> id of todo', help='please provide the todo id')
    parser.add_argument('-u', '--update', nargs=1,type=int, metavar='<id>', help='please provide the id for update')
    parser.add_argument('-ut', '--updatetodo', nargs=2, metavar='<id><todo>', help='please provide the id and todo for update')
    parser.add_argument('-l', '--list', action='store_true', help='display all todos')
    parser.add_argument('-lc', '--listcompleted', action='store_true', help='display all todos with status True')
    parser.add_argument('-lp', '--listpending', action='store_true', help='display all todos with status False')
    return parser

def return_todos():
    try:
        with open(FILENAME, 'r') as fp:
            todo = json.load(fp)
    except FileNotFoundError as fnfe:
        print(repr(fnfe))
    else:
        return todo
        
def write_todos(todo):
    with open(FILENAME, 'w') as fp:
        json.dump(todo, fp, indent=4)

def add_todo(todolist):
    todo = None
    
    try:
        if os.path.exists(FILENAME):
            todo = return_todos()
                
            if todo:
                last_todo_id = todo[-1]['id']
            else:
                last_todo_id = 1
            for index in range(len(todolist)):
                task = {'id': last_todo_id+index+1, 'todo':todolist[index], 'status':False}
                todo.append(task)
        else: 
            todo = []
            for index in range(len(todolist)):
                task = {'id': index+1, 'todo':todolist[index], 'status':False}
                todo.append(task)
        write_todos(todo)
        del todo
    except FileNotFoundError:
        print(f'{FILENAME} not found in the directory.')
        return False
    else:
        return True
        
def main():
    parser = get_args_parser()
    args = parser.parse_args()
    
    if args.create:
        if add_todo(args.create):
            print('todo successfully saved...')
    else:
        pass
    
    
if __name__ == '__main__':
    get_config()
    
    main()