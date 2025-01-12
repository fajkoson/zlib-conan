@echo off

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Please install Python and try again.
    exit /b 1
)

:: Check if the virtual environment exists, if not, create it
if not exist ".venv" (
    echo Creating virtual environment...
    python -m venv .venv
)

:: Activate the virtual environment
call .venv\Scripts\activate

:: Install Conan using pip from requirements.txt
echo Installing Conan via pip...
pip install -r requirements.txt

REM Call install the profile
REM this requires a fix
REM .venv\Scripts\conan install . -pr default

:: Deactivate the virtual environment
call .venv\Scripts\deactivate
