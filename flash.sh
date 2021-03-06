if [ $# -eq 0 ]
  then
    echo "You should put the port as the argument"
    exit 1
fi

esptool.py --chip esp32 --port $1 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0xe000 bin/boot_app0.bin 0x1000 bin/bootloader_qio_80m.bin 0x10000 bin/meteo_station.ino.bin 0x8000 bin/meteo_station.ino.partitions.bin 
