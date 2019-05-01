%Megan Holmes
%Krasteva
%June 7th 2018
%This program allows a user to choose and customize their own car!

%Set screen up
import GUI
setscreen ("nocursor")
setscreen ("noecho")
forward proc mainMenu
forward proc userInput
forward proc instructions
forward proc display

%Variable Decleration
var mainFont : int := Font.New ("bauhaus 93:18")
var mainWindow := Window.Open ("position: 300;300, graphics: 640;400")
var instructionWindow : int := 0
var goodbyeWindow : int := 0
var errorWindow : int
var licencePlate : string
var doorNumber : string
var colorCar : int
var carMake : int
var bumperType : int
var hubCap : int
var carModel : int
var colorChange : int
var playButton := GUI.CreateButton (8, 225, 200, "Play Game", userInput)
var instructionButton := GUI.CreateButton (8, 175, 200, "Instructions", instructions)
var exitButton := GUI.CreateButton (8, 125, 200, "Exit", GUI.Quit)
var mainButton := GUI.CreateButton (210, 30, 200, "Main Menu", mainMenu)
var finishedButton := GUI.CreateButton (210, 10, 200, "Finished", display)

%Program Title
proc title
    colorback (colorChange) %Uses a variable decalred at diffrent procedures to change backround color.
    cls
    locate (1, 31)
    Font.Draw ("Custom Car Creator", maxx div 2 - 110, 370, mainFont, 92) %Title
end title

%Pause Program
proc pauseProgram
    put ""
    put "Press any key to continue..."
    loop
	exit when hasch
    end loop
end pauseProgram

process introMusic
    Music.PlayFile ("IntroMusic.mp3") %Tequila by John Coleman
end introMusic

%Error Message
proc error
    var errorWindow := Window.Open ("position: 300;300, graphics: 440;120") %Opens error window and hides main window
    colorback (89)
    Window.Hide (mainWindow)
    put "ERROR: Lisence plate must be 7 letters and/or " %Error message
    put "numbers long, with no spaces."
    put " "
    put " "
    %Color fill
    drawfillbox (0, 0, 440, 30, 89)
    pauseProgram
    Window.Show (mainWindow)     %Shows main window and closes error window
    Window.Close (errorWindow)
    userInput
end error

%Exit Message
proc goodbye
    goodbyeWindow := Window.Open ("position: 310;250, graphics: 620;400") %Opens a new window for goodbye
    Window.Close (mainWindow)     %Closes the main window
    GUI.Hide (exitButton) %Hides all unused buttons
    GUI.Hide (instructionButton)
    GUI.Hide (playButton)
    GUI.Hide (mainButton)
    colorChange := 77
    title
    locate (10, 31)
    put "Thanks for playing!" %Goodbye and credits
    locate (15, 28)
    put "Program by: Megan Holmes"
    %Right Flag
    drawfillbox (430, 300, 580, 200, 92)
    drawfillarc (467, 300, 37, 15, 180, 0, 77)
    drawfillarc (467, 200, 37, 15, 180, 0, 92)
    drawfillarc (543, 300, 37, 15, 0, 180, 92)
    drawfillarc (543, 200, 37, 15, 0, 180, 77)
    Draw.ThickLine (410, 100, 430, 300, 3, 186)
    %Left Flag
    drawfillbox (190, 300, 40, 200, 92)
    drawfillarc (153, 300, 37, 15, 180, 0, 77)
    drawfillarc (153, 200, 37, 15, 180, 0, 92)
    drawfillarc (77, 300, 37, 15, 0, 180, 92)
    drawfillarc (77, 200, 37, 15, 0, 180, 77)
    Draw.ThickLine (210, 100, 190, 300, 3, 186)
    delay (2000)
    Window.Close (goodbyeWindow)
end goodbye

