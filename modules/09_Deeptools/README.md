# Module 9 Deeptools analysis 

## Introduction

Deeptools is for visualizing, analyzing DNA-seq next generation sequencing (ngs) experiments.

Requires High Performance Computing (HPC), which requires linux.

Required too much background, practice. ***BUT*** I got *bash jupyter notebooks* working. 

Allows us to work on linux, learning analysis, using command line and bash inside of **code cells**, like code chunks in RMarkdown.

Drawback - not hands on learning of bash/command line
- take DSCI510 (Linux as a computational platform) in the fall.
- DSCI512 (RNA-seq analysis) for more experience.
- use CMB code club for materials/tutorials
    - we're planning on some regular workshop-style topics in the summer
    - may ask help adapting material

## What we're doing this week

- Monday
    - 1st hour - David: 
        - Overview of HPC, getting started on Alpine Web Interface
        - Run setup code on Alpine using Jupyter BASH notebooks 
        - Troubleshoot if necessary
    - 2nd hour - Sarah Swygert:
        - Overview of ChIP-based methods
- Wednesday
    - Sarah Swygert: Deeptools analysis and Exercises

---


## Background 

[Why biologists need high performance computing (HPC) (video)](https://youtu.be/eQ660XXG9MI?si=taE-LA_GYI7DF5ue)


## Alpine Overview (from DSCI510)

**Supercomputers** in the crudest terms are basically what happens if
you glued 100\'s or 1000\'s of individual computers together. You end up
making a giant computer with more functionality.

The supercomputer we\'ll be using is **ALPINE** and it lives on CU
Boulder campus. ALPINE is a joint venture between Colorado State
University and CU Boulder and is sponsored by those institutes and by a
grant from the National Science Foundation. **ALPINE** is shared between
CU Boulder, Colorado State University, CU Anschutz, and RMACC (Rocky
Mountain Advanced Computing Consortium, a network of \>20 other academic
institutions in Colorado, Arizona, Idaho, Montana, and New Mexico).

There is a list of the [Top 500 biggest
supercomputers](https://www.top500.org/lists/top500/list/2023/06/) on
the planet (as of June 2023). According to this list, the largest
supercomputer is **FRONTIER** located at Oak Ridge National Labs in
Tennessee and run by the DOE (US Department of Energy).

How do these supercomputer systems compare to our laptops?


  |**Typical laptop**                 | **Alpine Supercomputer**  |  **FRONTIER Supercomputer**|
  |-----------------------------------|---------------------------|---------------------------|
  |0.1 - 10 teraFLOPS                 |450 teraFLOPS              |1,102,000 teraFLOPS        |
  |1 - 4 cores organized onto 1 node  |>15,500 cores on 458 nodes |    8,730,112 cores        |
  

-   FLOPS: a measure of how many floating point operations a computer
    can do per second. So it\'s a measure of calculations a second
-   Node: Like a miniature computer within the cluster
-   Core: Independent processing unit on a CPU (central processing unit)

**A *cluster* of nodes**

<figure>
    <img src="setup/img/cluster.png" alt="cluster diagram" width="400" height="297">
    <figcaption>https://www.hpc2n.umu.se/documentation/guides/beginner-guide</figcaption>
</figure>

**A compute node (blade)**

<figure>
    <img src="setup/img/ACTblade-side.png" alt="Compute node (blade)">
    <figcaption>ACT blade from https://www.advancedclustering.com</figcaption>
</figure>

------------------------------------------------------------------------

### What are the benefits and drawbacks of using a supercomputer?

**Benefits**

-   power, efficiency, and speed!!!
-   team of professionals to help set up the system and provide user
    support
-   allows for collaboration with other users

**Drawbacks**

-   There is a learning curve
-   Multi-user platform requires job-sharing - there is usually a queue
    to execute your code
-   May not have architecture specialized for your task.


### Video: Logging on to Alpine Web Interface

[CU Research computing (video) - logging on with OnDemand](https://www.youtube.com/watch?v=cP6lfRWywk0)

### Video: Alpine File Organization

[CU Research computing (video) - File system](https://www.youtube.com/watch?v=xfeRDnZQrJ4&t=18s)

