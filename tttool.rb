require "language/haskell"

class Tttool < Formula
  include Language::Haskell::Cabal

  homepage "http://tttool.entropia.de/"
  url "https://github.com/entropia/tip-toi-reveng/archive/1.3.tar.gz"
  sha256 "d2d76439c95938b8b0ee693a38772c1cf7cc8cfb6f75c822f38e643b78c559f7"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    cabal_sandbox do
      cabal_install "--only-dependencies"
      cabal_install "--prefix=#{prefix}"
    end
    cabal_clean_lib
  end

  test do
    system "#{bin}tttool"
  end
end