body proc display
    var makeOutput, modelOutput, hubcapOutput, bumperOutput, colorOutput : string
    var licenceFont : int := Font.New ("Haettenschweiler:58")
    var porscheFont : int := Font.New ("Haettenschweiler:18")
    var jeepFont : int := Font.New ("Consolas:12")
    GUI.Hide (finishedButton)
    colorChange := 77
    title
    %Bottom Checks
    drawfillbox (0, 0, 640, 20, 23) %Black backround
    for x : 0 .. 640 by 22
	%white checks
	drawfillbox (-5 + x, 0, 5 + x, 10, white)
	drawfillbox (5 + x, 10, 15 + x, 20, white)
    end for
    %Liscence Plate
    drawfillbox (370, 250, 600, 280, 78)
    drawfillbox (370, 250, 600, 180, white)
    Font.Draw ((Str.Upper (licencePlate)), 385, 190, licenceFont, black) %Writes licence plate in all caps and large font
    GUI.Show (mainButton)
    %Car base
    drawfillbox (10, 180, 300, 110, colorCar)
    %Wheels
    drawfilloval (60, 110, 30, 30, 18)
    drawfilloval (250, 110, 30, 30, 18)
    %Hubcap Processing and Output
    if hubCap = 1 then
	hubcapOutput := "fancy"
	drawfilloval (60, 110, 20, 20, 27)     %Wheel 1
	drawfilloval (60, 110, 15, 15, 21)
	drawfillarc (60, 110, 10, 10, 45, 100, 23)
	drawfillarc (60, 110, 10, 10, 120, 170, 23)
	drawfillarc (60, 110, 10, 10, 190, 240, 23)
	drawfillarc (60, 110, 10, 10, 260, 310, 23)
	drawfillarc (60, 110, 10, 10, 330, 385, 23)
	drawfilloval (250, 110, 20, 20, 27)     %Wheel 2
	drawfilloval (250, 110, 15, 15, 21)
	drawfillarc (250, 110, 10, 10, 45, 100, 23)
	drawfillarc (250, 110, 10, 10, 120, 170, 23)
	drawfillarc (250, 110, 10, 10, 190, 240, 23)
	drawfillarc (250, 110, 10, 10, 260, 310, 23)
	drawfillarc (250, 110, 10, 10, 330, 385, 23)
    elsif hubCap = 2 then
	hubcapOutput := "regular"
	drawfilloval (60, 110, 20, 20, 27)     %Wheel 1
	drawfillarc (60, 110, 15, 15, 45, 100, 22)
	drawfillarc (60, 110, 15, 15, 120, 170, 22)
	drawfillarc (60, 110, 15, 15, 190, 240, 22)
	drawfillarc (60, 110, 15, 15, 260, 310, 22)
	drawfillarc (60, 110, 15, 15, 330, 385, 22)
	drawfilloval (250, 110, 20, 20, 27)     %Wheel 2
	drawfillarc (250, 110, 15, 15, 45, 100, 22)
	drawfillarc (250, 110, 15, 15, 120, 170, 22)
	drawfillarc (250, 110, 15, 15, 190, 240, 22)
	drawfillarc (250, 110, 15, 15, 260, 310, 22)
	drawfillarc (250, 110, 15, 15, 330, 385, 22)
    elsif hubCap = 3 then
	hubcapOutput := "simple"
	drawfilloval (60, 110, 20, 20, 21)     %Wheel 1
	drawfilloval (60, 110, 10, 10, 27)
	drawfilloval (60, 110, 5, 5, 22)
	drawfilloval (250, 110, 20, 20, 21)     %Wheel 2
	drawfilloval (250, 110, 10, 10, 27)
	drawfilloval (250, 110, 5, 5, 22)
    end if
    %Car Model Processing and Output
    if carModel = 1 then
	modelOutput := "convertable"
	drawfillarc (230, 180, 70, 10, 0, 180, colorCar)     %draw hood
	drawfillarc (300, 110, 40, 70, 5, 90, colorCar)
	drawfillarc (10, 180, 30, 10, 0, 90, colorCar)     %draw folded roof

	if doorNumber = "4" then
	    drawfillarc (120, 180, 10, 20, 0, 180, 22)     %Draw seats
	    drawfillarc (60, 180, 10, 20, 0, 180, 22)
	    drawfillbox (110, 160, 125, 165, 21)     %Draw handels
	    drawfillbox (50, 160, 65, 165, 21)
	    drawline (45, 180, 45, 140, 22)     %Draw doors
	    drawline (105, 180, 105, 110, 22)
	else
	    drawfillarc (115, 180, 10, 20, 0, 180, 22)     %Draw seat
	    drawfillbox (100, 160, 115, 165, 21)     %Draw handel
	    drawline (95, 180, 95, 110, 22)     %Draw door
	end if
    elsif carModel = 2 then
	modelOutput := "minivan"
	drawfillarc (230, 180, 70, 15, 0, 180, colorCar)     %draw hood
	drawfillbox (10, 180, 195, 230, colorCar)     %draw body
	Draw.ThickLine (195, 217, 220, 180, 27, colorCar)
	Draw.ThickLine (20, 230, 10, 115, 27, 77)
	drawline (130, 110, 130, 220, 22)     %Draw door
	if doorNumber = "4" then
	    drawfillbox (140, 180, 190, 220, 102)     %Draw windows
	    drawfillbox (120, 180, 70, 220, 102)
	    drawfillbox (140, 150, 155, 155, 21)     %Draw handel
	    drawfillbox (120, 150, 105, 155, 21)
	else
	    drawfillbox (140, 180, 190, 220, 102)     %Draw window
	    drawfillbox (140, 150, 155, 155, 21)     %Draw handel
	end if
    elsif carModel = 3 then
	modelOutput := "sports car"
	drawfillarc (230, 180, 70, 10, 0, 180, colorCar)     %draw hood
	drawfillarc (100, 180, 90, 20, 0, 180, colorCar)     %draw roof
	drawfillarc (150, 180, 90, 40, 0, 180, colorCar)
	drawfillarc (295, 147, 85, 37, 270, 90, colorCar)     %front of car
	Draw.ThickLine (60, 180, 60, 220, 10, colorCar)
	Draw.ThickLine (50, 215, 70, 225, 10, colorCar)
	if doorNumber = "4" then
	    drawfillarc (150, 180, 80, 30, 0, 180, 102)     %Draw windows
	    drawfillbox (155, 150, 170, 155, 21)     %Draw handel
	    drawfillbox (145, 150, 130, 155, 21)
	    drawline (150, 110, 150, 210, 22)         %Draw door
	else
	    drawfillarc (130, 180, 100, 30, 0, 90, 102)     %Draw window
	    drawfillbox (135, 150, 150, 155, 21)     %Draw handel
	    drawline (130, 110, 130, 210, 22)                 %Draw door
	end if
    elsif carModel = 4 then
	modelOutput := "midsize car"
	drawfillarc (230, 180, 70, 10, 0, 180, colorCar)     %draw hood
	drawfillarc (110, 180, 100, 50, 0, 180, colorCar)     %draw hood
	drawfillarc (300, 110, 30, 70, 0, 90, colorCar)
	if doorNumber = "4" then
	    drawfillarc (110, 180, 90, 40, 0, 180, 102)     %Draw windows
	    drawfillbox (115, 150, 140, 155, 21)      %Draw handels
	    drawfillbox (105, 150, 80, 155, 21)
	    drawline (110, 110, 110, 220, 22)         %Draw door
	else
	    drawfillarc (95, 180, 105, 40, 0, 90, 102)     %Draw window
	    drawfillbox (100, 150, 115, 155, 21)     %Draw handel
	    drawline (95, 110, 95, 220, 22)                 %Draw door
	end if
    elsif carModel = 5 then
	modelOutput := "truck"
	drawfillbox (130, 180, 210, 230, colorCar)     %Body
	drawfillarc (210, 180, 40, 50, 0, 90, colorCar)
	drawfillarc (210, 180, 30, 40, 0, 90, 102)     % Front Window
	if doorNumber = "2" then
	    drawfillbox (140, 180, 200, 220, 102)     %Draw window
	    drawfillbox (140, 150, 155, 155, 21)     %Draw handel
	    drawline (130, 180, 130, 110, 27)     %Draw door
	else
	    drawfillbox (100, 180, 210, 230, colorCar)     %Body
	    drawfillbox (105, 180, 150, 220, 102)     %Draw window
	    drawfillbox (160, 180, 210, 220, 102)     %Draw window
	    drawfillbox (175, 150, 160, 155, 21)     %Draw handel
	    drawfillbox (145, 150, 130, 155, 21)     %Draw handel
	    drawline (155, 180, 155, 110, 27)     %Draw door
	end if
    end if
    %Car Make Processing and Output
    if carMake = 1 then
	makeOutput := "Jeep"
	Font.Draw ("Jeep", 185, 120, jeepFont, 24)     %Make on car
	Font.Draw ("Jeep", 460, 260, mainFont, 24)     %Make on licence plate
    elsif carMake = 2 then
	makeOutput := "Audi"
	drawoval (190, 125, 5, 5, 24)     %Make on car
	drawoval (197, 125, 5, 5, 24)
	drawoval (205, 125, 5, 5, 24)
	drawoval (212, 125, 5, 5, 24)
	drawoval (460, 266, 10, 10, 24)     %Make on licence plate
	drawoval (475, 266, 10, 10, 24)
	drawoval (490, 266, 10, 10, 24)
	drawoval (505, 266, 10, 10, 24)
    elsif carMake = 3 then
	makeOutput := "Subaru"
	drawfilloval (482, 266, 20, 10, blue)     %Make on licence plate
	drawoval (482, 266, 20, 10, 24)
	drawoval (482, 266, 19, 9, 24)
	for i : 1 .. 5
	    drawoval (477, 269, i, 5 - i, grey)     %Little stars
	end for
	for i : 1 .. 3
	    drawoval (487, 269, i, 3 - i, grey)
	    drawoval (484, 263, i, 3 - i, grey)
	end for
	drawfilloval (200, 125, 17, 7, blue)     %Make on car plate
	drawoval (200, 125, 17, 7, 24)
	drawoval (200, 125, 16, 6, 24)
	for i : 1 .. 5
	    drawoval (195, 127, i, 5 - i, grey)     %Little stars
	end for
	for i : 1 .. 3
	    drawoval (205, 127, i, 3 - i, grey)
	    drawoval (201, 122, i, 3 - i, grey)
	end for
    elsif carMake = 4 then
	makeOutput := "Porsche"
	Font.Draw ("PORSCHE", 460, 258, porscheFont, 24)     %Make on licence plate
	drawfillbox (210, 125, 205, 130, red) %Coat of arms on car
	drawfillbox (210, 128, 205, 130, 20)
	drawfillbox (205, 125, 200, 130, 67)
	drawfillbox (210, 125, 205, 120, 67)
	drawfillbox (205, 125, 200, 120, red)
	drawfillbox (205, 125, 200, 122, 20)
	drawfillbox (205, 125, 200, 130, 67)
    elsif carMake = 5 then
	makeOutput := "Toyota"
	drawoval (482, 266, 25, 15, 24)  %Make on licence plate
	drawoval (482, 266, 24, 14, 24)
	drawoval (482, 266, 5, 15, 24) %Middle of T
	drawoval (482, 266, 4, 14, 24)
	drawoval (482, 276, 15, 5, 24) %Top of T
	drawoval (482, 276, 14, 4, 24)
	drawoval (200, 125, 15, 8, 24) %Make on car
	drawoval (200, 125, 14, 7, 24)
	drawoval (200, 125, 3, 8, 24) %Middle of T
	drawoval (200, 125, 2, 7, 24)
	drawoval (200, 129, 10, 3, 24) %Top of T
	drawoval (200, 129, 9, 2, 24)
    end if
    %Car Color Processing and Output
    if colorCar = 12 then
	colorOutput := "red"
    elsif colorCar = 29 then
	colorOutput := "grey"
    elsif colorCar = 78 then
	colorOutput := "blue"
    elsif colorCar = 44 then
	colorOutput := "yellow"
    elsif colorCar = 7 then
	colorOutput := "black"
    elsif colorCar = 31 then
	colorOutput := "white"
    end if
    %Car Bumper Processing and Output
    if bumperType = 1 then
	bumperOutput := "tube"
	if carModel = 1 then
	    drawfillbox (340, 135, 335, 115, 19) %Bumper
	    drawfillbox (340, 145, 335, 130, 21)
	elsif carModel = 2 then
	    drawfillbox (290, 125, 305, 140, 19) %Bumper
	    drawfillbox (290, 125, 305, 110, 21)
	elsif carModel = 3 then
	    Draw.ThickLine (380, 118, 340, 118, 8, 19) %Bumper
	    Draw.ThickLine (380, 125, 340, 125, 8, 21)
	elsif carModel = 4 then
	    drawfillbox (315, 125, 330, 110, 19) %Bumper
	    drawfillbox (315, 140, 330, 125, 21)
	elsif carModel = 5 then
	    drawfillbox (290, 125, 305, 110, 19) %Bumper
	    drawfillbox (290, 140, 305, 125, 21)
	end if
    elsif bumperType = 2 then
	bumperOutput := "step"
	if carModel = 1 then
	    drawfillbox (340, 135, 335, 115, 27) %Bumper
	    drawfillbox (340, 140, 335, 135, 21)
	elsif carModel = 2 then
	    drawfillbox (293, 135, 305, 110, 27) %Bumper
	    drawfillbox (293, 140, 305, 135, 21)
	elsif carModel = 3 then
	    Draw.ThickLine (375, 118, 340, 118, 10, 21) %Bumper
	    Draw.ThickLine (375, 125, 340, 125, 4, 27)
	elsif carModel = 4 then
	    drawfillbox (315, 135, 330, 140, 27) %Bumper
	    drawfillbox (315, 135, 330, 110, 21)
	elsif carModel = 5 then
	    drawfillbox (290, 135, 305, 140, 27) %Bumper
	    drawfillbox (290, 135, 305, 110, 21)
	end if
    elsif bumperType = 3 then
	bumperOutput := "standard"
	if carModel = 1 then
	    drawfillbox (340, 140, 335, 115, 15) %Bumper
	elsif carModel = 2 then
	    drawfillbox (293, 140, 305, 110, 15) %Bumper
	elsif carModel = 3 then
	    Draw.ThickLine (375, 118, 340, 118, 12, 15) %Bumper
	elsif carModel = 4 then
	    drawfillbox (315, 140, 330, 110, 15) %Bumper
	elsif carModel = 5 then
	    drawfillbox (290, 140, 305, 110, 15) %Bumper
	end if
    elsif bumperType = 4 then
	bumperOutput := "Roll-Pan"
	if carModel = 1 then
	    drawfillarc (335, 126, 10, 10, 270, 90, 24) %Bumper
	elsif carModel = 2 then
	    drawfillarc (300, 120, 10, 10, 270, 90, 24) %Bumper
	elsif carModel = 3 then
	    drawfillarc (350, 120, 25, 10, 225, 90, 24) %Bumper
	elsif carModel = 4 then
	    drawfillarc (330, 120, 10, 10, 270, 90, 24) %Bumper
	elsif carModel = 5 then
	    drawfillarc (300, 120, 10, 10, 270, 90, 24) %Bumper
	end if
    elsif bumperType = 5 then
	bumperOutput := "deep-drop"
	if carModel = 1 then
	    drawfillbox (340, 135, 345, 120, 24) %Bumper
	    drawfillbox (340, 145, 335, 130, 27)
	elsif carModel = 2 then
	    drawfillbox (290, 130, 307, 110, 24) %Bumper
	    drawfillbox (290, 140, 305, 120, 27)
	elsif carModel = 3 then
	    Draw.ThickLine (380, 118, 340, 118, 9, 24) %Bumper
	    Draw.ThickLine (375, 125, 340, 125, 9, 27)
	elsif carModel = 4 then
	    drawfillbox (315, 130, 332, 110, 24) %Bumper
	    drawfillbox (315, 140, 330, 120, 27)
	elsif carModel = 5 then
	    drawfillbox (290, 130, 307, 110, 24) %Bumper
	    drawfillbox (290, 140, 305, 120, 27)
	end if
    end if
    locate (5, 7)
    %Displays user Input
    put "Your Car is a ", colorOutput, " ", makeOutput, " ", modelOutput, " with ", doorNumber, " doors, ", hubcapOutput, " hubcaps,"
    locate (6, 20)
    put "  and a ", bumperOutput, " bumper type."
