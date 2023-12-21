# Project 1: Solving Ordinary Differential Equations

This project was implemented as a part of Mathematical Modelling academic course.

## Table of Contents:
- [What are differential equations](#what-are-differential-equations)
- [Objective of the project](#objective-of-the-project)
- [About the Implementation](#about-the-implementation)
- [More on the algorithms used](#more-on-the-algorithms-used)
- [Report](#report)
- [Author](#author)
- [Contributing](#contributing)
- [Show your support](#show-your-support)

## What are differential equations:

In mathematics, a [differential equation](https://en.wikipedia.org/wiki/Differential_equation) is an equation that relates one or more unknown functions and their derivatives. In applications, the functions generally represent physical quantities, the derivatives represent their rates of change, and the differential equation defines a relationship between the two. Such relations are common; therefore, differential equations play a prominent role in many disciplines including engineering, physics, economics, and biology.

## Objective of the project:

The objective of the project was to implement and compare selected numerical methods and algorithms related to solving ordinary differential equations and other possibilities offered by the MATLAB programming environment in this field of study.

The operational procedures of individual methods and algorithms were exemplified by the following system of differential equations:

$$
\begin{equation}
\left\{
\begin{aligned}
    \frac{dy_1}{dt} &= -2y_1 - 2y_2 + x \\
    \frac{dy_2}{dt} &= -2y_1 + 7y_2 + x
\end{aligned}
\right.
\end{equation}
$$

where $t \in [0, 8]$, and $x(t) = e^{-t} \cdot \sin(t)$. The initial conditions of the differential equation are: $y_1(0) = 0$, $y_2(0) = 0$.

<p align="center">
<img src="https://github.com/adamgracikowski/Mathematical-Modelling/blob/master/Project1/Images/dsolve.png" alt="dsolve" width="500"/>
</p>
<p align="center">Solution to the system of ODEs.</p>

## About the Implementation:

MATLAB was an imposed programming language for the implementation of the project. 

## More on the algorithms used:

The following numerical methods were implemented:
- Modified Euler's method:
$$y_n = y_{n-1} + \frac{h}{2} \cdot \Big( f(t_{n-1}, y_{n-1}) + f(t_{n-1} + h, y_{n-1} + h \cdot f(t_{n-1}, y_{n-1})) \Big)$$

- Three-step Adams-Bashforth method:
$$y_n = y_{n-1} + \frac{h}{12} \cdot \Big( 5f(t_{n}, y_{n}) + 8f(t_{n-1}, y_{n-1}) - f(t_{n-2}, y_{n-2})) \Big)$$

- Implicit Runge-Kutta method:
$$y_n = y_{n-1} + h \cdot \sum_{i=1}^{3} w_if_i$$
where:
$$f_i = f \Big(t_{n-1} + c_kh, y_{n-1} + h \cdot \sum_{j=1}^{3} a_{i, j}f_j\Big)$$

## Report:

In the `Report` folder a file called `Report.pdf` can be found. It contains a further discussion on the topic of solving ordinary differential equations as well as some experiments with numerical stability of the methods mentioned above. 

As the academic course was conducted in Polish, all the contents of the `Report.pdf` is sadly available only in Polish.

<p align="center">
<img src="https://github.com/adamgracikowski/Mathematical-Modelling/blob/master/Project1/Images/are.png" alt="are" width="500"/>
</p>
<p align="center">Numerical instability resulting from too large integration step.</p>

## Author:

My GitHub: [@adamgracikowski](https://github.com/adamgracikowski)

## Contributing:

All contributions, issues, and feature requests are welcome! 🤝

## Show your support:

Give a ⭐️ if you like this project and its documentation!
