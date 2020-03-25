import time
import subprocess
import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

button = 22 

GPIO.setup(button, GPIO.IN, GPIO.PUD_DOWN)

while True:
    button_state = GPIO.input(button)
    if button_state == GPIO.HIGH:
      print ("connected")
    time.sleep(0.5)


GPIO.cleanup()
