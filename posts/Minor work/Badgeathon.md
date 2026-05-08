
# Badgeathon

On the 2nd and 3rd of May 2026 Duncan Thomas was kind enough to put on a hackathon at his alumni university of Aberystwyth inspired by conferences badges found at events such as DEFCON and EMF.

I formed a team with [Rosia](https://rosia.me) and together we tried to to make a cool thing.

## But first; some learning

We were presented with some new hardware:

### [CYD (Cheap yellow display)](https://github.com/witnessmenow/ESP32-Cheap-Yellow-Display)

The CYD is an adorable little board with:

<img src="images/CYDFront.jpg" alt="Front of the CYD board">
<img src="images/CYDBack.jpg" alt="Back of the CYD board.">

1. ESP32 (ESP32-2432S028R if your being fussy)
2. 320 x 240 LCD Display (2.8")
3. Touch Screen (Resistive)
4. RGB LED
5. LDR.
6. a whole host of support for fun periphals (I2c, SPI, microSD, speaker)

All attendees were given one of these lovely little boards to keep courtesy of Duncan

We were then shown how to flash [micropython](https://docs.micropython.org) bundled with [lvgl](https://lvgl.io/) to the boards using [esptool](https://github.com/espressif/esptool), and let loose to experiment running example code and trying to work out how to do whatever we wanted the board to do for the rest of the day.

Myself and Rosia spent a lot of the day trying to find accurate documentation for the specific libraries we were using, which turned out to be rather frustrating due to the various different versions of the lvgl library, at the end of the day I decided to give the arduino libraries a try and found them much more friendly and immeadiately had a a good path forward for our project idea.

## Team: Beauty of baud

For our project idea we thought it would be fun to have a pair of CYD boards that would allow students to surreptitiously pass notes in class by drawing on the touch display and having their actions mirrored on the oppossing screen.

To do this we first looked at example code for drawing on the screen and detecting user input, from there we started mangaling the example code into a shape that better served us.

### Drawing on the screen

The TFT and XPT2046 libraries provide really clean methods for extracting the location on screen the user is pressing as well as for drawing new pixels on the display, so we had a stylus drawing on the screen basically at the start of the day. This section was pair proggramming

For color changing on implemented the lvgl library to have a color slider and had TFT draw a block of pixels by the slider as a color preview, this proved to be fiddly as lvgl and tft libraries defined their coordinate systems with different origins. This section I developed myself while Rosia worked on networking.

<img src="images/CYDCat.jpg" alt="A cat drawn on the CYD screen.">

### Network coms

Esp has a neat lil' protocol called esp_now. According to Duncan, this works by sending out invalid wifi discovery frames with whatever data it wants in. Because these frames dont follow the standard they should, wifi routers ignore them, but the esp listens out for them and just grabs whatever data is in them.

You can use this to grab a struct, use C magic to just treat it as an array of integers, send those integers, then another device can recieve those integers, agressively ram them into a struct and itll just kind of work because that data happened to originally have been that struct.
Receiving

Receiving was chill, you create a callback method which will be called whenever data is recieved, its given these numbers and you can do whatever you want with it. We turned the data into a struct with an x, y, and colour.
Sending

Sending is a bit harder, whilst recieving devices just listen for screams with their mac address on, sending needs to actually have the mac address. This isnt too bad though. You have an "init" method which takes a mac address, sets up a "peer" struct and writes that to memory which the esp code reads.

Then you have a "send" method which takes numbers (which are secretly our struct) and it just sends it

win ig
### The Code

Mine and Rosias project can be found on her [forgejo](https://repos.rosia.me/Bobyn/CYDhackathon) instance.

<img src="images/CYDMess.jpg" alt="A mess at the hackathon, boxes and paper.">
<img src="images/CYDRosiaSuffering.jpg" alt="Rosia suffering in a room full of people coding">

<iframe src="https://imich.bobyn.uk/s/badgeathon" title="Imich album"></iframe> 
