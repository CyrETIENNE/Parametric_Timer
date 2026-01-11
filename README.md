# Parametric_Timer
>Author/engineer : **Cyril ETIENNE**

>OS : **Windows 11**
 
>AI use : **None**

## I. Introduction
The purpose of this project is to design a clean and maintainable parametric timer using VHDL and testing it with VUnit and GHDL. Let's deep dive into the details of this project.

**Assumptions :** 
1. *clk_freq_hz_g :* **Expressed in Hz**. Must be *natural positive*.
2. *delay_g :* **Expressed in ms**. Must be *natural positive*.

## II. How to run the code locally ?

### 1. Download my Github repository :
1.1. First, download all of the different files available on my *Parametric_Timer* repository : you can click on the following link to download : **https://github.com/CyrETIENNE/Parametric_Timer/archive/refs/heads/main.zip** 

1.2. Extract the .zip and place it wherever you want.

### 2. Install VUnit :
2. On Windows 10/11 devices only, download *Python 3.13* from the Microsoft Store. Open the **command prompt** (by typing ***cmd*** on the Windows search bar), type in the following command : **pip3 install vunit_hdl**. (If an update of *pip3* is available, feel free to do it or not (not mandatory here)).

### 3. Download and Install GHDL :
3.1. To download GHDL, we must look at their github page. For windows devices users, we must look for a precompiled GHDL file. Hence, download such a file following this link : **https://github.com/ghdl/ghdl/releases/download/v4.0.0/ghdl-MINGW32.zip**

3.2. Extract the .zip file and place it somewhere in your **C:disk**. Once placed, open the **GHDL folder**, you will see a subfolder named **bin**. **Open it and copy the path**. (the path should look like *'..\GHDL\bin'*)

3.3. Add this path to your **system's global Path** by following these steps :
   1. Type in your Windows search bar : **environment variables**
   2. Click on : **edit environment variables for your system**. A window opens.
   3. Click on : **environment variables**
   4. Click once on **Path**
   5. Below, click on **edit**
   6. A new window should open. Click on **new**.
   7. Do either **CTRL+V** or **right click on your mouse** to paste the GHDL's bin subfolder path.
   8. Click **OK** to exit.
   9. Open the **cmd** again. Type in : **ghdl --version** (to check if GHDL was successfully installed (you should see GHDL version number).
   10. GHDL has been successfully installed.

### 4. Run the tests
4.1. Open **cmd**. Set the working directory by typing : **cd #path#** where **#path#** is the path of **my Github repository that you downloaded and extracted in the first step**.

4.2. Run the tests by typing : **python3 run.py**

### 5. Remarks
5.1. If you want to add custom testbenchs, you can simple copy one of my testbenchs code and change the *clk_freq_hz_g (in Hz)* and *delay_g (in ms)* parameters values using Notepad++, AMD Vivado, etc...

5.2. **Regarding the "Stretch Goal : Formal Verification"**
   1. I intended working my way into this part. After installing OSS Cad Suite, I quickly figured out I couldn't use my designed VHDL timer as the only command that was able to bind VHDL and SV (SystemVerilog) files, aka **verific** is simply not available in the free open source version of OSS Cad Suite.
   2. Hence, I decided to manually translate my VHDL code in SV (this code is provided in the **src\stretch_goal** folder). Assertions were written in SV so I wanted to only use SV files (and including assertions directly in my SV code). I replicated my VHDL timer code in SV, checked its behaviour through simulations to assure that it behave like my VHDL timer (via Vivado).
   3. Once done, I wrote a *.sby* file to run the sby function.
   4. The problem I encountered was that in part of the sby function process, my code always failed at the *read_verilog -sv* because of SV syntax error in my assertion (*"assert property (@(posedge(clk_i) ...))"*) in particular because of the "**@**" if that makes sense. *read_verilog -sv* is a function that checks the whole syntax of your SV code.
   5. To verify that this was the problem, I ran my SV code without the assertion (via both commands *sby* and then via *yosys.read_verilog -sv*) and it passed both commandes flawlessly.
   6. I guess one possible solution should have been translating my VHDL timer code in Verilog instead.
