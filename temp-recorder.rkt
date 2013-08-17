#lang racket

(define path.direction  "/sys/class/gpio/gpio17/direction")
(define path.value      "/sys/class/gpio/gpio17/value")

(define [write-value pth val]
  (display-to-file val pth #:exists 'update))

(define [check-for-hival init] 
  (if (equal? (call-with-input-file path.value
                        (lambda [f] (read-string 1 f))) "1")
    init
    (check-for-hival (+ init 1))))

(define [main]
  ; Set the GPIO pin as an output and set it Low. This discharges any charge
  ; in the capacitor and ensures that both sides of the capacitor are 0V.
  (write-value path.direction "out")
  (write-value path.value "0")
  
  ; Set the GPIO pin as an input. This starts a flow of current through the 
  ; resistors and through the capacitor to ground. 
  ; The voltage across the capacitor starts to rise. 
  ; The time it takes is proportional to the resistance of the thermistor.
  (write-value path.direction "in")
  
  ; Monitor the GPIO pin and read its value. Increment a counter while we wait.
  ; At some point the capacitor voltage will increase enough to be considered as a
  ; High by the GPIO pin (approx 2v). 
  ; The time taken is proportional to the light level seen by the thermistor.
  (displayln (check-for-hival 0))
  (sleep 0.5)
  (main))

(main)
