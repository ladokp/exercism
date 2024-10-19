export function toRna(dna: string) {
  const dictionary: { [nucleotide: string]: string } = {G: "C", C: "G", T: "A", A: "U"}
  var rna: string[] = []
  for (var nucleotide of dna) {
    if (!(nucleotide in dictionary)) {
      throw new Error("Invalid input DNA.")
    }
    rna.push(dictionary[nucleotide])
  }
  return rna.join("")
}
