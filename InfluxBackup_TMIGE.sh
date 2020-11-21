#!/bin/bash
#history > "/home/pi/backups/history.$(date +%Y_%m%d--%H%M).bak"
#docker exec -it influxdb influxd backup -portable -db rika-5m_db /home/pi/backups
#8c9efe488bce


RED='\033[0;31m'        #RED
ORANGE='\033[0;33m'     #ORANGE
BLACK='\033[0;30m'      # Black
GREEN='\033[0;32m'      # Green
BLUE='\033[0;34m'       # Blue
PURPLE='\033[0;35m'     # Purple
CYAN='\033[0;36m'       # Cyan
WHITE='\033[0;37m'      # White
NC='\033[0m'            # No Color

# echo -e "${ORANGE} ${NC}"
# echo -e "${BLACK} ${NC}"
# echo -e "${GREEN} ${NC}"
# echo -e "${BLUE} ${NC}"
# echo -e "${PURPLE} ${NC}"
# echo -e "${CYAN} ${NC}"
# echo -e "${WHITE} ${NC}"
# echo -e "${NC}"

DIR='/home/pi/backups/influx_backups.'
NOW=$(date +%Y%j--%H%M)
DATABASE='TMIGE_DB'

echo -e "${ORANGE}creating dir : ${GREEN}" $DIR$NOW
mkdir -p $DIR$NOW
echo -e "${ORANGE}running : ${GREEN}docker influxdb ${NC}"
echo -en "${ORANGE}backup database :  ${GREEN}"
echo $DATABASE
echo -e "${CYAN} IT WILL TAKE A WHILE"

docker exec -it influxdb influxd backup -portable -database $DATABASE $DIR$NOW

echo -e "${GREEN} Script complet ${NC}"
