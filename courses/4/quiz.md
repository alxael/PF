# Quiz 1
1. Ce se obtine dupa instructiunea map (+1) [1,2,3,4]?
- nu se poate aplica
- [2,3,4,5]
- [4,3,2,1]
- [2,3,4]

1. [Solved] Raspusnul este [2,3,4,5] deoarece (+ 1) este functia incompleta \x -> x + 1. (1 +) este echivalent cu (+ 1)

2. Ce se obtine dupa instructiunea map (1-) [1,2,3,4]?

- nu se poate aplica
- [2,3,4,5]
- [0,1,2,3]
- [0,-1,-2,-3]

2. [Solved] Raspunsul este [0,-1,-2,-3] deoarece (1 -) corespunde functiei incomplete \x -> 1 - x. De asemenea, daca in loc de (1 -) ar fi fost (- 1) nu ar fi functionat (mai trebuie adaugate paranteze) ((-) 1).

3. Ce se obtine dupa instructiunea map toUpper "abcd"?
- nu se poate aplica
- "dcba"
- "ABCD"
- "Abcd"

3. [Solved] Se aplica functia toUpper fiecarui element al sirului de caractere, deci solutia este "ABCD".

# Quiz 2
1. Ce se obtine dupa instructiunea length . filter (== 'a') "abracadabra"?
- 5
- "brcdbr"
- instructiune invalida
- "aaaaa"

1. [Solved] Instructiunea nu este valida deoarece ii lipsesc parantezele: (length . filter (== 'a')) "abracadabra"

2. Ce se obtine dupa instructiunea length . filter (== 'a') $ "abracadabra"?
- 5
- "brcdbr"
- instructiune invalida
- "aaaaa"

2. [Solved] Raspunsul va fi 5 deoarece operator $ actioneaza ca o paranteza (ca in exemplul de mai sus).

3. Ce se intampla dupa instructiunea filter (\x -> (mod x 2) == 0) [1..10]?
- [2,4,6,8,10]
- [1,3,5,7,9]
- 5
- instructiune invalida

3. [Solved] Functia lambda din paranteze va returna True daca numarul este par, deci vor fi selectate valorile [2,4,6,8,10].