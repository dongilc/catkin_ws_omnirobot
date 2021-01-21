# Run Omnidirectional Robot in Startup
screen -S "startupSess" -d -m
screen -r "startupSess" -X stuff $'or\n'
