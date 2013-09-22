module Base43
  ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ$*+-./:"

  def self.encode(str)
    bytes = str.bytes
    n     = bytes.inject(0) { |sum, a| (sum << 8) + a }
    enc   = ""

    while n > 0
      n, r = n.divmod ALPHABET.length
      enc  = ALPHABET[r] + enc
    end

    ALPHABET[0] * bytes.take_while(&:zero?).length + enc
  end
end
