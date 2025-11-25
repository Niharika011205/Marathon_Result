
# Marathon Results Program - EMU8086

## Overview

This program is written in **8086 Assembly language** for **EMU8086**.  

It simulates a **marathon results tracker**:

1. Reads the **number of players**.  
2. Accepts **player numbers** (IDs) and their **completion times**.  
3. Sorts the players based on **time in ascending order** (fastest first).  
4. Displays the **full sorted list**.  
5. Displays the **Top 3 winners**.  
6. Exits automatically after showing the winners.

---

## Features

- Bubble sort algorithm for sorting times.  
- Maintains proper player-time pairing during sorting.  
- Clean numeric display without EMU8086 garbage values.  
- Shows **Top 3 winners** clearly.  
- Fully automated exit after displaying results.  

---

## How to Run

1. Open **EMU8086**.  
2. Create a new file and paste the program code.  
3. Assemble the code (F7) and run (F9).  
4. Follow on-screen prompts:

    - Enter the **number of players** (maximum 25).  
    - Enter **player numbers** (IDs).  
    - Enter **completion times** for each player.

5. After entering all details:

    - The program displays the **full sorted results**.  
    - Then it displays the **Top 3 winners**.  
    - Program exits automatically.  

---

## Example Input / Output

**Input:**

Enter Number of players: 5
Enter Player Numbers: 7 3 9 1 5
Enter Times (minutes): 40 10 5 50 30

makefile
Copy code

**Output:**

After sorting (Player Time):
9 5
3 10
5 30
7 40
1 50

Top 3 Winners:
9 5
3 10
5 30

yaml
Copy code

---

## Notes

- Maximum number of players: **25**.  
- Numeric input only; letters or invalid characters will cause errors.  
- Sorting is **stable** for identical times: earlier entered player appears first.  
- Uses EMU8086 `PRINT_NUM_UNS` to display numbers.  

---

## Requirements

- **EMU8086 IDE** or any compatible 8086 emulator.  
- Basic understanding of keyboard input and console operation.  

---

## Author

- Written by: Ramishetty Niharika  
- Language: 8086 Assembly  
- Date: 2025-11-25  
