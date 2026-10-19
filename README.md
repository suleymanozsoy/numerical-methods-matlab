# Lotka-Volterra Predator-Prey Model

## Overview

This project implements a numerical simulation of the **Lotka-Volterra predator-prey model** using MATLAB.

The Lotka-Volterra equations describe how two interacting populations, predators and prey, change over time.

The main purpose of this project is to implement and explore two numerical methods for solving systems of ordinary differential equations.

## Mathematical Model

The Lotka-Volterra model consists of two differential equations:

**dx/dt = αx − βxy**

**dy/dt = δxy − γy**

Where:

- **x:** Prey population
- **y:** Predator population
- **α:** Prey growth rate
- **β:** Predation rate
- **γ:** Predator mortality rate
- **δ:** Predator reproduction rate

## Numerical Methods

Two numerical methods are implemented in MATLAB:

### 1. Euler Method
A first-order numerical method that approximates the solution using the derivative at the current point.

### 2. Runge-Kutta Method (RK4)
A fourth-order numerical method that uses four intermediate slope calculations to achieve higher accuracy.

## Objectives

- Implement numerical methods in MATLAB.
- Solve a system of ordinary differential equations.
- Study predator-prey population dynamics.
- Explore the differences between Euler and RK4 methods.

## How to Run

1. Open MATLAB.
2. Download the MATLAB `.m` file from this repository.
3. Open the file in MATLAB.
4. Run the script to execute the numerical simulation.

## Technologies Used

- MATLAB
- Numerical Analysis

## About

This project was developed as part of my learning process in numerical methods, differential equations and MATLAB programming.
