import configparser
import argparse
import os
import json
import logging



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

def delete_todo(id):
    try:
        todos = return_todos()
        token = None
        for index in range(len(todos)):
            if todos[index]['id'] == id[0]:
                token = index
                break
        if token is not None:
            todos.pop(token)
            write_todos(todos)
            return True
        else:
            return False
    except IndexError as ie:
        print(repr(ie))

def update_todo(todo):
    try:
        todos = return_todos()
        token = None
        print(todo)
        for index in range(len(todos)):
            if todos[index]['id'] == int(todo[0]):
                token = index
                break
        if token is not None:
            todos[token]['status'] = True
            if len(todo) == 2:
                todos[token]['todo'] = todo[1]
            write_todos(todos)
            return True
        else:
            return False
    except IndexError:
        pass

def resolve_arguments(args):
        if args.create:
        if add_todo(args.create):
            print('todo successfully saved...')
    elif args.delete:
        if delete_todo(args.delete):
            print(f'todo id = {args.delete} deleted successfully...')
        else:
            print(f'todo with id = {args.delete} not found...')
    elif args.update:
        if update_todo(args.update):
            print(f'todo id = {args.update} update successfully...')
        else:
            print(f'todo with id = {args.update} not found...')        
    elif args.updatetodo:
        print(args.updatetodo)
        if update_todo(args.updatetodo):
            print(f'todo id = {args.updatetodo} update successfully...')
        else:
            print(f'todo with id = {args.updatetodo} not found...')        
    elif args.list:
        print(return_todos())
    elif args.listcompleted:
        data = return_todos()
        todo = filter(lambda x: if x['status'] == True, data)
        print(todo)
    elif args.listpending:
        data = return_todos()
        todo = filter(lambda x: if x['status'] == False, data)
        print(todo)
    else:
        print('Please enter valid command')

        
def main():
    parser = get_args_parser()
    args = parser.parse_args()
    resolve_arguments(args)


if __name__ == '__main__':
    get_config()
    
    main()