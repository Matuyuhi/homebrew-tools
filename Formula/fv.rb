# Template for Matuyuhi/homebrew-tools/Formula/fv.rb.
# Values are substituted and pushed by Matuyuhi/fv (.github/workflows/release.yml) on each release.

class Fv < Formula
  desc "Read-only TUI code viewer with syntax highlighting and git status"
  homepage "https://github.com/Matuyuhi/fv"
  version "2.1.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-apple-darwin.tar.gz"
      sha256 "7498e3191fe377726d2c6a12f9add7d0388c040258f56a6993924911af76031d"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-apple-darwin.tar.gz"
      sha256 "dea9452869f29b69f5df9d6c4e4687e570d7dc258b59536c6289630208127f91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-linux.tar.gz"
      sha256 "f47fc7319c73190fe44261c9015b4504f28392c277c36126384893b76514bd75"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-linux.tar.gz"
      sha256 "201443aff5d52b7ffb42336bad610cb8f375d5f931f4224f29fa61b2c02a854f"
    end
  end

  def install
    bin.install "fv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fv --version")
  end
end
