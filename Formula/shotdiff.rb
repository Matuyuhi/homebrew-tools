# Template for Matuyuhi/homebrew-tools/Formula/shotdiff.rb.
# Values are substituted and pushed by Matuyuhi/shotdiff (.github/workflows/release.yml) on each release.

class Shotdiff < Formula
  desc "Side-by-side screenshot diff: BEFORE | DIFF | AFTER, changes in pink"
  homepage "https://github.com/Matuyuhi/shotdiff"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/shotdiff/releases/download/v#{version}/shotdiff-aarch64-apple-darwin.tar.gz"
      sha256 "30ca4bb6f039c50db23dafc91ef6db0e84bcbe27d4390d1801c84c8369604479"
    else
      url "https://github.com/Matuyuhi/shotdiff/releases/download/v#{version}/shotdiff-x86_64-apple-darwin.tar.gz"
      sha256 "499e16407e83b641781c212f66b00385652555c946265f368c4a98d2f897151d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/shotdiff/releases/download/v#{version}/shotdiff-aarch64-linux.tar.gz"
      sha256 "647649921eddd942e037a0215f9a035297cae6da156df2ed8f31aa75bc80ef33"
    else
      url "https://github.com/Matuyuhi/shotdiff/releases/download/v#{version}/shotdiff-x86_64-linux.tar.gz"
      sha256 "bde8d0808f9b82cf59665ef0a2abe0e7bbeb070adfbc6690cc670eaec3f07752"
    end
  end

  def install
    bin.install "shotdiff"
  end

  test do
    assert_match "shotdiff", shell_output("#{bin}/shotdiff --help")
  end
end
