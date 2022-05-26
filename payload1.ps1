$block = {
    Add-Type -AssemblyName System.Speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $CatFact = (ConvertFrom-Json (Invoke-WebRequest -Uri 'https://the-cat-fact.herokuapp.com/api/randomfact' -UseBasicParsing)).facts
    echo $CatFact
    $SpeechSynth.Speak("did you know?"+$CatFact)
}

Invoke-Command -ScriptBlock $block
