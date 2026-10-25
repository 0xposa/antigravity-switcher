# Antigravity Workspace Guidelines & Auto-Rotation Rules

## 1. Automatic Account Rotation on Quota Limit / Rate Limit (HTTP 429)
- **Zero Interruption Policy**: Saat model yang sedang digunakan terkena batas limit (Rate limit reached, Quota exceeded, ResourceExhausted, HTTP 429):
  1. Periksa status auto-rotation via `agy-switcher --auto-rotate-status`.
  2. **Jika ENABLED**:
     AI harus **otomatis** menjalankan background command:
     ```bash
     agy-switcher --rotate
     ```
     Laporkan secara singkat ke user email akun baru yang aktif:
     > 🔄 *Quota limit reached. Auto-rotated to account: `<new_email>`. Resuming task...*
     Langsung lanjutkan tugas atau panggilan tools yang tertunda tanpa meminta user mengganti akun secara manual.
  3. **Jika DISABLED**:
     AI tidak melakukan auto-rotation, melainkan memberi tahu user bahwa kuota habis dan fitur auto-rotation sedang dinonaktifkan:
     > ⚠️ *Batas kuota/rate limit tercapai. Fitur Zero-Interruption Auto-Rotation sedang dinonaktifkan. Gunakan `/switcher-account` untuk mengganti akun secara manual atau `/antigravity-switcher` untuk mengaktifkan kembali auto-rotation.*

## 2. Slash Commands Handling
### A. `/antigravity-switcher`
- **Tujuan**: Mengaktifkan atau menonaktifkan fitur Zero-Interruption Auto-Rotation.
- **GUNAKAN TOOL `ask_question`**. Tampilkan dialog modal interaktif dengan opsi:
  - `1. Aktifkan` (tandai ` (Aktif)` jika saat ini ENABLED)
  - `2. Nonaktifkan` (tandai ` (Aktif)` jika saat ini DISABLED)
- Jalankan `agy-switcher --auto-rotate on` atau `agy-switcher --auto-rotate off` sesuai pilihan user.

### B. `/switcher-account`
- **Tujuan**: Mengganti akun Google Antigravity yang aktif.
- **GUNAKAN TOOL `ask_question`**. Tampilkan dialog modal interaktif agar user bisa langsung memilih akun yang akan diaktifkan dari daftar akun tersimpan.
- Ambil daftar akun real-time dengan `agy-switcher --list-json`, lalu panggil `ask_question` dengan daftar email akun (berikan tanda ` (Aktif)` pada akun yang sedang aktif).
- Jalankan `agy-switcher --switch "<email_terpilih>"` setelah user memilih.

## 3. Terminal Management
- Pengelolaan akun di luar Antigravity (menambah akun baru atau menghapus akun) dilakukan melalui CLI Terminal:
  ```bash
  agy-switcher
  ```
