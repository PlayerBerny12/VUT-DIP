# Notes
- ohodnocení metody (pořebný výkon, přesnost, ...)
    - testovací data (šum, ...)
    - čas inicializace metody -> uchovávat v quazi stavu nebo loadovat při kařdém requestu       
- poloautomatický/plně automatický framework pro testování metod
    - vložení datasetu a otestování všech metod nad tímto datasetem

- Obdobné tooly
    - https://scanner.deepware.ai/developer/

- poznámka pod čarou
    - state of the art
    - connected papers - graf navazujících prací

## Rozvoj
- 2.1 - popsat že lidé u videí mají sklony než říci že si nejsou jistí, odpovědět i když je to pro ně coin flip

## Metacentrum
- pro složité výpočty (učení apod.)
- školní účet (free)
- https://metavo.metacentrum.cz
- https://wiki.metacentrum.cz/w/index.php?title=Main_Page&setlang=en

## Tooly pro generování datasetů
- YourTTS, MozilaTTS, FragmentVC, StarGANv2
https://docs.google.com/spreadsheets/d/1cl0hMsWt4WBCka5ta2Ilqfjk8Z2_RoD_XxRKsXluMLc/edit#gid=0

## Datasety
- https://bil.eecs.yorku.ca/datasets/
- ASVSpoof challenge

## Literatura/materiály
- https://www.fit.vut.cz/study/thesis/23761/.cs
- https://link.springer.com/content/pdf/10.1007%2F978-3-030-87664-7.pdf
- https://resources.sei.cmu.edu/library/asset-view.cfm?assetid=886533

# Metody
- rozchození (řeč - fixní délky - 2s, obraz - případný scaling, oříznutí)
- https://github.com/topics/deepfake-detection

Video:
- https://github.com/selimsef/dfdc_deepfake_challenge
- https://github.com/dessa-oss/DeepFake-Detection
- https://github.com/bbvanexttechnologies/fakeVideoForensics
Audio:
- https://github.com/MarkHershey/AudioDeepFakeDetection
- https://github.com/piotrkawa/specrnet

# Architektura framework
1. Předdefinovaný request processing a pro každý požadavek spinnovat nové konteinery
2. Processinig queue, která uschovává příchozí requesty a spouští je na určitém množství request processingů (horizontální škálování)

## Main
- HTTP API
- entry point
    - příjmutí požadavku
    - zajištění dat
    - zařazení do fronty
- sběr výsledků
    - agregace výsledků
    - zaslání výsledků zpět uživateli

## Request processing    
- zpracování souboru (př. rozsekání na 2s framy, ...) - optional
- detekční vrstva
- generalizace výsledků

## Funkční požadavky
- možnost přidat, odebrat metodu
- více detekčních metod naráz
- možnost změnit model metody (přetrénovaný model na jinou datovou sadou)
    - požadavky na vstupní formát dat zaobaluje detekční metoda
- nahrání fotky, videa, audio nahrávky 
    - base line - soubor, link
    - chtěné rozšíření - element stránky
- srozumitelná reprezentace výsledků (široká veřejnost)
- security (kontrola vstupních dat, zahlcení)
- sběr statistik
    - analýza jaká data je možné ukládat (privacy policy)
- sběr feedbacku

## Nefunkční požadavky
- škálovatelnost (jednotky až tisíce uživatelů)
- krátká doba odezvy (jednotky, malé desítky sekund)
- low cost provoz (cloud -> cena za výpočetní čas)
- co nejvetší přenositelnost mezi různými prohlížeči
- open-source