#!/bin/bash
set -evx

mkdir ~/.fonerocore

# safety check
if [ ! -f ~/.fonerocore/.fonero.conf ]; then
  cp share/fonero.conf.example ~/.fonerocore/fonero.conf
fi
