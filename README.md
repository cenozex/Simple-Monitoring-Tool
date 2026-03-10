<div align="center">

<br/>

```
____  _                 _        __  __  _____
/ ___|(_)_ __ ___  _ __ | | ___  |  \/  ||_   _|
\___ \| | '_ ` _ \| '_ \| |/ _ \ | |\/| |  | |
 ___) | | | | | | | |_) | |  __/ | |  | |  | |
|____/|_|_| |_| |_| .__/|_|\___| |_|  |_|  |_|
                   |_|
```

<br/>

<h1>⚡ Netdata — Linux System Monitor</h1>

<p><em>Install. Monitor. Destroy. Repeat.</em></p>

<br/>

[![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://kernel.org/)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-brightgreen?style=for-the-badge)](CONTRIBUTING.md)

<br/>

> **A minimal, no-nonsense toolkit to deploy real-time system monitoring on any Linux machine — in under 60 seconds.**

<br/>

---

</div>

<br/>

## 🗂️ Table of Contents

- [Overview](#-overview)
- [What's Inside](#-whats-inside)
- [Prerequisites](#-prerequisites)
- [Quick Start](#-quick-start)
- [Script Reference](#-script-reference)
  - [setup.sh — Install Netdata](#-setupsh--install-netdata)
  - [test\_dashboard.sh — Load Tester](#-test_dashboardsh--load-tester)
  - [cleanup.sh — Uninstall Netdata](#-cleanupsh--uninstall-netdata)
- [Dashboard Preview](#-dashboard-preview)
- [Installation Modes](#-installation-modes)
- [Known Issues & Fixes](#-known-issues--fixes)
- [Contributing](#-contributing)
- [License](#-license)

<br/>

---

## 📡 Overview

**This** is a lightweight Bash-based toolkit that wraps [Netdata](https://www.netdata.cloud/) — the open-source, real-time performance monitoring agent — with clean install, test, and uninstall scripts designed for Linux systems.

Project for DevOps:
https://roadmap.sh/projects/simple-monitoring-dashboard

Whether you're spinning up a fresh VPS, benchmarking a home server, or just want eyes on your system metrics — this toolkit gets you there fast.

```
┌─────────────────────────────────────────────────────────────┐
│                      NETWATCH TOOLKIT                       │
│                                                             │
│   [setup.sh]  ──▶  Install Netdata (4 flexible modes)      │
│   [test.sh]   ──▶  Hammer CPU & I/O to test dashboards     │
│   [cleanup.sh]──▶  Removal, clean & painless          │
└─────────────────────────────────────────────────────────────┘
```

<br/>

---

## 📦 What's Inside

| File | Purpose |
|---|---|
| `setup.sh` | Interactive Netdata installer via official kickstart script |
| `test_dashboard.sh` | Stress-tests your system to validate monitoring visibility |
| `cleanup.sh` | Cleanly uninstalls Netdata and removes configuration files |

<br/>

---

## ✅ Prerequisites

Before running any script, make sure your system has:

- **OS:** Ubuntu / Debian-based Linux *(apt required)*
- **Tools:** `wget`, `bash`, `sudo` access
- **Internet:** Active connection for kickstart download
- **Optional:** `stress` package *(auto-installed by `test_dashboard.sh`)*

```bash
# Verify prerequisites
which wget bash sudo
```

<br/>

---

## 🚀 Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/cenozex/Simple-Monitoring-Tool.git
cd Simple-Monitoring-Tool

# 2. Make scripts executable
chmod +x *

# 3. Run the installer
./setup.sh

# 4. Open your dashboard
xdg-open http://localhost:19999
```

> 🎯 Dashboard available at **http://localhost:19999** after successful install.

<br/>

---

## 📜 Script Reference

<br/>

### ⚙️ `setup.sh` — Install Netdata

An interactive installer that pulls the official Netdata kickstart script and lets you choose your deployment mode.

**Usage:**
```bash
./setup.sh
```

**Interactive Prompt:**
```
────────────────────────────────────────────────────
   Installing Netdata On Linux System Using Wget
────────────────────────────────────────────────────

1) Install Stable release with automatic updates enabled
2) Install Stable Release with automatic updates disabled
3) Install Nightly Release with automatic updates enabled
4) Install Nightly Release with automatic updates disabled

Enter choice [1-4]:
```

**What it does:**
- Downloads the official Netdata kickstart script via `wget`
- Passes your chosen flags to the installer (`--stable-channel`, `--no-updates`, etc.)
- Telemetry is **always disabled** (`--disable-telemetry`) for privacy