end display

%User Input
body proc userInput
    var x, y, button, circle1, circle2, circle3 : int
    var optionsFont : int := Font.New ("Haettenschweiler:18")
    var buttonFont : int := Font.New ("Cambria:12")
    GUI.Hide (exitButton) %Hides all unused buttons
    GUI.Hide (instructionButton)
    GUI.Hide (playButton)
    GUI.Hide (mainButton)
    colorChange := 102 %Backround Color
    doorNumber := "0"
    colorCar := 0
    carMake := 0
    bumperType := 0
    hubCap := 0
    carModel := 0
    title
    locate (6, 14)
    put "Enter your custom licence plate (7 letters or numbers):" %Asks for custom licence plate)
    locate (7, 37)
    get licencePlate : *
    if length (licencePlate) not= 7 or index (licencePlate, " ") not= 0 then %error trap for licence plate
	error
    end if
    locate (9, 18)
    put "Click a custom option for each part bellow." %Displays options
    Font.Draw ("    Hubcap    I      Bumper     I      Color     I       Make       I      Model     I      Number of Doors    ", 0, 200, optionsFont, black)
    %Hub Cap 1
    drawfilloval (40, 160, 30, 30, 27)
    drawfilloval (40, 160, 20, 20, 21)
    drawfillarc (40, 160, 15, 15, 45, 100, 23)
    drawfillarc (40, 160, 15, 15, 120, 170, 23)
    drawfillarc (40, 160, 15, 15, 190, 240, 23)
    drawfillarc (40, 160, 15, 15, 260, 310, 23)
    drawfillarc (40, 160, 15, 15, 330, 385, 23)
    %Hub Cap 2
    drawfilloval (40, 100, 30, 30, 27)
    drawfillarc (40, 100, 20, 20, 45, 100, 22)
    drawfillarc (40, 100, 20, 20, 120, 170, 22)
    drawfillarc (40, 100, 20, 20, 190, 240, 22)
    drawfillarc (40, 100, 20, 20, 260, 310, 22)
    drawfillarc (40, 100, 20, 20, 330, 385, 22)
    %Hub Cap 3
    drawfilloval (40, 40, 30, 30, 21)
    drawfilloval (40, 40, 20, 20, 27)
    drawfilloval (40, 40, 5, 5, 22)
    %Bumper option boxes
    drawfillbox (180, 160, 100, 180, 22)
    drawfillbox (180, 130, 100, 150, 22)
    drawfillbox (180, 100, 100, 120, 22)
    drawfillbox (180, 70, 100, 90, 22)
    drawfillbox (180, 60, 100, 40, 22)
    Font.Draw ("Tube", 125, 165, buttonFont, 29) %Button words
    Font.Draw ("Step", 125, 135, buttonFont, 29)
    Font.Draw ("Standard", 110, 105, buttonFont, 29)
    Font.Draw ("Roll-Pan", 112, 75, buttonFont, 29)
    Font.Draw ("Deep-Drop", 102, 45, buttonFont, 29)
    %Draw color buttons
    drawfillbox (210, 180, 230, 140, 12) %red box
    drawbox (210, 180, 230, 140, black) %outline
    drawfillbox (240, 180, 260, 140, 29) %grey box
    drawbox (240, 180, 260, 140, black) %outline
    drawfillbox (210, 130, 230, 90, 78) %blue box
    drawbox (210, 130, 230, 90, black) %outline
    drawfillbox (240, 130, 260, 90, 44) %yellow box
    drawbox (240, 130, 260, 90, black) %outline
    drawfillbox (210, 80, 230, 40, black) %black box
    drawbox (210, 80, 230, 40, black) %outline
    drawfillbox (240, 80, 260, 40, 0) %white box
    drawbox (240, 80, 260, 40, black) %outline
    %Draw Number Circles
    drawfilloval (560, 150, 40, 40, 89)
    drawfilloval (560, 60, 40, 40, 89)
    %Draw Numbers
    Font.Draw ("2", 555, 145, mainFont, 92)
    Font.Draw ("4", 555, 55, mainFont, 92)
    %Make Boxes
    drawfillbox (370, 160, 290, 180, 22)
    drawfillbox (370, 130, 290, 150, 22)
    drawfillbox (370, 100, 290, 120, 22)
    drawfillbox (370, 70, 290, 90, 22)
    drawfillbox (370, 60, 290, 40, 22)
    Font.Draw ("Jeep", 315, 165, buttonFont, 29)
    Font.Draw ("Audi", 315, 135, buttonFont, 29)
    Font.Draw ("Subaru", 305, 105, buttonFont, 29)
    Font.Draw ("Porsche", 305, 75, buttonFont, 29)
    Font.Draw ("Toyota", 307, 45, buttonFont, 29)
    %Model Boxes
    drawfillbox (470, 160, 390, 180, 22)
    drawfillbox (470, 130, 390, 150, 22)
    drawfillbox (470, 100, 390, 120, 22)
    drawfillbox (470, 70, 390, 90, 22)
    drawfillbox (470, 60, 390, 40, 22)
    Font.Draw ("Convertable", 389, 165, buttonFont, 29)
    Font.Draw ("Mini-Van", 400, 135, buttonFont, 29)
    Font.Draw ("Sports Car", 395, 105, buttonFont, 29)
    Font.Draw ("Mid Size", 400, 75, buttonFont, 29)
    Font.Draw ("Truck", 407, 45, buttonFont, 29)
    %MainMenu option
    drawfillbox (540, 390, 630, 370, 27) %Button
    Font.Draw ("Main Menu", 545, 372, optionsFont, 22) %Words
    loop
	mousewhere (x, y, button)
	if button = 1 then
	    %Hubcap Options
	    if (x > 10 and x < 70) and (y > 130 and y < 190) and whatdotcolour (x, y) not= 102 then
		hubCap := 1
		drawoval (40, 160, 30, 30, yellow) %Highlight choosen options
		drawoval (40, 100, 30, 30, 27) %Cover other options
		drawoval (40, 40, 30, 30, 21)
		play (">>2c<<") %play sound
	    elsif (x > 10 and x < 70) and (y > 90 and y < 130) and whatdotcolour (x, y) not= 102 then
		hubCap := 2
		drawoval (40, 100, 30, 30, yellow) %Highlight choosen options
		drawoval (40, 160, 30, 30, 27) %Cover other options
		drawoval (40, 40, 30, 30, 21)
		play (">>2d<<") %play sound
	    elsif (x > 10 and x < 70) and (y > 30 and y < 90) and whatdotcolour (x, y) not= 102 then
		hubCap := 3
		drawoval (40, 40, 30, 30, yellow) %Highlight choosen options
		drawoval (40, 160, 30, 30, 27) %Cover other options
		drawoval (40, 100, 30, 30, 27)
		play (">>2e<<") %play sound
	    end if
	    %Bumper Options
	    if (x > 100 and x < 180) and (y < 180 and y > 160) then
		bumperType := 1
		drawbox (180, 160, 100, 180, yellow) %Highlight choosen options
		drawbox (180, 130, 100, 150, 22) %Cover other options
		drawbox (180, 100, 100, 120, 22)
		drawbox (180, 70, 100, 90, 22)
		drawbox (180, 40, 100, 60, 22)
		play (">>2c<<") %play sound
	    elsif (x > 100 and x < 180) and (y < 150 and y > 130) then
		bumperType := 2
		drawbox (180, 130, 100, 150, yellow) %Highlight choosen option
		drawbox (180, 160, 100, 180, 22) %Cover other highlights
		drawbox (180, 100, 100, 120, 22)
		drawbox (180, 70, 100, 90, 22)
		drawbox (180, 40, 100, 60, 22)
		play (">>2d<<") %play sound
	    elsif (x > 100 and x < 180) and (y < 120 and y > 100) then
		bumperType := 3
		drawbox (180, 100, 100, 120, yellow) %Highlight choosen option
		drawbox (180, 160, 100, 180, 22) %Cover other highlights
		drawbox (180, 130, 100, 150, 22)
		drawbox (180, 70, 100, 90, 22)
		drawbox (180, 40, 100, 60, 22)
		play (">>2e<<") %play sound
	    elsif (x > 100 and x < 180) and (y < 90 and y > 70) then
		bumperType := 4
		drawbox (180, 70, 100, 90, yellow) %Highlight choosen option
		drawbox (180, 160, 100, 180, 22) %Cover other highlights
		drawbox (180, 130, 100, 150, 22)
		drawbox (180, 100, 100, 120, 22)
		drawbox (180, 40, 100, 60, 22)
		play (">>2f<<") %play sound
	    elsif (x > 100 and x < 180) and (y < 60 and y > 40) then
		bumperType := 5
		drawbox (180, 40, 100, 60, yellow) %Highlight choosen option
		drawbox (180, 160, 100, 180, 22) %Cover other highlights
		drawbox (180, 130, 100, 150, 22)
		drawbox (180, 100, 100, 120, 22)
		drawbox (180, 70, 100, 90, 22)
		play (">>2g<<") %play sound
	    end if
	    %Color Options
	    if (x > 210 and x < 230) and (y < 180 and y > 140) then
		colorCar := 12
		drawbox (210, 180, 230, 140, yellow) %Highlights choosen option
		drawbox (240, 180, 260, 140, black) %Cover other options
		drawbox (210, 130, 230, 90, black)
		drawbox (240, 130, 260, 90, black)
		drawbox (210, 80, 230, 40, black)
		drawbox (240, 80, 260, 40, black)
		play (">>2c<<") %play sound
	    elsif (x > 240 and x < 260) and (y > 140 and y < 180) then
		colorCar := 29
		drawbox (240, 180, 260, 140, yellow) %Highlights choosen option
		drawbox (210, 180, 230, 140, black) %Cover other options
		drawbox (210, 130, 230, 90, black)
		drawbox (240, 130, 260, 90, black)
		drawbox (210, 80, 230, 40, black)
		drawbox (240, 80, 260, 40, black)
		play (">>2c<<") %play sound
	    elsif (x > 210 and x < 230) and (y < 130 and y > 90) then
		colorCar := 78
		drawbox (210, 130, 230, 90, yellow) %Highlights choosen option
		drawbox (210, 180, 230, 140, black) %Cover other options
		drawbox (240, 180, 260, 140, black)
		drawbox (240, 130, 260, 90, black)
		drawbox (210, 80, 230, 40, black)
		drawbox (240, 80, 260, 40, black)
		play (">>2d<<") %play sound
	    elsif (x > 240 and x < 260) and (y > 90 and y < 130) then
		colorCar := 44
		drawbox (240, 130, 260, 90, yellow) %Highlights choosen option
		drawbox (210, 180, 230, 140, black) %Cover other options
		drawbox (240, 180, 260, 140, black)
		drawbox (210, 130, 230, 90, black)
		drawbox (210, 80, 230, 40, black)
		drawbox (240, 80, 260, 40, black)
		play (">>2d<<") %play sound
	    elsif (x > 210 and x < 230) and (y < 80 and y > 40) then
		colorCar := 7
		drawbox (210, 80, 230, 40, yellow) %Highlights choosen option
		drawbox (210, 180, 230, 140, black) %Cover other options
		drawbox (240, 180, 260, 140, black)
		drawbox (210, 130, 230, 90, black)
		drawbox (240, 130, 260, 90, black)
		drawbox (240, 80, 260, 40, black)
		play (">>2e<<") %play sound
	    elsif (x > 240 and x < 260) and (y > 40 and y < 80) then
		colorCar := 31
		drawbox (240, 80, 260, 40, yellow) %Highlights choosen option
		drawbox (210, 180, 230, 140, black) %Cover other options
		drawbox (240, 180, 260, 140, black)
		drawbox (210, 130, 230, 90, black)
		drawbox (240, 130, 260, 90, black)
		drawbox (210, 80, 230, 40, black)
		play (">>2e<<") %play sound
	    end if
	    %Model Options
	    if (x > 390 and x < 470) and (y < 180 and y > 160) then
		carModel := 1
		drawbox (470, 160, 390, 180, yellow) %Highlight choosen options
		drawbox (470, 130, 390, 150, 22) %Cover other options
		drawbox (470, 100, 390, 120, 22)
		drawbox (470, 70, 390, 90, 22)
		drawbox (470, 40, 390, 60, 22)
		play (">>2c<<") %play sound
	    elsif (x > 390 and x < 470) and (y < 150 and y > 130) then
		carModel := 2
		drawbox (470, 130, 390, 150, yellow) %Highlight choosen option
		drawbox (470, 160, 390, 180, 22) %Cover other highlights
		drawbox (470, 100, 390, 120, 22)
		drawbox (470, 70, 390, 90, 22)
		drawbox (470, 40, 390, 60, 22)
		play (">>2d<<") %play sound
	    elsif (x > 390 and x < 470) and (y < 120 and y > 100) then
		carModel := 3
		drawbox (470, 100, 390, 120, yellow) %Highlight choosen option
		drawbox (470, 160, 390, 180, 22) %Cover other highlights
		drawbox (470, 130, 390, 150, 22)
		drawbox (470, 70, 390, 90, 22)
		drawbox (470, 40, 390, 60, 22)
		play (">>2e<<") %play sound
	    elsif (x > 390 and x < 470) and (y < 90 and y > 70) then
		carModel := 4
		drawbox (470, 70, 390, 90, yellow) %Highlight choosen option
		drawbox (470, 160, 390, 180, 22) %Cover other highlights
		drawbox (470, 130, 390, 150, 22)
		drawbox (470, 100, 390, 120, 22)
		drawbox (470, 40, 390, 60, 22)
		play (">>2f<<") %play sound
	    elsif (x > 390 and x < 470) and (y < 60 and y > 40) then
		carModel := 5
		drawbox (470, 40, 390, 60, yellow) %Highlight choosen option
		drawbox (470, 160, 390, 180, 22) %Cover other highlights
		drawbox (470, 130, 390, 150, 22)
		drawbox (470, 100, 390, 120, 22)
		drawbox (470, 70, 390, 90, 22)
		play (">>2g<<") %play sound
	    end if
	    %Make Options
	    if (x > 290 and x < 370) and (y < 180 and y > 160) then
		carMake := 1
		drawbox (370, 160, 290, 180, yellow) %Highlight choosen options
		drawbox (370, 130, 290, 150, 22) %Cover other options
		drawbox (370, 100, 290, 120, 22)
		drawbox (370, 70, 290, 90, 22)
		drawbox (370, 40, 290, 60, 22)
		play (">>2c<<") %play sound
	    elsif (x > 290 and x < 370) and (y < 150 and y > 130) then
		carMake := 2
		drawbox (370, 130, 290, 150, yellow) %Highlight choosen option
		drawbox (370, 160, 290, 180, 22) %Cover other highlights
		drawbox (370, 100, 290, 120, 22)
		drawbox (370, 70, 290, 90, 22)
		drawbox (370, 40, 290, 60, 22)
		play (">>2d<<") %play sound
	    elsif (x > 290 and x < 370) and (y < 120 and y > 100) then
		carMake := 3
		drawbox (370, 100, 290, 120, yellow) %Highlight choosen option
		drawbox (370, 160, 290, 180, 22) %Cover other highlights
		drawbox (370, 130, 290, 150, 22)
		drawbox (370, 70, 290, 90, 22)
		drawbox (370, 40, 290, 60, 22)
		play (">>2e<<") %play sound
	    elsif (x > 290 and x < 370) and (y < 90 and y > 70) then
		carMake := 4
		drawbox (370, 70, 290, 90, yellow) %Highlight choosen option
		drawbox (370, 160, 290, 180, 22) %Cover other highlights
		drawbox (370, 130, 290, 150, 22)
		drawbox (370, 100, 290, 120, 22)
		drawbox (370, 40, 290, 60, 22)
		play (">>2f<<") %play sound
	    elsif (x > 290 and x < 370) and (y < 60 and y > 40) then
		carMake := 5
		drawbox (370, 40, 290, 60, yellow) %Highlight choosen option
		drawbox (370, 160, 290, 180, 22) %Cover other highlights
		drawbox (370, 130, 290, 150, 22)
		drawbox (370, 100, 290, 120, 22)
		drawbox (370, 70, 290, 90, 22)
		play (">>2g<<") %play sound
	    end if
	    %Car Door Number Options
	    if (x > 520 and x < 600) and (y > 110 and y < 190) then
		doorNumber := "2"
		drawoval (560, 150, 40, 40, yellow) %Highlight choosen option
		drawoval (560, 60, 40, 40, 89) %Cover other highlights
		play (">>2c<<") %play sound
	    elsif (x > 520 and x < 600) and (y > 20 and y < 100) then
		doorNumber := "4"
		drawoval (560, 60, 40, 40, yellow) %Highlight choosen option
		drawoval (560, 150, 40, 40, 89) %Cover other highlights
		play (">>2d<<") %play sound
	    end if
	end if
	exit when doorNumber not= "0" and hubCap not= 0 and carMake not= 0 and carModel not= 0 and colorCar not= 0 and bumperType not= 0 or button = 1 and (x > 540 and x < 630) and (y > 370 and y <
	    390)
    end loop
    %Finished when all options have been choosen
    %Main Menu Button
    GUI.Show (finishedButton)
    if (x > 540 and x < 630) and (y > 370 and y < 390) then
	GUI.Hide (finishedButton)
	mainMenu
    end if
