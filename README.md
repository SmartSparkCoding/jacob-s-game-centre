# Game Centre

<!-- LOGO PLACEHOLDER -->
<p align="center">
  <img src="INSERT_LOGO_PATH_HERE" alt="Game Centre Logo" width="200">
</p>

## Overview

**Game Centre** is a lightweight, responsive, browser‑based hub for launching locally hosted HTML games.  
It delivers a polished, app‑like experience with smooth animations, a cosmetic account system, dynamic layouts, and a clean, modern interface.

The project is intentionally simple and dependency‑free, built using only **HTML**, **CSS**, and **JavaScript**.  
It is split into **two main files**:

- `index.html` — the Game Centre hub (UI, account system, game launcher, locking logic)  
- `games/` — a folder containing individual HTML game files (each game runs independently)

This structure keeps the hub clean while allowing unlimited games to be added.

---

## ✨ Features

### 🔐 Cosmetic Local Account System
- On first launch, users are prompted to enter a display name.
- The name is saved in `localStorage` and shown at the top as **“Welcome NAME”**.
- Clicking the welcome text reopens the name prompt, allowing the user to change their name at any time.
- No backend or authentication — purely cosmetic and stored locally.

### 🎬 Custom Loading Animation
- Displays a large version of the Game Centre icon.
- Smooth fade‑out transitions.
- Shows **“Created and Designed by Jacob N”** before entering the app.
- Automatically routes to the name prompt or home screen depending on saved state.

### 🕹️ Responsive Game Grid
- Uses CSS Grid with `auto-fit` / `minmax()` to dynamically fill the screen.
- Automatically adjusts the number of game cards per row based on window size.
- Each card includes:
  - Thumbnail  
  - Game title  
  - Creator credits  

### 🧭 Clean Navigation
- Clicking a game opens it inside a full‑screen iframe viewer.
- A persistent **Back** button returns to the main hub.
- The top-left Game Centre icon reappears when returning home.

### ⏱️ Lesson-Time Locking System
- Uses predefined GMT time windows to block access during school lessons.
- Displays a countdown until lock/unlock.
- Includes an override code system (scrambled in the source).
- Override persists until the page is refreshed.

### 🖼️ Polished UI & UX
- Smooth hover animations on game cards.
- Centered welcome text.
- Subtle shadows and rounded corners for a modern look.
- Fully responsive layout for desktop, tablet, and mobile.

---

## 📁 Project Structure