<br/>

### 🔥 `test_dashboard.sh` — Load Tester

Hammers your CPU and I/O for **60 seconds** using the `stress` utility so you can visually validate that your Netdata dashboard is capturing real metrics.

**Usage:**
```bash
./test_dashboard.sh
```

**What it does:**
- Auto-installs `stress` if not present
- Spawns CPU workers equal to your logical core count (`nproc`)
- Runs for exactly **60 seconds** then exits
- Open your Netdata dashboard during the test to see the spikes 📈

```
────────────────────────────────────────────────────
   Generating CPU and I/O load for 60 seconds...
────────────────────────────────────────────────────

stress: info: [XXXX] dispatching hogs: N cpu, 0 io, 0 vm, 0 hdd
stress: info: [XXXX] successful run completed in 60s

────────────────────────────────────────────────────
   Load test complete. Check your Netdata dashboard for spikes!
────────────────────────────────────────────────────
```

<br/>

### 🗑️ `cleanup.sh` — Uninstall Netdata

Fully removes Netdata from your system — either using the built-in uninstaller or falling back to manual `apt` purge.

**Usage:**
```bash
./cleanup.sh
```

**What it does:**
1. Checks for the official Netdata uninstaller at `/usr/libexec/netdata/netdata-uninstaller.sh`
2. If found → runs it with `--yes --force`
3. If not found → falls back to:
   ```bash
   sudo apt-get purge netdata -y
   sudo rm -rf /etc/netdata /var/lib/netdata /var/log/netdata
   ```

<br/>

---

## 🖥️ Dashboard Preview

Once installed, navigate to `http://localhost:19999` to access your live dashboard:

```
┌──────────────────────────────────────────────────────────────────┐
│  NETDATA REAL-TIME DASHBOARD  │  localhost:19999                 │
├────────────────┬──────────────┬───────────────┬──────────────────┤
│  CPU Usage     │  RAM Usage   │  Disk I/O     │  Network         │
│  ████░░░░ 42%  │  ██████ 61% │  ▲ 12 MB/s    │  ↑ 2.1 MB/s     │
│                │              │  ▼ 3 MB/s     │  ↓ 0.8 MB/s     │
├────────────────┴──────────────┴───────────────┴──────────────────┤
│  System Load: 1.4 / 1.1 / 0.9   Uptime: 3d 7h 22m               │
└──────────────────────────────────────────────────────────────────┘
```

> Metrics update every **1 second** by default.

<br/>

---

## 🔧 Installation Modes

| # | Mode | Flags Applied | Best For |
|---|------|---------------|----------|
| 1 | Stable + Auto-updates | `--stable-channel --disable-telemetry` | Production servers |
| 2 | Stable + No updates | `--stable-channel --no-updates --disable-telemetry` | Locked environments |
| 3 | Nightly + Auto-updates | `--disable-telemetry` | Bleeding-edge testing |
| 4 | Nightly + No updates | `--no-updates --disable-telemetry` | Offline/airgapped setups |

<br/>

---

## 🐛 Known Issues & Fixes

<details>
<summary><b>🔴 Color output not displaying correctly in terminal</b></summary>

Some terminals may not render ANSI color codes. The `YELLOW` and `BOLD` color variables in the scripts have a minor formatting issue (missing closing `m` in escape codes). If colors appear broken, fix the definitions:

```bash
# Incorrect (in current scripts)
YELLOW='\033[1;33'
BOLD='\033;1m'

# Correct
YELLOW='\033[1;33m'
BOLD='\033[1m'
```
</details>

<details>
<summary><b>🔴 echo"" missing space causes parse warnings</b></summary>

Some shells may warn about `echo""`. Replace with `echo ""` (with a space) for cleaner execution.
</details>

<details>
<summary><b>🟡 Netdata uninstaller not found</b></summary>

If you installed Netdata via a package manager instead of the kickstart script, the uninstaller may not exist at the expected path. The cleanup script handles this gracefully with a fallback `apt purge`.
</details>

<details>
<summary><b>🟡 wget not found</b></summary>

Install it first:
```bash
sudo apt-get install wget -y
```
</details>

<br/>

---

<div align="center">



*If this saved you time, drop a ⭐ — it helps more than you know.*

<br/>

[![Star this repo](https://img.shields.io/github/stars/cenozex/Simple-Monitoring-Tool?style=social)](https://github.com/cenozex/Simple-Monitoring-Tool)

</div>
