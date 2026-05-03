
# Badgeathon

On the 2nd and 3rd of May 2026 Duncan Thomas was kind enough to put on a hackathon at his alumni university of Aberystwyth inspired by conferences badges found at events such as DEFCON and EMF.

I formed a team with [Rosia](https://rosia.me) and together we tried to to make a cool thing.

## But first; some learning

We were presented with some new hardware:

### [CYD (Cheap yellow display)](https://github.com/witnessmenow/ESP32-Cheap-Yellow-Display)

The CYD is an adorable little board with:

<img src="images/CYD.jpg" alt="CYD board">

1. ESP32 (ESP32-2432S028R if your being fussy)
2. 320 x 240 LCD Display (2.8")
3. Touch Screen (Resistive)
4. RGB LED
5. LDR.
6. a whole host of support for fun periphals (I2c, SPI, microSD, speaker)

All attendees were given one of these lovely little boards to keep courtesy of Duncan

We were then shown how to flash [https://docs.micropython.org](micropython) bundled with [lvgl](https://lvgl.io/) to the boards using [esptool](https://github.com/espressif/esptool), and let loose to experiment running example code and trying to work out how to do whatever we wanted the board to do for the rest of the day.

Myself and Rosia spent a lot of the day trying to find accurate documentation for the specific libraries we were using, which turned out to be rather frustrating due to the various different versions of the lvgl library, at the end of the day I decided to give the arduino libraries a try and found them much more friendly and immeadiately had a a good path forward for our project idea.

## Team: Beauty of baud

For our project idea we thought it would be fun to have a pair of CYD boards that would allow students to surreptitiously pass notes in class by drawing on the touch display and having their actions mirrored on the oppossing screen.

To do this we first looked at example code for drawing on the screen and detecting user input, from there we started mangaling the example code into a shape that better served us.

### Drawing on the screen

The TFT and XPT2046 libraries provide really clean methods for extracting the location on screen the user is pressing as well as for drawing new pixels on the display, so we had a stylus drawing on the screen basically at the start of the day. This section was pair proggramming

For color changing on implemented the lvgl library to have a color slider and had TFT draw a block of pixels by the slider as a color preview, this proved to be fiddly as lvgl and tft libraries defined their coordinate systems with different origins. This section I developed myself while Rosia worked on networking.

### Network coms






Mine and Rosias project can be found on her [gitea](https://repos.rosia.me/Bobyn/CYDhackathon) instance.
