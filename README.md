# 🧠 Remindly

**Remindly** is a modern iOS reminders app focused on **recurring life-maintenance tasks** — the things people forget until they’re overdue.

Unlike traditional to-do apps, Remindly is designed around *ongoing responsibilities* like housework, car maintenance, food expiration tracking, and garden care, with clear visual cues for what’s overdue and what’s coming up.

Built with **SwiftUI + Core Data**, Remindly emphasizes clean architecture, natural-language recurrence, and a polished user experience.

---

## ✨ Key Features (Current State)

### 🔁 Smart Recurring Reminders
- Repeat reminders:
  - Every **X day** or **X days**
  - Every **X week** or **X weeks**
  - Every **X month** or **X months**
  - Monthly on a specific day (e.g. *1st, 15th, 30th*)
- Natural-language recurrence UI  
  > _“Repeats every 2 weeks”_

---

### 📅 Clear Status Visibility
- **Overdue reminders** are highlighted in red
- **Upcoming reminders** are grouped separately
- Immediate UI updates when a recurring reminder is completed

---

### 🗂 Categories Designed for Real Life
- Housework
- Car maintenance
- Garden work
- Food expiration
- Architecture supports future category expansion

---

### ⚡ Smooth SwiftUI Experience
- Reactive UI updates using `@ObservedObject`
- Core Data persistence
- Swipe actions for fast completion
- SwiftUI previews supported

---

## 🏗 Architecture & Tech Stack

**Platform**
- iOS

**Language**
- Swift

**UI**
- SwiftUI

**Persistence**
- Core Data

**Architecture**
- MV-style separation (Views + Logic extensions)

**Tooling**
- Xcode 14.2

---

## 📁 Project Structure
```
Remindly/
├─ Models/
│ ├─ Reminder+CoreDataClass.swift
│ ├─ Reminder+Logic.swift
│ ├─ RecurrenceType.swift
│
├─ Views/
│ ├─ ContentView.swift
│ ├─ AddReminderView.swift
│ ├─ ReminderRowView.swift
│ ├─ RecurrencePickerView.swift
│
├─ Persistence/
│ ├─ PersistenceController.swift
│
├─ Resources/
│ ├─ Remindly.xcdatamodeld
│
└─ RemindlyApp.swift
```

**Structure goals**
- Business logic separated from UI
- Core Data concerns centralized
- Views remain lightweight and reactive

---

## 🧠 Design Philosophy

Remindly is intentionally **not** a generic to-do list.

Design principles:
- Optimize for **long-term recurring tasks**
- Make recurrence **human-readable**, not technical
- Surface **what matters now**
- Reduce friction for everyday actions

This project is treated as a **real product**, not a demo app.

---

## 🚧 Known Limitations

- No push notifications yet
- Monthly recurrence is day-based only
- Categories are not user-editable
- No iCloud sync
- No unit/UI tests yet

These were deliberate tradeoffs for the initial iteration.

---

## 🔮 Planned Improvements

### High Priority
- 🔔 Local notifications with automatic rescheduling
- 📆 Weekly weekday selection (e.g. “Every Monday”)
- 📅 “Last day of the month” recurrence option

---

### Medium Priority
- 🏷 User-editable categories
- 🔍 Category filtering on the main screen
- 📊 Improved sorting and grouping

---

### Long-Term
- ☁️ iCloud sync
- 🧪 Unit tests for recurrence logic
- 🎨 Theming & accessibility improvements
- 📱 iPad support

---

## 📌 Why This Project Exists

Remindly was built as a **portfolio-quality side project** to demonstrate:

- Real-world SwiftUI patterns
- Correct Core Data + SwiftUI reactivity
- Thoughtful UX decisions
- Scalable architecture choices

It reflects how I approach **production-quality mobile software**.

---

## 👤 Author

**Maurizio Altamura**  
Software Engineer  
M.S. Computer Science — University of Central Florida
