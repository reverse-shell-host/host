$block {
    Add-Type -AssemblyName System.Speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynth.Speak("startup initiated")
}
Invoke-Command -ScriptBlock $block

if ((Get-Random -Maximum 10000) -lt 1875) {
    Add-Type -AssemblyName System.Speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $CatFact = "When cats climb a tree, they can't go back down it head first. This is because their claws are facing the same way, instead, they have to go back down backward", "A group of cats is called a clowder", "Your cat not only rubs their head against you as a sign of affection, but they are also making you as their territory. They use the scent glands they have around their face, the base of their tails, and their paws to do so", "Cats are actually more popular in the United States than dogs are. There are around eighty eight million pet cats versus seventy five million pet dogs", "Cats cannot taste sweetness", "Europe introduced cats into the Americas as a form of pest control in the seventeen fifties", "In Holland’s embassy in Moscow, Russia, the staff noticed that the two Siamese cats kept meowing and clawing at the walls of the building. Their owners finally investigated, thinking they would find mice. Instead, they discovered microphones hidden by Russian spies!", "The oldest cat video dates back to eighteen ninety four and is called. Boxing Cats", "It was illegal to kill cats in Ancient Egypt", "When cats don't cover their poop, it is seen as a sign of aggression, meaning they don't fear you", "Cat's, as well as other animals' noses,  have their own unique print, much like a humans fingerprint", "Cats use their whiskers to determine if they can fit through a small space. The bigger the cat, the longer the whiskers will likely be", "In just 10 years one female cat could produce around 49,000 kittens", "A train station in Southeastern Japan is presided over by an adorable stationmaster. a 6-year-old calico cat named Nitama", "Approximately 200 feral cats roam the grounds of Disneyland, where they help control the amusement park’s rodent population", "There are four hundred and seventy three taste buds on the tongue of a cat", "Cats have 3 eyelids" | Get-Random
    $SpeechSynth.Speak("did you know"+$CatFact)
}
