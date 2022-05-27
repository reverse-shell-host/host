$block = {
    Add-Type -AssemblyName System.Speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    
    $CatFact0 = "When cats climb a tree, they can't go back down it head first. This is because their claws are facing the same way, instead, they have to go back down backward."
    $CatFact1 = "A group of cats is called a clowder."
    $CatFact2 = "Your cat not only rubs their head against you as a sign of affection, but they are also making you as their territory. They use the scent glands they have around their face, the base of their tails, and their paws to do so."
    $CatFact3 = "Cats are actually more popular in the United States than dogs are. There are around 88 million pet cats versus 75 million pet dogs."
    $CatFact4 = "Cats cannot taste sweetness"
    $CatFact5 = "Europe introduced cats into the Americas as a form of pest control in the seventeen fifties."
    $CatFact6 = "In Holland’s embassy in Moscow, Russia, the staff noticed that the two Siamese cats kept meowing and clawing at the walls of the building. Their owners finally investigated, thinking they would find mice. Instead, they discovered microphones hidden by Russian spies. The cats heard the microphones when they turned on. Instead of alerting the Russians that they found said microphones, they simply staged conversations about delays in work orders and suddenly problems were fixed much quicker!"
    $CatFact7 = "The oldest cat video dates back to eighteen ninety four and is called. Boxing Cats"
    $CatFact8 = "It was illegal to kill cats in Ancient Egypt"
    $CatFact9 = "When cats don't cover their poop, it is seen as a sign of aggression, meaning they don't fear you."

    $CatFact = $CatFact0, $CatFact1, $CatFact2, $CatFact3, $CatFact4, $CatFact5, $CatFact6, $CatFact7, $CatFact8, $CatFact9 | Get-Random
    
    echo test
    echo $CatFact

    $SpeechSynth.Speak("did you know"+$CatFact)
}

Invoke-Command -ScriptBlock $block
