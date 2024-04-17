
#!/bin/bash

init 4

cd /tmp

wget -q https://enigma2.hswg.pl/wp-content/uploads/2024/04/Lista-bzyk83-hb-13E-15.04.2024.zip
if [ $? -gt 0 ] ;then
  wget -q "--no-check-certificate" https://enigma2.hswg.pl/wp-content/uploads/2024/04/Lista-bzyk83-hb-13E-15.04.2024.zip
  if [ $? -gt 0 ] ;then
  
 echo "błąd pobierania archiwum, koniec"
 
    exit 1
  fi
else

echo "Archiwum pobrane"

fi
unzip /tmp/Lista-bzyk83-hb-13E-15.04.2024.zip -d /tmp >/dev/null 2>&1
if [ $? -gt 0 ] ;then

echo "błąd rozpakowania archiwum, koniec"

	exit 1
  fi
else

echo "Archiwum rozpakowane"

	rm -rf /etc/enigma2/lamedb >/dev/null 2>&1
	rm -rf /etc/enigma2/blacklist >/dev/null 2>&1
    rm -f /etc/enigma2/*.tv
    rm -f /etc/enigma2/*.radio
	rm -f /etc/tuxbox/satellites.xml

mv -f /tmp/Lista bzyk83 hb 13E 15.04.2024/lamedb /etc/enigma2/
mv -f /tmp/Lista bzyk83 hb 13E 15.04.2024/blacklist /etc/enigma2/
mv -f /tmp/Lista bzyk83 hb 13E 15.04.2024/*.tv /etc/enigma2/
mv -f /tmp/Lista bzyk83 hb 13E 15.04.2024/list/*.radio /etc/enigma2/
mv -f /tmp/Lista bzyk83 hb 13E 15.04.2024/list/satellites.xml /etc/tuxbox/



if [ $? -gt 0 ] ;then

echo "błąd instalacji listy, koniec"

	exit 1
  fi
else

echo "Lista zainstalowana"

	rm -f /tmp/Lista-bzyk83-hb-13E-15.04.2024.zip >/dev/null 2>&1
	rm -rf /tmp/Lista bzyk83 hb 13E 15.04.2024 >/dev/null 2>&1


echo "KONIEC. restartuje E2..."

init 3
sleep 5
exit 0