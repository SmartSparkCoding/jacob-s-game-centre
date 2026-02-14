# Jacob's Game Centre

<!-- LOGO PLACEHOLDER -->
<p align="center">
  <img src="https://github.com/SmartSparkCoding/jacob-s-game-centre/blob/main/MAIN%20LOGO.jpg" alt="Game Centre Logo" width="200">
</p>

<a href="https://jacob-s-game-centre.pages.dev" alt="Link to Website" id="_blank">Click here for my Website</a>

## Overview

**Game Centre** is a lightweight, responsive, browser‑based hub for launching locally hosted HTML games.  
Workes completely on the web thanks to **Cloudflare Pages**!
It delivers a polished, app‑like experience with smooth animations, a cosmetic account system, dynamic layouts, and a clean, modern interface.

The project is intentionally simple and dependency‑free, built using only **HTML**, **CSS**, and **JavaScript**.  
It is split into **two main file groups**:

- `index.html` — the Game Centre hub (UI, game launcher, locking logic)  
- `OTHER FILES` — contains individual HTML game files (each game runs independently)

This structure keeps the hub clean while allowing unlimited games to be added.

---

## ✨ Features

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

## 🧠 Technologies Used

- **HTML5** — structure and game embedding - Scratch games are converted to HTML5 format 
- **CSS3** — responsive grid, animations, UI styling  
- **JavaScript** — account system, locking logic, transitions, localStorage  

No frameworks. No build tools. No dependencies.

---

## 🚀 How It Works

1. **User opens the app**  
   → Loading animation plays  
   → “Created and Designed by Jacob N” fades in  

2. **Home screen loads**  
   → Responsive grid of games  
   → “Welcome NAME” appears at the top  

3. **User selects a game**  
   → Game loads in full‑screen viewer  
   → Back button returns to hub  

4. **Lesson-time logic**  
   → If current GMT time is inside a blocked window, the app locks  
   → Override code can unlock it  

---

## 📜 License

This project is released under the **MIT License**.  
You are free to modify, distribute, and use it in your own projects.

---

## 🙌 Credits

**Created and Designed by Jacob N**  
Additional credits to friends who created or converted the included games can be found under each game.
Further thanks to the **Turbo Warp Packager** Team who created the Scratch to HTML converter. You can find a link to their GitHub <a href="https://github.com/TurboWarp/packager" target="_blank">Here</a>

---
