#!/bin/bash

if [[ "$(uname -s)" == 'Darwin' ]]; then
    brew update || brew update
    git clone --depth 1 https://github.com/yyuu/pyenv.git ~/.pyenv
    PYENV_ROOT="$HOME/.pyenv"
    PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    pyenv install $PYENV
    pyenv global $PYENV
    pyenv rehash
    python -m pip install --user virtualenv

    python -m virtualenv ~/.venv
    source ~/.venv/bin/activate
    PATH="$HOME/.venv/bin:$PATH"
fi

pip install .
pip install -r test_requirements.txt
ls $HOME/.venv/bin
