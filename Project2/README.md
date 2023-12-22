# Project 2: Estimating parameters of Predator-Prey model

This project was implemented as a part of Mathematical Modelling academic course.

## Table of Contents:
- [What is the Predator-Prey model](#what-is-the-predator-prey-model)
- [Objective of the project](#objective-of-the-project)
- [About the Implementation](#about-the-implementation)
- [More on the algorithms used](#more-on-the-algorithms-used)
- [Report](#report)
- [Author](#author)
- [Contributing](#contributing)
- [Show your support](#show-your-support)

## What is the Predator-Prey model:

The Predator-Prey model also known as the [Lotka-Volterra equations](https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations) are a pair of first-order nonlinear differential equations, frequently used to describe the dynamics of biological systems in which two species interact, one as a predator and the other as prey.

The Lotka Volterra model has additional applications to areas such as economics and marketing. It can be used to describe the dynamics in a market with several competitors, complementary platforms and products, a sharing economy, and more. There are situations in which one of the competitors drives the other competitors out of the market and other situations in which the market reaches an equilibrium where each firm stabilizes on its market share.

## Objective of the project:

The objective of the project was to estimate the parameters of the Predator-Prey model given a set of data describing the population size of two different species with respect to time. The variant of the Lotka-Volterra equations considered in this project is given by the following system of equations:

$$
\begin{equation}
\left\{
\begin{aligned}
    \frac{dx}{dt} &= r_xx(t) + r_{xy}x(t)y(t) + r_{xx}x^2(t) \\
   \frac{dy}{dt} &= r_yy(t) + r_{yx}x(t)y(t) + r_{yy}y^2(t)
\end{aligned}
\right.
\end{equation}
$$

where $x$ is a populations size of the prey species, $y$ is a population size of the predator species and $t$ represents the time. The system has $6$ coefficients: $r_x$, $r_{xy}$, $r_{xx}$, $r_y$, $r_{yx}$, $r_{yy} in R$, which influence the mutual relationship between $x$ and $y$.
The individual coefficients of the system can be interpreted as follows:
- $r_x$ - the growth coefficient of population $x$. The higher the value of this coefficient, the faster the population $x$ will grow.
- $r_y$ - the growth coefficient of population $y$. The higher the value of this coefficient, the faster the population $y$ will grow.
- $r_{xy}$ - the coefficient representing the influence of population $y$ on the growth of population $x$. It determines how changes in the population size of $y$ affect the rate of growth of population $x$.
- $r_{yx}$ - the coefficient representing the influence of population $x$ on the growth of population $y$. It determines how changes in the population size of $x$ affect the rate of growth of population $y$.
- $r_{xx}$ - the self-regulation coefficient of population $x$. This value determines how population $x$ regulates its own growth (intraspecific competition).
- $r_{yy}$ - the self-regulation coefficient of population $y$. This value determines how population $y$ regulates its own growth (intraspecific competition).

## About the Implementation:

Matlab was an imposed programming language for implementing the project.

## More on the algorithms used:

In the process of estimation various numerical methods for solving systems of differential equations were implemented.

## Report:

In the `Report` folder a file called `Report.pdf` can be found. It contains a very detailed descritption of the methodology employed during the process of estimating the parameters of the Predator-Prey model, as well as all the plots and conclusions, which arosen from the progress at the project development.

## Author:

My GitHub: [@adamgracikowski](https://github.com/adamgracikowski)

## Contributing:

All contributions, issues, and feature requests are welcome! 🤝

## Show your support:

Give a ⭐️ if you like this project and its documentation!