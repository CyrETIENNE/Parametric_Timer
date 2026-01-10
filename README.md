# Parametric_Timer

### Introduction
This project test has been developed by **Cyril ETIENNE**, on a Windows 11 device, ***without using AI.***
Let's deep dive into the details of this project.

### Part 1 : RTL Implementation of the parametric timer
The parametric timer has been designed in VHDL using **AMD's Vivado software**. The timer has been synthesized using **AMD's VIvado software** and is **synthesis-ready**. According to the specifications specified in the *coding_challenge_fpga_grad.pdf*, the timer VHDL module fully respects the provided entity interface.

**Assumptions :** 
1. *clk_freq_hz_g :* Most of the time *expressed in MHz* (as of 100e6 Hz for istance), must be *natural positive*.
2. *delay_g :* Must be *expressed in ms* and must be *natural positive*.

### Part 2 : Verification with VUnit
Several testbenchs were designed using notepad++. These testbenchs fully respect the syntax requirements of VUnit. In order to proceed to the test using VUnit and GHDL, I installed both on my computer :
1. **Installing VUnit :** From a Python IDE or directly in cmd (if you have Python3.13 installed on your device (can be downloaded through Windows Store)), type the following command : pip3 install vunit_hdl
2. **Installing GHDL :**
  1. **Downloading :** From the github of GHDL, we must look for a precompiled GHDL installation file (for Windows devices). Such file can be found in the following link : https://github.com/ghdl/ghdl/releases/download/v4.0.0/ghdl-MINGW32.zip
  2. **GHDL file :** Extract the .zip file and place the extracted folder in your :C disk.
  3. **Copy path to GHDL's bin folder :** In that folder, there is a bin folder. Copy the whole path to that bin folder.
  4. **Add path to the system global path :** After that, you have to add the path to that folder to the global PATH of your system throught modifying your Windows System Environment Variables (by typing in your windows search bar, *"environment variables"*, then clicking on *"edit environment variables for your system"*, then clicking on "Path" => edit => new => right click => paste (pasting the path to the GHDL bin folder). Press ok to exit.
  5. **Check Install :** Open cmd, type in : ghdl --version to check whether you successfully installed ghdl on your computer.
3. **Now, you have successfully installed VUnit and GHDL**.
4. **Github rproject repositery :** Download my repositery from github and copy the path to that folder.
5. **Run the VUnit tests :** In cmd prompt :
  1. **set the working directory** : Type the following command : *cd #path#* where #path# is the copied path.
  2. **run Vunit test** : Type : python3 run.py (or python run.py) to run the tests.

### Part 3 : Continuous Integration - CI on .github/workflows
CI was a concept I have known for years but I never had the chance to design one from scratch. This project was the perfect opportunity to get back into the basics of it.
The main purpose of my workflow was to create a CI pipeline that runs automatically the VUnit tests suite. In order to do so, I deep dived into VUnit and GHDL documentations and I learnt that both were available in, what's called a "ready-to-use" docker image. So, I had to work with docker images and containers.
1. **Create a Dockerfile** : Creating a docker image was the start of the CI pipeline. To start, you have to install docker and to then design a Dockerfile (file without any extension). The Dockerfile is a must-do and must be placed in the same folder as the project. Copy the path to that folder.
2. **Build and Push** : After creating my Dockerfile, in cmd prompt, type :
  1. *cd #path#* where #path# is the copied path.
  2. *docker build -t timer .* (this will actually build the docker image named timer
  3. *docker tag timer <docker.username/timer:v1.0>*
  4. *docker login -u <docker.username> -p <docker.token>*
  5. *docker push <docker.username/timer:v1.0>*
  6. docker rmi <docker.username/timer:v1.0>
  7. docker login -u <docker.username> -p <<docker.token>
  8. docker pull <docker.username/timer:v1.0>
  9. docker run <docker.username/timer:v1.0>
3. **Implementation in .github/workflows :** All these steps were repeated in the *.github/workflows* to make it work. I added two options to run the workflow, *on push* (meaning when the owner or someone who has access to that repositery modify, add or delete a file) or manually (*worflows_dispatch*)
