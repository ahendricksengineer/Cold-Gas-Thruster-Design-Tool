# Cold-Gas-Thruster-Design-Tool
# Cold Gas Thruster Performance Tool

## Overview

The Cold Gas Thruster Performance Tool is a MATLAB-based analytical application developed to evaluate the performance of conceptual cold gas propulsion systems using first-principles compressible flow theory.

The program calculates nozzle performance from user-defined operating conditions and predicts mass flow rate, exit conditions, and theoretical thrust generation. In addition to single-point performance analysis, the tool includes parametric sweep capabilities for evaluating the effects of chamber pressure and nozzle throat diameter on overall system performance.

This project was developed independently to strengthen my understanding of propulsion system design, thermodynamics, fluid mechanics, and engineering software development.

---

## Features

- User-selectable working gases
  - Nitrogen
  - Air
  - Helium
  - Argon
  - Carbon Dioxide

- User-defined operating conditions
  - Chamber pressure
  - Ambient pressure
  - Chamber temperature
  - Throat diameter
  - Exit diameter

- Compressible flow analysis

- Choked flow determination

- Isentropic nozzle analysis

- Exit Mach number calculation

- Exit pressure, temperature, and velocity calculations

- Momentum thrust calculation

- Pressure thrust calculation

- Total thrust prediction

- Nozzle expansion classification
  - Underexpanded
  - Ideally Expanded
  - Overexpanded

- Chamber pressure parameter sweep

- Throat diameter parameter sweep

- 2D converging-diverging nozzle visualization

---

## Engineering Methods

The analytical model is based on classical compressible flow relationships and assumes:

- One-dimensional steady flow
- Isentropic nozzle expansion
- Ideal gas behavior
- Constant specific heat ratio (γ)
- No viscous losses
- No heat transfer
- No internal shock waves
- Perfect nozzle geometry

---

## Program Outputs

The software calculates:

- Critical pressure ratio
- Choking condition
- Mass flow rate
- Exit Mach number
- Exit pressure
- Exit temperature
- Exit velocity
- Momentum thrust
- Pressure thrust
- Total thrust
- Nozzle expansion condition

The software also generates:

- Thrust vs. Chamber Pressure
- Mass Flow Rate vs. Chamber Pressure
- Thrust vs. Throat Diameter
- Mass Flow Rate vs. Throat Diameter
- 2D nozzle geometry visualization

---

## Example Analysis

Example Inputs

- Gas: Nitrogen
- Chamber Pressure: 300 psia
- Ambient Pressure: 14.7 psia
- Chamber Temperature: 530 °R
- Throat Diameter: 0.125 in
- Exit Diameter: 0.250 in

Example Results

- Flow Condition: Choked
- Exit Mach Number: 2.94
- Mass Flow Rate: 0.084 lbm/s
- Exit Velocity: 2043 ft/s
- Total Thrust: 5.03 lbf

---

## Project Structure

```
ColdGasThrusterTool/

│── Main.m

├── Functions/
│   ├── gasProperties.m
│   ├── nozzleGeometry.m
│   ├── checkChoking.m
│   ├── massFlowRate.m
│   ├── exitMachNumber.m
│   ├── exitConditions.m
│   ├── classifyExpansion.m
│   ├── nozzleThrust.m
│   ├── pressureSweep.m
│   ├── throatSweep.m
│   └── plotNozzleDiagram.m
```

---

## Future Development

Planned enhancements include:

- Blowdown tank modeling
- Propellant mass estimation
- Burn time prediction
- Total impulse calculations
- Specific impulse (Isp)
- Exit diameter optimization
- Automatic nozzle sizing
- Multi-gas performance comparisons
- Additional nozzle geometries
- Atmospheric altitude models
- MATLAB App Designer graphical interface
- Automated engineering report generation

---

## Purpose

This project is intended to demonstrate the application of mechanical engineering principles to propulsion analysis while expanding experience in numerical modeling, MATLAB programming, and engineering software development.

---

## Disclaimer

This software is intended for educational and conceptual engineering analysis only. It has not been validated for flight hardware design or safety-critical engineering applications.

---

## Author

Andrew Hendricks

Mechanical Engineer (EIT)

B.S. Mechanical Engineering

Old Dominion University
