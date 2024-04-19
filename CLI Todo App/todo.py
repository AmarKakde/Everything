import configparser

def get_config():
    global FILENAME
    config = configparser.ConfigParser()
    config.read('config.ini')
    FILENAME = config['DEFAULT']['todofile']

def main():
    pass
    
if __name__ == '__main__':
    get_config()
    main()