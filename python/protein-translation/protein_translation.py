from collections.abc import Generator


def generate_proteins(strand: str) -> Generator[str, None, None]:
    """Yields proteins from RNA strand."""
    for i in range(0, len(strand), 3):
        current_slice = slice(i, i + 3)
        protein = None
        match strand[current_slice]:
            case "AUG":
                protein = "Methionine"
            case "UUU" | "UUC":
                protein = "Phenylalanine"
            case "UUA" | "UUG":
                protein = "Leucine"
            case "UCU" | "UCC" | "UCA" | "UCG":
                protein = "Serine"
            case "UAU" | "UAC":
                protein = "Tyrosine"
            case "UGU" | "UGC":
                protein = "Cysteine"
            case "UGG":
                protein = "Tryptophan"
            case "UAA" | "UAG" | "UGA":
                return
        yield protein


def proteins(strand: str) -> list[str]:
    """Translates RNA sequences into proteins."""
    return list(generate_proteins(strand))
