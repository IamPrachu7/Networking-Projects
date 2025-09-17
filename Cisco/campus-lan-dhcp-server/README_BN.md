# 🌐 স্মার্ট নেটওয়ার্কিং ল্যাব – বিগিনার প্রজেক্ট

এটি একটি **Cisco Packet Tracer প্রজেক্ট** যেটি শিক্ষার্থীদের জন্য বানানো হয়েছে, যাতে সহজভাবে নেটওয়ার্কিং শিখতে পারে।

---

## 📌 সমস্যার বিবরণ
শুরুতে যারা নেটওয়ার্কিং শিখে, তারা বুঝতে পারে না কিভাবে **Server, Switch আর PC** একে অপরের সাথে কাজ করে।  
বিশেষ করে **DHCP, Static IP, Services** কনফিগার করা কষ্টকর মনে হয়।  
এই প্রজেক্টটি সেই বিষয়গুলো এক্সপ্লেইন করার জন্য তৈরি।

---

## 🎯 কি শিখবেন
- কিভাবে LAN তৈরি হয়।  
- **Static IP আর DHCP IP এর মধ্যে পার্থক্য।**  
- Cisco Packet Tracer-এ DHCP সার্ভার কনফিগার।  
- **Teacher PC-কে Static IP দেওয়া।**  
- কিভাবে `ping`, `ftp` দিয়ে নেটওয়ার্ক টেস্ট করা হয়।  

---

## 🔑 মূল বৈশিষ্ট্য
- Server → DHCP চালু।  
- Teacher PC → Fix IP (192.168.1.11)।  
- Student PCs → DHCP থেকে IP নেয়।  
- সহজ ও বিগিনার ফ্রেন্ডলি নেটওয়ার্ক।  
- ভবিষ্যতে Web, FTP, DNS অ্যাড করা যাবে।  

---

## 🖥️ নেটওয়ার্ক টপোলজি
📍 উদাহরণ:  
- Router → 192.168.1.1 (Default Gateway, Interface G0/0)  
- Server → 192.168.1.2 (DHCP)  
- Teacher PC → 192.168.1.11 (Static)  
- Student PCs → 192.168.1.12 – 192.168.1.50 (DHCP)  
- Switch → সব ডিভাইস কানেক্ট করে  

![নেটওয়ার্ক টপোলজি](./Components.png)

---


## 📋 পূর্বশর্ত
- Cisco Packet Tracer 8.x বা তার বেশি
- IP addressing এর বেসিক জ্ঞান
- `Campus_LAN_with_DHCP_&_Server.pkt` ফাইল File → Open দিয়ে খুলুন

## 📊 ঠিকানা পরিকল্পনা
| আইটেম | মান |
|--------|-----|
| নেটওয়ার্ক | 192.168.1.0/24 |
| গেটওয়ে | 192.168.1.1 |
| সার্ভার (DHCP) | 192.168.1.2 |
| টিচার PC | 192.168.1.11 (Static) |
| DHCP Pool | 192.168.1.12–192.168.1.50 |
| DNS (ঐচ্ছিক) | 192.168.1.2 |
| বাদ দেওয়া | 192.168.1.1, 192.168.1.11 |

## ⚙️ সেটআপ করার ধাপ

### 1️⃣ ডিভাইস কানেক্ট করুন
- Router, Server, Switch, Teacher PC আর Student PCs বসান।  
- Copper Straight-Through cable ব্যবহার করুন।
- Router G0/0 কে Switch এর সাথে কানেক্ট করুন, তারপর সব ডিভাইস Switch এর সাথে কানেক্ট করুন।  

### 2️⃣ Router কনফিগার করুন
- যান: `Router → Config → Interface G0/0`।  
- সেট করুন:  
  - IP Address: `192.168.1.1`  
  - Subnet Mask: `255.255.255.0`  
  - Status: `ON`
- CLI কনফিগারেশন ফাইল: [`Router_Config_CLI.txt`](./Router_Config_CLI.txt)

### 3️⃣ Server কনফিগার করুন (DHCP)
- যান: `Server → Services → DHCP`।  
- DHCP ON করুন।  
- সেট করুন:  
  - Gateway: `192.168.1.1`  
  - DNS: `192.168.1.2`  
  - Start IP: `192.168.1.12`  
  - Subnet: `255.255.255.0`  
  - Max Users: `30`  
  - Excluded Addresses যোগ করুন: `192.168.1.1, 192.168.1.11`  

### 4️⃣ Teacher PC কনফিগার করুন (Static)
- যান: `Desktop → IP Configuration`।  
- দিন:  
  - IP: `192.168.1.11`  
  - Subnet: `255.255.255.0`  
  - Gateway: `192.168.1.1`  

### 5️⃣ Student PCs কনফিগার করুন (DHCP)
- যান: `Desktop → IP Configuration → DHCP`।  
- IP অটো অ্যাসাইন হবে।  

### 6️⃣ কানেক্টিভিটি টেস্ট
- Teacher PC তে Command Prompt খুলুন:
  ```
  ping 192.168.1.2    # Server-এ পিং
  ping 192.168.1.1    # Router-এ পিং
  ipconfig            # IP ঠিকানা যাচাই
  ```
- Student PC তে Command Prompt খুলুন:
  ```
  ping 192.168.1.11   # Teacher PC-তে পিং
  ping 192.168.1.2    # Server-এ পিং
  ipconfig            # DHCP IP যাচাই
  ```
- সব পিং সফল হলে → নেটওয়ার্ক সঠিকভাবে কাজ করছে।  

---

## 📋 স্টুডেন্ট স্টেপ-বাই-স্টেপ ওয়ার্কফ্লো
1. সব ডিভাইস কানেক্ট করুন।  
2. পাওয়ার অন করুন।  
3. Server-এ DHCP চালু করুন।  
4. Teacher PC-তে Static IP দিন।  
5. Student PCs DHCP থেকে IP নেবে।  
6. Ping দিয়ে টেস্ট করুন।  
7. (Optional) Server-এ Web/FTP চালু করুন।  

---

## 🔍 সমস্যা সমাধান
- ❌ Student PC IP পাচ্ছে না → DHCP ON নেই।  
- ❌ Teacher PC IP Conflict → DHCP range overlap হয়েছে।  
- ❌ Ping fail → ভুল ক্যাবল বা পাওয়ার নেই।  
- ❌ FTP/Web কাজ করছে না → Services চালু নেই।  

---

## 🌟 ভবিষ্যৎ পরিকল্পনা
- Web Server যোগ করা।  
- FTP Server যোগ করা।  
- DNS Server যোগ করা।  
- Router দিয়ে Internet Simulation।  
- VLAN দিয়ে Student-Teacher আলাদা নেটওয়ার্ক।  

---



## 📄 License
This project is licensed under the MIT License.

## 📅 Last Updated
September 2025
