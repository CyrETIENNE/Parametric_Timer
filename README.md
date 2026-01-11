# Parametric_Timer
>Author/engineer : **Cyril ETIENNE**

>OS : **Windows 11**
 
>AI use : **No**

## I. Introduction
The purpose of this project is to design a clean and maintainable parametric timer using VHDL and testing it with VUnit and GHDL. Let's deep dive into the details of this project.

**Assumptions :** 
1. *clk_freq_hz_g : Expressed in MHz. Must be *natural positive*.
2. *delay_g : Must be *expressed in ms* and must be *natural positive*.

## II. How to run the code locally ?

#### 1. Download my Github repository :
1.1. First, download all of the different files available on my *Parametric_Timer* repository : you can click on the following link to download : *https://github.com/CyrETIENNE/Parametric_Timer/archive/refs/heads/main.zip* 

1.2. Extract the .zip and place it wherever you want.

#### 2. Install VUnit :
2. On Windows 10/11 devices only, download Python 3.13 from the Microsoft Store. Open the command prompt (by typing ***cmd*** on the Windows search bar), type in the following command : *pip3 install VUnit_hdl. If an update of *pip3* is available, please do it.

#### 3. Download and Install GHDL :
3.1. To download GHDL, we must look at their github page. For windows devices users, we must look for a precompiled GHDL file. Hence, download such a file following this link : *https://github.com/ghdl/ghdl/releases/download/v4.0.0/ghdl-MINGW32.zip*

3.2. Extract the .zip file and place it somewhere in your *C:disk*. Once placed, open the GHDL folder, you will see a subfolder named *bin*. Copy the path to that subfolder.

3.3. Add this path to your system's global path following these steps :
   1. Type in your Windows search bar : *environment variables*.
   2. Click on : *edit environment variables for your system*.
   3. Click once on *Path*.
   4. Below, click on *edit*.
   5. A new window should open. Click on *new*.
   6. Do a right click on your mouse then paste the GHDL's bin subfolder path.
   7. Click OK to exit.
   8. Open the cmd again. Type in : *ghdl --version* to check if GHDL was successfully installed (you should see GHDL version number).
   9. GHDL has been successfully installed.

#### 4. Run the tests
4.1. Open cmd. Set the working directory by typing : *cd <path>* where <path> is the path of my Github repository that you downloaded and extracted.

4.2. Run the tests by typing : *python3 run.py*.
