import configparser
import argparse

def get_config():
    global FILENAME
    config = configparser.ConfigParser()
    config.read('config.ini')
    FILENAME = config['DEFAULT']['todofile']
    
def get_args_parser():
    parser = argparse.ArgumentParser(
                        prog='Command Line Todo App',
                        description='Save, update, delete, display todos')  
    parser.add_argument('-c', '--create', nargs='*', metavar='<todo>', help='enter a todo')
    parser.add_argument('-d', '--delete', nargs=1, type=int, metavar='<int> id of todo', help='please provide the todo id')
    parser.add_argument('-u', '--update', nargs=2, metavar='<id><status>', help='please provide the id and status for update')
    parser.add_argument('-ut', '--updatetodo', nargs=2, metavar='<id><todo>', help='please provide the id and todo for update')
    parser.add_argument('-l', '--list', action='store_true', help='display all todos')
    parser.add_argument('-lc', '--listcompleted', action='store_true', help='display all todos with status True')
    parser.add_argument('-lp', '--listpending', action='store_true', help='display all todos with status False')
    return parser

def main():
    parser = get_args_parser()
    args = parser.parse_args()
    
    
if __name__ == '__main__':
    get_config()
    
    main()