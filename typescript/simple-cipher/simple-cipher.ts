export class SimpleCipher {
    private alphabet = 'abcdefghijklmnopqrstuvwxyz'
    public key: string

    constructor(key?: string) {
        this.key = key ? key : this.generateKey()
    }

    private generateKey = (length: number = 100) => new Array(length).fill(null)
        .map(() => this.alphabet.charAt(Math.floor((Math.random() * this.alphabet.length)))).join('');

    public decode = (s: string) => this.transpose(s, -1);
    public encode = (s: string) => this.transpose(s, 1);

    private transpose = (text: string, direction: 1 | -1) => Array.from(text).map((c, i) => {
        const shift = this.alphabet.indexOf(this.key[i % this.key.length]);
        const position = this.alphabet.indexOf(c);
        const newPosition = (position + shift * direction + this.alphabet.length) % this.alphabet.length;
        return this.alphabet.charAt(newPosition);
    }).join('');
}