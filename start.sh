#!/bin/bash
set -eu

export PYTHONUNBUFFERED=true

VIRTUALENV=.data/venv

# Membuat virtual environment jika belum ada
if [ ! -d "$VIRTUALENV" ]; then
    python3 -m venv $VIRTUALENV
fi

# Menginstal pip jika tidak ada
if [ ! -f "$VIRTUALENV/bin/pip" ]; then
    curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | $VIRTUALENV/bin/python
fi

# Menginstal dependensi dari requirements.txt
$VIRTUALENV/bin/pip install -r requirements.txt

# Menjalankan aplikasi
$VIRTUALENV/bin/python app.py