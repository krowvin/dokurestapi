@echo off

REM Set the project name and version
set PROJECT_NAME=dokurestapi
set VERSION=0.1.2

REM Build the distribution package
python setup.py sdist bdist_wheel

REM Upload the package to PyPI
twine upload dist/*

REM Clean up
rmdir /s /q dist
rmdir /s /q build
rmdir /s /q dokurestapi.egg-info