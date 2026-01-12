# -*- coding: utf-8 -*-
"""
Created on Thu Jan  8 01:43:12 2026

@author: cyril
"""
from vunit import VUnit
from pathlib import Path


p = Path(__file__).parent

vu = VUnit.from_argv()

vu.add_vhdl_builtins()

lib = vu.add_library("lib")

lib.add_source_files(p/"src"/"*.vhd")

lib.add_source_files(p/"tb"/"*.vhd")

vu.main()


