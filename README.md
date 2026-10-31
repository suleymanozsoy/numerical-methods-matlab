# Numerical Methods with MATLAB

A collection of MATLAB implementations exploring numerical methods, mathematical modeling, and ordinary differential equations .

The goal of this repository is to understand how mathematical problems can be translated into numerical algorithms, implemented in code and analyzed through simulations.

## Projects

### 1. Lotka–Volterra Predator – Prey Model

**File:** [lotka_volterra.m](./lotka_volterra.m)

A numerical simulation of the interaction between predator and prey populations.

**Mathematical model:**

- `dx/dt = x(1 - y)`
- `dy/dt = y(x - 1)`

Where `x` represents the prey population and `y` represents the predator population.

**Implemented methods:**
- Euler's Method
- Fourth-Order Runge–Kutta (RK4)

**Features:**
- Numerical solutions of a coupled ordinary differential equation system

- Simulations with different initial conditions

- Population vs. time plots

- Phase portrait visualization

- Graph and PDF exports

This project explores how numerical methods approximate population dynamics and how different initial conditions affect the resulting trajectories.

### 2. Falling Parachutist — Euler's Method

**File:** [parachutist_euler.m](./parachutist_euler.m)

A numerical simulation of a parachutist falling under gravity and linear air resistance.

**Mathematical model:**

`dv/dt = g - (c/m)v`

Where:
- `v` — Velocity (m/s)
- `g` — Gravitational acceleration (m/s²)
- `m` — Mass (kg)
- `c` — Air resistance coefficient (kg/s)

**Analytical solution:**

`v(t) = (mg/c)(1 - exp(-ct/m))`

**Euler's Method:**

`v(i+1) = v(i) + (g - (c/m)v(i)) * dt`

**Features:**
- Analytical solution calculation

- Numerical approximation using Euler's Method

- Visualization of analytical and numerical solutions

- Adjustable time step (`dt`) for exploring numerical accuracy

The simulation demonstrates how reducing the time step generally improves the accuracy of Euler's Method at the cost of additional computations.

## Repository Structure

| File | Description |
|---|---|
| `lotka_volterra.m` | Predator–prey simulations using Euler and RK4 |
| `parachutist_euler.m` | Analytical and Euler solutions for a falling parachutist |
| `README.md` | Project documentation |

## Getting Started

1. Install MATLAB or open MATLAB Online.
2. Clone or download this repository.
3. Open one of the `.m` files in MATLAB.
4. Click **Run** to execute the simulation.
5. Examine the generated figures.

To experiment with numerical accuracy, modify the step-size variable (`dt` in the parachutist simulation or `h` in the Lotka–Volterra simulation).

## Learning Objectives

Through these projects, I aim to:

- Strengthen my understanding of numerical analysis.
- Implement mathematical algorithms from scratch.
- Develop practical MATLAB programming skills.
- Understand the relationship between differential equations and numerical approximations.
- Explore numerical accuracy, stability and computational efficiency.

## Technologies

- MATLAB
- Numerical Analysis
- Ordinary Differential Equations
- Mathematical Modeling

## About

This repository documents my ongoing learning process in numerical methods and scientific computing as a Computer Engineering student.
