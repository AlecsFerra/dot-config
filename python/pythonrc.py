import os
import atexit
import readline

if 'PYTHONHISTFILE' in os.environ:
    history = os.path.expanduser(os.environ['PYTHONHISTFILE'])
elif 'XDG_DATA_HOME' in os.environ:
    history = os.path.join(os.path.expanduser(os.environ['XDG_DATA_HOME']),
                                   'python', 'python_history')
else:
    history = os.path.join(os.path.expanduser('~'), '.python_history')

history = os.path.abspath(history)

_dir, _ = os.path.split(history)
os.makedirs(_dir, exist_ok=True)

readline.parse_and_bind('tab: complete')
try:
    readline.read_history_file(history)
except IOError:
    pass
atexit.register(readline.write_history_file, history)

del os, history, readline, atexit

print("Bella alecs")

