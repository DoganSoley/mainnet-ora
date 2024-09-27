#!/bin/bash

# Renk kodları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# tora-docker-compose klasörüne git
cd tora-docker-compose || { echo -e "${RED}Klasöre erişilemedi. Çıkış yapılıyor.${NC}"; exit 1; }


# 8. CRYPTOLOSS
echo " "
echo " "
echo " "
echo -e "${BLUE} ######  ########  ##    ## ########  ########  #######  ##        #######   ######   ######${NC}"
echo -e "${BLUE}##    ## ##     ##  ##  ##  ##     ##    ##    ##     ## ##       ##     ## ##    ## ##    ##${NC}"
echo -e "${BLUE}##       ##     ##   ####   ##     ##    ##    ##     ## ##       ##     ## ##       ##${NC}"
echo -e "${BLUE}##       ########     ##    ########     ##    ##     ## ##       ##     ##  ######   ######${NC}"
echo -e "${BLUE}##       ##   ##      ##    ##           ##    ##     ## ##       ##     ##       ##       ##${NC}"
echo -e "${BLUE}##    ## ##    ##     ##    ##           ##    ##     ## ##       ##     ## ##    ## ##    ##${NC}"
echo -e "${BLUE} ######  ##     ##    ##    ##           ##     #######  ########  #######   ######   ######${NC}"
echo " "
echo -e "${GREEN}#### Twitter : @Cryptoloss1 #####${NC}"
echo " "
echo " "



# .env dosyasını güncelle
echo -e "${YELLOW}.env dosyasındaki CONFIRM_CHAINS değeri güncelleniyor...${NC}"
sed -i 's|CONFIRM_CHAINS=.*|CONFIRM_CHAINS='\''["sepolia","mainnet"]'\''|' .env

# Güncellemenin başarılı olduğunu bildirme
echo -e "${GREEN}.env dosyası başarıyla güncellendi.${NC}"

# Çalışan container'ları durdur
echo -e "${YELLOW}Çalışan container'lar durduruluyor...${NC}"
docker-compose down || { echo -e "${RED}Container'lar durdurulamadı. Çıkış yapılıyor.${NC}"; exit 1; }



# Eski container'ları ve kullanılmayan verileri sil
echo -e "${YELLOW}Eski container'lar ve kullanılmayan veriler siliniyor...${NC}"
docker rm $(docker ps -a -q) || { echo -e "${RED}Eski container'lar silinemedi. Çıkış yapılıyor.${NC}"; exit 1; }

# Yeni container'ları başlat
echo -e "${YELLOW}Container'lar yeniden başlatılıyor...${NC}"
docker-compose up -d || { echo -e "${RED}Container'lar başlatılamadı. Çıkış yapılıyor.${NC}"; exit 1; }

# İşlemin başarılı olduğunu bildirme
echo -e "${GREEN}Container'lar başarıyla yeniden başlatıldı.${NC}"

echo -e "${GREEN}Log kontrol için : ${NC}""${YELLOW}docker logs -f ora-tora${NC}"

# Container loglarını göster
echo -e "${YELLOW}Container logları takip ediliyor...${NC}"
docker-compose logs -f