end userInput

%Main Menu
body proc mainMenu
    Window.Show (mainWindow)
    Window.Hide (instructionWindow)
    GUI.Hide (mainButton)
    colorChange := 89
    title
    GUI.Show (playButton)
    GUI.Show (instructionButton)
    GUI.Show (exitButton)
    locate (8, 2)
    put "Choose an option bellow:"
    %Flag
    drawfillbox (450, 300, 600, 200, 92)
    drawfillarc (487, 300, 37, 15, 180, 0, 89)
    drawfillarc (487, 200, 37, 15, 180, 0, 92)
    drawfillarc (563, 300, 37, 15, 0, 180, 92)
    drawfillarc (563, 200, 37, 15, 0, 180, 89)
    Draw.ThickLine (400, 100, 450, 300, 4, 186)
    %Wheel
    drawfilloval (360, 250, 50, 50, 25)
    drawfilloval (360, 250, 30, 30, 29)
    drawfillarc (360, 250, 20, 20, 45, 100, 27)
    drawfillarc (360, 250, 20, 20, 120, 170, 27)
    drawfillarc (360, 250, 20, 20, 190, 240, 27)
    drawfillarc (360, 250, 20, 20, 260, 310, 27)
    drawfillarc (360, 250, 20, 20, 330, 385, 27)
    %Bottom Checks
    drawfillbox (0, 0, 640, 40, 23) %Black backround
    for x : 0 .. 640 by 22
	%white checks
	drawfillbox (-5 + x, 0, 5 + x, 10, white)
	drawfillbox (-5 + x, 20, 5 + x, 30, white)
	drawfillbox (6 + x, 10, 15 + x, 20, white)
	drawfillbox (6 + x, 30, 15 + x, 40, white)
    end for
