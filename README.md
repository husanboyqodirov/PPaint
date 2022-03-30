# PPaint
 Paint program written in Processing.

> PPaint v1.0  
> Developers: Husanboy Qodirov & Hasanboy Qodirov  
> [Final project](PPaint_Final_Project.pdf) for Computer Graphics 101    
> Written in Processing 4.0b7  
> https://processing.org


## Introduction

* PPaint (Processing Paint) is a program capable of providing general drawing experience with extra features.
* Written entirely with code (no drag and drop).
* Based on precise calculations to place objects on screen and manage interactions for them.
* Our goal is not to deliver the best paint program to public, but to show that it is possible to make these sort of programs using Processing only with coding.

## Interactions

* mousePressed() - called once after every time a mouse button is pressed.
* keyPressed() -  called once every time a key is pressed. The key that was pressed is stored in the key variable.

## Output

saveFrame() - Saves a numbered sequence of images, one image each time the function is run. We use this function to save a drawing user has drawn. It is stored in a local 'drawings' folder as PNG image format.

## Features
1. Draw in 6 different pencil colors.
2. Adjust ink size (thin, normal, thick).
3. Choose background style (colored, grid, lined).
4. Eraser and empty sheet tool.
5. Listen to music while drawing.
6. Save finished drawing as PNG image file.
7. Coordinates for mouseX and mouseY.
8. Prevent drawing on toolbar.

## Process Diagram

![](process_diagram.png)

## UI & Sample Drawings

![](drawings/drawing17092.png)  
![](drawings/drawing23823.png)  
![](drawings/drawing30276.png)  
