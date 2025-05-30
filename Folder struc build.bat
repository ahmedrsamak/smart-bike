@echo off
echo Creating Flutter project folder structure...

REM Main app structure
mkdir lib\core
mkdir lib\core\constants
mkdir lib\core\utils
mkdir lib\core\services

mkdir lib\data
mkdir lib\data\models
mkdir lib\data\repositories
mkdir lib\data\database

mkdir lib\features
mkdir lib\features\auth
mkdir lib\features\auth\screens
mkdir lib\features\auth\controllers

mkdir lib\features\dashboard
mkdir lib\features\dashboard\screens
mkdir lib\features\dashboard\widgets
mkdir lib\features\dashboard\controllers

mkdir lib\features\trips
mkdir lib\features\trips\screens
mkdir lib\features\trips\widgets
mkdir lib\features\trips\controllers

mkdir lib\features\maintenance
mkdir lib\features\maintenance\screens
mkdir lib\features\maintenance\widgets
mkdir lib\features\maintenance\controllers
mkdir lib\features\maintenance\services

mkdir lib\features\fuel
mkdir lib\features\fuel\screens
mkdir lib\features\fuel\widgets
mkdir lib\features\fuel\controllers

mkdir lib\features\analytics
mkdir lib\features\analytics\screens
mkdir lib\features\analytics\widgets
mkdir lib\features\analytics\controllers

mkdir lib\features\settings
mkdir lib\features\settings\screens
mkdir lib\features\settings\controllers

mkdir lib\features\alerts
mkdir lib\features\alerts\screens
mkdir lib\features\alerts\services

mkdir lib\routing

mkdir lib\shared
mkdir lib\shared\widgets
mkdir lib\shared\themes
mkdir lib\shared\extensions

echo Done! Your Flutter project structure is ready.
pause