end mainMenu

%Instructions
body proc instructions
    Window.Hide (mainWindow)
    instructionWindow := Window.Open ("position: 100;300, graphics: 440;400")
    GUI.Hide (exitButton)
    GUI.Hide (instructionButton)
    GUI.Hide (playButton)
    colorChange := 102
    title
    locate (7, 22)
    put "INSTRUCTIONS"
    locate (9, 4)
    put "1. To play, press the 'Play Game' button in the"
    locate (10, 24)
    put "main menu."
    locate (12, 4)
    put "2. Customize your car by clicking on different  "
    locate (13, 12)
    put "options or entering your requests."
    locate (15, 4)
    put "3. Press finished when you are done to see your"
    locate (16, 26)
    put "car!"
    put " "
    %Bottom Checks
    drawfillbox (0, 70, 640, 130, 23) %Black backround
    for x : 0 .. 640 by 22
	%white checks
	drawfillbox (-5 + x, 80, 5 + x, 90, white)
	drawfillbox (-5 + x, 100, 5 + x, 110, white)
	drawfillbox (-5 + x, 120, 5 + x, 130, white)
	drawfillbox (5 + x, 70, 15 + x, 80, white)
	drawfillbox (5 + x, 90, 15 + x, 100, white)
	drawfillbox (5 + x, 110, 15 + x, 120, white)
    end for
    %Top Checks
    drawfillbox (0, 320, 640, 350, 23) %Black backround
    for x : 0 .. 640 by 22
	%white checks
	drawfillbox (-5 + x, 320, 5 + x, 330, white)
	drawfillbox (-5 + x, 340, 5 + x, 350, white)
	drawfillbox (5 + x, 330, 15 + x, 340, white)
    end for
    var mainButton := GUI.CreateButton (110, 30, 200, "Main Menu", mainMenu) %Back to main menu
