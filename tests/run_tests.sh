#!/bin/bash

testSimple() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'simpletest' <<< '*|FIND_THIS|*')
    assertEquals 'Basic string' 'simpletest' "${REPLACEMENT}"
}

testNumbers() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' '123456789' <<< '*|FIND_THIS|*')
    assertEquals 'Basic numbers' '123456789' "${REPLACEMENT}"
}

testDecimalNumbers() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' '3.141592' <<< '*|FIND_THIS|*')
    assertEquals 'Basic decimal numbers' '3.141592' "${REPLACEMENT}"
}

testSimpleWithSpace() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'simple test with spaces' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with spaces' 'simple test with spaces' "${REPLACEMENT}"
}

testSimpleWithUnderscore() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'under_score_test' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with underscores' 'under_score_test' "${REPLACEMENT}"
}

testSimpleWithHyphen() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'hype-n-ated' <<< '*|FIND_THIS|*')
    assertEquals 'Basic hyphenated text' 'hype-n-ated' "${REPLACEMENT}"
}

testSimpleWithComma() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'comma,karma,karma' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with commas' 'comma,karma,karma' "${REPLACEMENT}"
}

testSimpleWithPeriod() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'peri.od...' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with periods' 'peri.od...' "${REPLACEMENT}"
}

testSimpleWithApostrophe() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' "You'reTheAppleOfMyE'ye" <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with apostrophes' "You'reTheAppleOfMyE'ye" "${REPLACEMENT}"
}

testSimpleWithDoubleQuotation() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' '"WhosLineIsItAnyway"' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with quotation' '"WhosLineIsItAnyway"' "${REPLACEMENT}"
}

testSimpleWithRoundBoys() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' '(itsHipTo)' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text round brackets' '(itsHipTo)' "${REPLACEMENT}"
}

testSimpleWithCurlyBoys() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' '{be}' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with curly boys' '{be}' "${REPLACEMENT}"
}

testSimpleWithSquareBraces() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' '[square]' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with square braces' '[square]' "${REPLACEMENT}"
}

testSimpleWithGraves() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' '`thisCouldBeBad`' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with graves' '`thisCouldBeBad`' "${REPLACEMENT}"
}

testSimpleWithWaves() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'sad~boys~2001' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with tidals' 'sad~boys~2001' "${REPLACEMENT}"
}

testSimpleWithPipe() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'pipe||PIPE||p|pe' <<< '*|FIND_THIS|*')
    assertEquals 'Basic text with pipes' 'pipe||PIPE||p|pe' "${REPLACEMENT}"
}

testSymbols() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' '`~1!2@3#4$5%6^7&8*9(0)-_=+[{]}|;:",<.>/?' <<< '*|FIND_THIS|*')
    assertEquals 'Symbols' '`~1!2@3#4$5%6^7&8*9(0)-_=+[{]}|;:",<.>/?' "${REPLACEMENT}"
}

testSymbolsDoubled() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' '``~~!!@@##$$%%^^&&**(())__++{{}}||::""<<>>??--==[[]];;,,...//' <<< '*|FIND_THIS|*')
    assertEquals 'Symbols in pairs' '``~~!!@@##$$%%^^&&**(())__++{{}}||::""<<>>??--==[[]];;,,...//' "${REPLACEMENT}"
}

testUrlBasic() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'https://www.google.com.au' <<< '*|FIND_THIS|*')
    assertEquals 'Basic URL' 'https://www.google.com.au' "${REPLACEMENT}"
}

testUrlWithArgs() {
    REPLACEMENT=$(../easy-sed.sh '*|FIND_THIS|*' 'https://google.com.au?wwwSubdomain=important&hideIt=true' <<< '*|FIND_THIS|*')
    assertEquals 'URL with arguments' 'https://google.com.au?wwwSubdomain=important&hideIt=true' "${REPLACEMENT}"
}

. ./shunit2/shunit2