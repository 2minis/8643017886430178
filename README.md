# 🚀 Auto Tool Installer 🛠️

A script to **automatically search, download, and install** tools from package managers, programming languages, or GitHub repositories.

## 📌 Features

✔ Installs tools from:  
- **System Package Managers** (`apt`, `dnf`, `pacman`, `brew`, `winget`, `choco`)  
- **Security Distros** (`Kali`, `Parrot`, `BlackArch`)  
- **Language-specific Package Managers** (`pip`, `npm`, `gem`, `cargo`, `go`)  
- **GitHub Repositories & Releases**  

✔ Checks if the tool **already exists** before installing.  
✔ Detects **operating system** and uses the best installation method.  
✔ Supports **Linux, macOS, and Windows**.  

---

## ⚙️ Installation

### 1️⃣ Clone the Repository  
```
git clone https://github.com/2minis/8643017886430178.git
cd 8643017886430178
```
### 2️⃣ Make the Script Executable
```
chmod +x xxxyz.sh
```
### 3️⃣ Install a Tool
Run the script with the tool name:

```
./xxxyz.sh <tool-name>
```
Example:
```
./xxxyz.sh nmap
./xxxyz.sh gobuster
./zzzyz.sh mitmproxy
```
### 4️⃣ Install Globally (Optional)
## If you want to use it anywhere, move it to /usr/local/bin:
```
sudo mv xxxyz.sh /usr/local/bin/xxxyz
```
## Now you can install tools with:
```
xxxyz nmap
xxxyz sqlmap
```
## 🔧 How It Works
```
Checks if the tool is already installed.
Tries to install it using system package managers.
Falls back to language-specific package managers if needed.
Searches GitHub for releases and installs from there.
Handles errors if the tool does not exist.
```
---

### **📌 What This Does for You**
✅ **Looks Professional** – Perfect formatting with headings, code blocks, and emojis.  
✅ **Easy to Read** – Clear instructions and step-by-step setup.  
✅ **Copy-Paste Ready** – Works immediately in GitHub.  

Let me know if you want any changes! 🚀🔥
