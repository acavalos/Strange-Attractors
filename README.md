# Strange-Attractors
A fun visualization of 2-dimensional strange attractors using Processing. 3.0+,

## Processing 3.0+
The .pde files require the user to install a version of Processing 3.0 or above.  
Can be downloaded [here](https://processing.org/).

## Controls  
Zooming and translating the image can be a little finicky. 

**'wasd':** Up,Right,Down,Left  
**'mwheelUP':** Zoom in  
**'mwheelDOWN':** Zoom out  
**'r':** Reset background  
**'m':** Change Mode  
**'n':** Generate New Polynomial  

## Mode  
The default mode has thousands of low alpha dust particles moving chaotically. As particles land 
within the same pixel, the pixel becomes darker, illuminating the underlying structure 
of the attractor.

Pressing 'm' maxes the alpha of each pixel, but pixels are no longer painted over. Then, the user
can see the cloud formed by the dust in real time. It is fun to go back and forth between the modes 
to really appreciate the order behind the chaos.
