package eel

class PassingRates {
    
    double quizPassing
    double classPassing

    static constraints = {
        quizPassing(min: 0.0d, max: 100.0d, blank: false)
        classPassing(min: 0.0d, max: 100.0d, blank: false)
    }
}
