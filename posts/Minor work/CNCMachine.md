
# CNSelfie

This was a project I worked on during my time as the robotics society president in collaboration with a new member (Good friend [Rosia Evans]). Together we created an interactive robot for kids coming to university open days and similar events, it would display a camera view and detect outlines then when a photo was taken with it, it would generate gcode from these lines to direct the society's homemade CNC machine to draw out what it saw. The idea being that kids could have drawings of themselves made by a robot they could take home.

It was completed over the course of two weeks, my role in this project was largely managerial, providing advice and high level implementation directions.

## Overview
The program worked using [OpenCV](https://opencv.org/). OpenCV would detect sharp edges and produce a black and white image, this would then by converted into a vector which was then converted into gcode as paths for the CNC machine. Initially we attempted to use a [library](https://github.com/PadLex/SvgToGcode) for converting between vectors and gcode but found it didn't have all the functionality we needed so ended up adding a lot of extra methods and rewriting a few of them.

This GCode was then sent by [Universal Gcode Sender](https://github.com/winder/Universal-G-Code-Sender) to our CNC machine.

## Demonstration

<div style="display:flex; gap: 10px;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/ZUDhqIgixiA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<iframe width="560" height="315" src="https://www.youtube.com/embed/xjyn54UnaAA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