end instructions

%Introduction
proc intro
    GUI.Hide (exitButton) %Hides all unused button0
    GUI.Hide (instructionButton)
    GUI.Hide (playButton)
    GUI.Hide (finishedButton)
    colorChange := 89
    title
    fork introMusic
    locate (10, 26)
    put "Welcome to Custom Car Creator" %introduction
    locate (11, 24)
    put "where you can customize your own"
    locate (12, 38)
    put "car!"
    locate (14, 35)
    put "Loading..."
    for x : 0 .. 700
	drawfilloval (-1 + x, 70, 50, 50, 89)
	drawfilloval (0 + x, 70, 50, 50, 22)
	drawfilloval (0 + x, 70, 30, 30, 27)
	drawfillarc (0 + x, 70, 20, 20, 45 - x, 100 - x, 22)
	drawfillarc (0 + x, 70, 20, 20, 120 - x, 170 - x, 22)
	drawfillarc (0 + x, 70, 20, 20, 190 - x, 240 - x, 22)
	drawfillarc (0 + x, 70, 20, 20, 260 - x, 310 - x, 22)
	drawfillarc (0 + x, 70, 20, 20, 330 - x, 385 - x, 22)
	delay (8)
    end for
    locate (14, 35)
    put ""   %Cover "Loading..."
    drawfillbox (0, 80, 640, 170, 23) %Black backround
    for x : 0 .. 640 by 22
	%white checks
	drawfillbox (-5 + x, 90, 5 + x, 100, white)
	drawfillbox (-5 + x, 110, 5 + x, 120, white)
	drawfillbox (-5 + x, 130, 5 + x, 140, white)
	drawfillbox (-5 + x, 150, 5 + x, 160, white)
	drawfillbox (5 + x, 90, 15 + x, 80, white)
	drawfillbox (5 + x, 110, 15 + x, 100, white)
	drawfillbox (5 + x, 130, 15 + x, 120, white)
	drawfillbox (5 + x, 150, 15 + x, 140, white)
	drawfillbox (5 + x, 170, 15 + x, 160, white)
    end for
    GUI.Show (mainButton)
end intro

%Main Program
intro
loop
    exit when GUI.ProcessEvent
end loop
goodbye
