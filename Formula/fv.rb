# Template for Matuyuhi/homebrew-tools/Formula/fv.rb.
# Values are substituted and pushed by Matuyuhi/fv (.github/workflows/release.yml) on each release.

class Fv < Formula
  desc "Read-only TUI code viewer with syntax highlighting and git status"
  homepage "https://github.com/Matuyuhi/fv"
  version "2.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-apple-darwin.tar.gz"
      sha256 "39d3b1830c7807dbdbc2034b4cba77752834f278536bdc667226606b418d2164"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-apple-darwin.tar.gz"
      sha256 "7ccc33899fdbca5e5d93ad253acf511e37cd42b7049009f7ab0994f9a76b1666"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-linux.tar.gz"
      sha256 "b13233057e001ec414a987bb3632ea29a49cf311098dc7664249809dabea9e01"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-linux.tar.gz"
      sha256 "21fceb51c97e1c3167509496d950f50ef979e1015a9ef6a50f4af66800e635d0"
    end
  end

  def install
    bin.install "fv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fv --version")
  end
end
