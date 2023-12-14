import os

def Settings(**kwargs):
    unity_project_path = '/path/unity/project'          # Imposta il percorso del tuo progetto Unity3D

    return {
        'flags': [
            '-std=c++11',                                       # Impostazione specifica per il C++
            '-Wall',
            '-Wextra',
            '-Werror',
            '-x',
            'c++',
            '-I',
            #'/path/to/your/includes',                           
            '-std=c#latest',
            '-define:UNITY_5_3_OR_NEWER',
            '-I',
            os.path.join(unity_project_path, 'Library/ScriptAssemblies'),       # Unity3D assembly/script
            '-I',
            os.path.join(unity_project_path, 'Assets'),                         # Unity3D project Assets
            '-I',
            '/usr/lib/mono/4.7.2-api',                                          # Percorso alle librerie standard di .NET/Mono
            # ...
        ],
    }
