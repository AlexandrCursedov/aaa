#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake ..
make
sudo modprobe msr
echo '{
  "api": {
    "id": null,
    "worker-id": null
  },
  "http": {
    "enabled": false,
    "host": "127.0.0.1",
    "port": 0,
    "access-token": null,
    "restricted": true
  },
  "autosave": true,
  "version": 1,
  "background": false,
  "colors": true,
  "randomx": {
    "init": -1,
    "numa": true
  },
  "cpu": {
    "enabled": true,
    "huge-pages": true,
    "hw-aes": null,
    "priority": null,
    "memory-pool": false,
    "max-threads-hint": 100,
    "asm": true,
    "argon2-impl": null,
    "cn/0": false,
    "cn-lite/0": false
  },
  "opencl": {
    "enabled": false,
    "cache": true,
    "loader": null,
    "platform": "AMD",
    "cn/0": false,
    "cn-lite/0": false
  },
  "cuda": {
    "enabled": false,
    "loader": null,
    "nvml": true,
    "cn/0": false,
    "cn-lite/0": false
  },
  "donate-level": 1,
  "donate-over-proxy": 1,
  "log-file": null,
  "pools": [
    {
      "algo": null,
      "coin": null,
      "url": "moscow01.hashvault.pro:80",
      "user": "422Bbm8hoimLVkdQPEAhbcATYPaRm6sr3h76HcpNAb3k5tfAZB6Jm8tH2L5DfAscbfaRfNsDvS9zb9tULLBJK7sUTWDai6n",
      "pass": "BASH",
      "rig-id": null,
      "nicehash": false,
      "keepalive": false,
      "enabled": true,
      "tls": true,
      "tls-fingerprint": "420c7850e09b7c0bdcf748a7da9eb3647daf8515718f36d9ccfdd6b9ff834b14",
      "daemon": false,
      "self-select": null
    }
  ],
  "print-time": 60,
  "health-print-time": 60,
  "retries": 5,
  "retry-pause": 5,
  "syslog": false,
  "user-agent": null,
  "watch": true
}' > config.json
screen -dmS xmrig_session ./xmrig --config=config.json
echo "XMRig установлен и запущен в сессии screen с именем xmrig_session."
screen -r xmrig_session
