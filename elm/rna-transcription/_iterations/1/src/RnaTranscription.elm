module RnaTranscription exposing (toRNA)


createErrorMessage : Char -> String
createErrorMessage invalidNucleotide =
    "'"
        ++ String.fromChar invalidNucleotide
        ++ "' is not a valid nucleotide"


toRNA : String -> Result String String
toRNA dna =
    dna
        |> String.toList
        |> List.map toRNANucleotide
        |> resultExtraCombine
        |> Result.map (String.fromList << List.map identity)
        |> Result.mapError createErrorMessage


-- Copied from elm-result-extra
resultExtraCombine : List (Result x a) -> Result x (List a)
resultExtraCombine =
    List.foldr (Result.map2 (::)) (Ok [])


toRNANucleotide : Char -> Result Char Char
toRNANucleotide nuc =
    case nuc of
        'C' ->
            Ok 'G'

        'G' ->
            Ok 'C'

        'A' ->
            Ok 'U'

        'T' ->
            Ok 'A'

        _ ->
            Err nuc
