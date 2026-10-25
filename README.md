# 🚀 Antigravity Switcher (`agy-switcher`) v1.1

> **Solusi Multi-Akun & Rotasi Otomatis saat Limit untuk Google Antigravity CLI (`agy`)**  
> **Multi-Account Manager & Zero-Interruption Auto-Rotation for Google Antigravity CLI (`agy`)**  
> Dibuat oleh / Created by **[@0xposa](https://x.com/0xposa)** di X (Twitter).

[![Release](https://img.shields.io/badge/Release-v1.1-blue.svg)](https://github.com/0xposa/antigravity-switcher/releases)
[![Twitter Follow](https://img.shields.io/twitter/follow/0xposa?style=social)](https://x.com/0xposa)
[![License: Custom (No Derivatives)](https://img.shields.io/badge/License-No--Derivatives-red.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-green.svg)]()

---

## 🌐 Pilih Bahasa / Select Language
- 🇮🇩 [Bahasa Indonesia](#-bahasa-indonesia)
- 🇬🇧 [English](#-english)

---

# 🇮🇩 Bahasa Indonesia

## 💡 Latar Belakang & Masalah
Google Antigravity CLI (`agy`) secara bawaan hanya menyimpan satu sesi login aktif di `~/.gemini/antigravity-cli/antigravity-oauth-token`. Masalah umum yang sering dialami pengguna:
1. **Batas Kuota / Rate Limit (HTTP 429)**: Model-model unggulan seperti Claude Opus/Sonnet dan Gemini memiliki batas kuota harian per akun Google. Saat batas habis, alur kerja coding langsung terhenti.
2. **Repot Ganti Akun**: Harus login ulang manual melalui browser, mengetik perintah berulang, dan kehilangan konteks sesi chat.

**Antigravity Switcher v1.1** menyelesaikan masalah ini dengan manajemen multi-akun aman di Terminal dan integrasi skill otonom langsung di dalam Antigravity. Saat kuota akun aktif habis, sistem akan **secara otomatis merotasi akun ke akun cadangan yang aktif (`✅ on`) dan melanjutkan tugas tanpa jeda!**

---

## ✨ Fitur Utama
- 💻 **Menu Terminal Interaktif (`agy-switcher`)**: Tampilan TUI terminal bersih, banner ASCII keren, tanpa emoji berlebih di menu, serta dukungan dwibahasa (Indonesia & English).
- 🧭 **Navigasi Intuitif**: Opsi kembali (`0`) di semua submenu dan opsi keluar langsung (`3`) pada menu pemilihan bahasa awal.
- ➕ **Tambah Akun Tanpa Gangguan**: Tambahkan akun Google baru tanpa mengeluarkan akun yang sedang aktif.
- 🗑️ **Hapus Akun**: Bersihkan akun yang sudah tidak diperlukan dengan mudah.
- 📋 **Daftar Akun Akurat**: Menampilkan daftar akun, status aktif real-time, dan status auto-rotasi (`✅ on` / `⛔ off`).
- ⚡ **Auto-Rotation Fleksibel**: Anda dapat menentukan akun mana yang berpartisipasi dalam rotasi otomatis (`✅ on`) dan akun mana yang dikecualikan (`⛔ off`).
- 🔄 **Zero-Interruption Auto-Rotation**: AI otomatis merotasi akun saat rate limit HTTP 429 tercapai.
- 🤖 **Skill Antigravity Native**:
  - `/switcher-account`: Dialog interaktif `ask_question` untuk berganti akun Google secara instan.
  - `/antigravity-switcher`: Dialog interaktif untuk mengaktifkan atau menonaktifkan fitur Zero-Interruption Auto-Rotation.

---

## 📦 Cara Instalasi

Jalankan perintah one-line berikut di Terminal:

### 🐧 Linux & 🍏 macOS
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/0xposa/antigravity-switcher/main/install.sh)"
```

### 🪟 Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/0xposa/antigravity-switcher/main/install.ps1 | iex
```

---

## 🛠️ Panduan Penggunaan

### 1. Di Chat Antigravity (Slash Commands)

Gunakan slash commands berikut langsung di dalam sesi prompt Antigravity:

#### 🔹 `/switcher-account`
Membuka dialog modal interaktif (`ask_question`) untuk memilih dan mengaktifkan akun Google secara instan dari daftar akun tersimpan.
* Muncul daftar email akun Google yang tersimpan.
* Akun yang sedang aktif ditandai dengan label ` (Aktif)`.
* Cukup pilih salah satu akun, dan akun aktif akan langsung berganti seketika!

#### 🔹 `/antigravity-switcher`
Membuka dialog modal interaktif (`ask_question`) untuk mengaktifkan atau menonaktifkan fitur **Zero-Interruption Auto-Rotation**:
* `1. Aktifkan` – Menyalakan auto-rotation saat kuota habis.
* `2. Nonaktifkan` – Mematikan auto-rotation otomatis.

#### ⚡ Alur Zero-Interruption Auto-Rotation:
* **Jika Status AKTIF**:
  Saat model terkena error batas kuota (`HTTP 429`, `Rate limit reached`, `ResourceExhausted`), AI akan **secara otomatis menjalankan `agy-switcher --rotate` di latar belakang**, beralih ke akun cadangan berikutnya yang berstatus `✅ on`, lalu melanjutkan pekerjaan Anda tanpa jeda dan tanpa meminta pergantian manual!
  > 💡 **Kualitas Model Tetap Terjaga**: Model unggulan yang sedang Anda gunakan (misalnya **Claude Opus 4.6**) **TIDAK akan diturunkan**, karena akun cadangan Anda memiliki kuota harian segar!
* **Jika Status NONAKTIF**:
  AI tidak akan berpindah akun otomatis, melainkan menginfokan bahwa batas limit tercapai dan menyarankan Anda mengganti akun via `/switcher-account`.

#### 💬 Kontrol Percakapan Alami (Natural Language Chat)
Selain menggunakan slash command di atas, Anda **bisa langsung berbicara santai** kepada asisten AI tanpa perlu menghafal atau mengetik slash command! Asisten AI memahami instruksi percakapan secara langsung:
* *"Tunjukkan list akun"* ➔ AI menampilkan daftar semua akun beserta status aktifnya.
* *"Pindah ke akun 6"* atau *"Ganti ke akun [email]"* ➔ AI langsung mengalihkan sesi ke akun yang diminta.
* *"Akun apa yang sekarang terhubung?"* ➔ AI mengecek dan memberi tahu email akun yang sedang aktif.
* *"Aktifkan / nonaktifkan auto-rotation"* ➔ AI langsung mengubah status fitur rotasi otomatis di latar belakang.

---

### 2. Di Terminal(`agy-switcher`)

#### Menu Interaktif TUI
Jalankan perintah berikut:
```bash
agy-switcher
```

Menu awal pemilihan bahasa:
```text
Pilih Bahasa / Select Language:
 1. Bahasa Indonesia
 2. English
 3. Keluar / Exit
─────────────────────────────────────────────
(Tekan Ctrl+C untuk keluar / Press Ctrl+C to exit)
─────────────────────────────────────────────
Pilih [1/2/3] (default: 1, 3 untuk keluar / 3 to exit): 
```

Setelah memilih bahasa, Menu Utama akan tampil:
```text
 █████╗  ██████╗ ██╗   ██╗
██╔══██╗██╔════╝ ╚██╗ ██╔╝
███████║██║  ███╗ ╚████╔╝ 
██╔══██║██║   ██║  ╚██╔╝  
██║  ██║╚██████╔╝   ██║   
╚═╝  ╚═╝ ╚═════╝    ╚═╝   
███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗███████╗██████╗ 
██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║██╔════╝██╔══██╗
███████╗██║ █╗ ██║██║   ██║   ██║     ███████║█████╗  ██████╔╝
╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║██╔══╝  ██╔══██╗
███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║███████╗██║  ██║
╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
                    Twitter: @0xposa

                  MENU UTAMA
─────────────────────────────────────────────
 1. Tambah Akun (Add account)
 2. Hapus Akun (Remove account)
 3. Daftar Akun (List account)
 4. Kelola Auto-Rotation Pool (Toggle On/Off)
 5. Keluar (Exit)
─────────────────────────────────────────────
 Tekan Ctrl+C untuk keluar kapan saja
─────────────────────────────────────────────
Pilih menu [1-5]:
```

* **1. Tambah Akun**: Mengamankan token aktif saat ini, membuka browser untuk login akun Google baru, dan menyimpannya ke pool akun (tersedia opsi `0` untuk kembali).
* **2. Hapus Akun**: Memilih akun yang ingin dihapus dari daftar penyimpanan (tersedia opsi `0` untuk kembali).
* **3. Daftar Akun**: Melihat semua akun yang tersimpan beserta tanda `[AKTIF]` dan status auto-rotasinya (tekan `Enter` atau `0` untuk kembali).
* **4. Kelola Auto-Rotation Pool**: Mengaktifkan (`✅ on`) atau menonaktifkan (`⛔ off`) akun dalam rotasi otomatis, serta opsi `G` untuk toggle fitur Zero-Interruption secara global.
* **5. Keluar**: Menutup aplikasi.

#### Perintah CLI Cepat (Non-Interaktif)
Bagi pengguna tingkat lanjut atau kebutuhan skrip automasi:
```bash
# Menyalakan / mematikan auto-rotation
agy-switcher --auto-rotate on
agy-switcher --auto-rotate off
agy-switcher --auto-rotate status

# Berganti akun langsung
agy-switcher --switch "email@gmail.com"

# Rotasi ke akun berikutnya di pool
agy-switcher --rotate

# Melihat akun aktif saat ini
agy-switcher --active-email

# Output daftar akun dalam format JSON
agy-switcher --list-json
```

---
---

# 🇬🇧 English

## 💡 Background & Overview
Google Antigravity CLI (`agy`) natively only retains a single active login session in `~/.gemini/antigravity-cli/antigravity-oauth-token`. Developers frequently encounter two friction points:
1. **Quota Limits & Rate Limits (HTTP 429)**: Premier reasoning models (such as Claude Opus/Sonnet and Gemini) have per-account daily quotas. When limits are exceeded, development freezes.
2. **Tedious Re-authentication**: Manually logging out, opening browser prompts, and resetting sessions disrupts the developer flow.

**Antigravity Switcher v1.1** bridges this gap by offering isolated multi-account vault storage in Terminal paired with autonomous agent skills inside Antigravity. When a quota exhaustion event occurs, credentials are **automatically rotated to the next available account marked `✅ on`, resuming tasks seamlessly with zero interruptions!**

---

## ✨ Key Features
- 💻 **Interactive Terminal TUI (`agy-switcher`)**: Single-screen, clean terminal UI with ASCII header, bilingual prompts, and no emoji clutter in menu items.
- 🧭 **Intuitive Navigation**: Seamless return option (`0`) across all submenus and quick exit (`3`) in the initial language selector.
- ➕ **Seamless Account Addition**: Add additional Google accounts without disturbing your active session credentials.
- 🗑️ **Account Deletion**: Easily prune inactive or decommissioned accounts.
- 📋 **Live Account Listing**: Inspect account pools with real-time `[ACTIVE]` indicators and auto-rotation statuses (`✅ on` / `⛔ off`).
- ⚡ **Granular Auto-Rotation Pool**: Configure which accounts are active for failover (`✅ on`) and which are kept standby/manual (`⛔ off`).
- 🔄 **Zero-Interruption Auto-Rotation**: AI automatically rotates accounts when encountering HTTP 429 rate limits.
- 🤖 **Native Antigravity Skills**:
  - `/switcher-account`: Interactive `ask_question` modal dialog to switch active accounts on the fly.
  - `/antigravity-switcher`: Interactive modal dialog to toggle Zero-Interruption Auto-Rotation on or off.

---

## 📦 Installation
 
Run the following one-liner in your Terminal:

### 🐧 Linux & 🍏 macOS
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/0xposa/antigravity-switcher/main/install.sh)"
```

### 🪟 Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/0xposa/antigravity-switcher/main/install.ps1 | iex
```

---

## 🛠️ Usage Guide

### 1. Inside Antigravity CLI (Slash Commands)

Use these slash commands directly within your Antigravity chat prompt:

#### 🔹 `/switcher-account`
Opens an interactive modal dialog (`ask_question`) to select and activate your Google accounts on the fly from stored accounts.
* Displays a list of all stored Google accounts.
* The currently active account is marked with ` (Aktif)`.
* Select an account to switch immediately!

#### 🔹 `/antigravity-switcher`
Opens an interactive modal dialog (`ask_question`) to enable or disable the **Zero-Interruption Auto-Rotation** feature:
* `1. Aktifkan` – Enable auto-rotation upon quota exhaustion.
* `2. Nonaktifkan` – Disable auto-rotation.

#### ⚡ Zero-Interruption Auto-Rotation Flow:
* **When ENABLED**:
  When a model encounters a quota/rate limit error (`HTTP 429`, `Rate limit reached`, `ResourceExhausted`), the AI assistant **automatically runs `agy-switcher --rotate` in the background**, seamlessly switching to the next standby account marked `✅ on`, and immediately resumes your task with zero interruption!
  > 💡 **Model Quality Maintained**: Your premier model (such as **Claude Opus 4.6**) **remains active**, powered by the fresh daily quota of your standby account!
* **When DISABLED**:
  The AI will not rotate accounts automatically. Instead, it informs you that the quota limit has been reached and suggests manually switching via `/switcher-account`.

#### 💬 Natural Language Conversational Control
In addition to slash commands, you can **simply chat naturally** with the AI assistant without typing any commands! The assistant directly understands your intent:
* *"Show account list"* ➔ AI displays a table of all saved accounts and their active statuses.
* *"Switch to account 6"* or *"Switch to account [email]"* ➔ AI switches credentials immediately.
* *"Which account is currently active?"* ➔ AI checks and reports the current active account.
* *"Enable / disable auto-rotation"* ➔ AI toggles the failover feature in the background.

---

### 2. In Terminal (`agy-switcher`)

#### Interactive TUI Menu
Execute:
```bash
agy-switcher
```

Initial language selection menu:
```text
Pilih Bahasa / Select Language:
 1. Bahasa Indonesia
 2. English
 3. Keluar / Exit
─────────────────────────────────────────────
(Tekan Ctrl+C untuk keluar / Press Ctrl+C to exit)
─────────────────────────────────────────────
Pilih [1/2/3] (default: 1, 3 untuk keluar / 3 to exit): 
```

After choosing your language, the Main Menu appears:
```text
 █████╗  ██████╗ ██╗   ██╗
██╔══██╗██╔════╝ ╚██╗ ██╔╝
███████║██║  ███╗ ╚████╔╝ 
██╔══██║██║   ██║  ╚██╔╝  
██║  ██║╚██████╔╝   ██║   
╚═╝  ╚═╝ ╚═════╝    ╚═╝   
███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗███████╗██████╗ 
██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║██╔════╝██╔══██╗
███████╗██║ █╗ ██║██║   ██║   ██║     ███████║█████╗  ██████╔╝
╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║██╔══╝  ██╔══██╗
███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║███████╗██║  ██║
╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
                    Twitter: @0xposa

                  MAIN MENU
─────────────────────────────────────────────
 1. Add account
 2. Remove account
 3. List account
 4. Manage Auto-Rotation Pool (Toggle On/Off)
 5. Exit
─────────────────────────────────────────────
 Press Ctrl+C to exit anytime
─────────────────────────────────────────────
Select option [1-5]:
```

* **1. Add account**: Secure current token, launch browser for authentication, and store credentials (option `0` to return).
* **2. Remove account**: Select an account to delete from storage (option `0` to return).
* **3. List account**: Inspect all saved accounts, `[ACTIVE]` indicator, and auto-rotation states (press `Enter` or `0` to return).
* **4. Manage Auto-Rotation Pool**: Toggle failover inclusion (`✅ on` / `⛔ off`) per account, plus option `G` to toggle global Zero-Interruption on/off.
* **5. Exit**: Close the application.

#### Quick CLI Commands (Non-Interactive)
For advanced users or automation scripts:
```bash
# Enable / disable auto-rotation
agy-switcher --auto-rotate on
agy-switcher --auto-rotate off
agy-switcher --auto-rotate status

# Switch account directly
agy-switcher --switch "email@gmail.com"

# Rotate to next account in pool
agy-switcher --rotate

# Show currently active email
agy-switcher --active-email

# Output account list in JSON format
agy-switcher --list-json
```

---

## 👨‍💻 Author
Created & maintained by:
* **Twitter / X**: [@0xposa](https://x.com/0xposa)
* **GitHub**: [@0xposa](https://github.com/0xposa)

Don't forget to star ⭐ this repository if it helps your daily workflow!

---

## 📄 License
Released under the [Custom No-Derivatives](LICENSE) License. All rights reserved.
