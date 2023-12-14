import os
import ycm_core

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )

def Settings(**kwargs):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-Werror',
            '-std=c++11',   # C++ 
            '-x', 'c++',
            '-I', '.',
            '-isystem', '/usr/include',
            '-isystem', '/usr/local/include',
            # ...
        ],
        'interpreter_path': '/usr/bin/python',  # Python path
        'include_paths_relative_to_dir': DirectoryOfThisScript(),
        'override_filename': None
    }

def FlagsForFile(filename, **kwargs):
    return Settings(**kwargs)
