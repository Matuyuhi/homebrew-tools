# Template for Matuyuhi/homebrew-tools/Formula/fv.rb.
# Values are substituted and pushed by Matuyuhi/fv (.github/workflows/release.yml) on each release.

class Fv < Formula
  desc "Read-only TUI code viewer with syntax highlighting and git status"
  homepage "https://github.com/Matuyuhi/fv"
  version "2.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-apple-darwin.tar.gz"
      sha256 "db6fbdd344e30cef61fc55e18b982c3d18d728ab5edefd71fc3eb4ec8303ea9d"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-apple-darwin.tar.gz"
      sha256 "2469150d86169147b295f870bb514b8952138cca7b81689515a037bb4105fab2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-linux.tar.gz"
      sha256 "8820a8e4d028b8ef333331a61116ad1a658a9d2e1514f63bc231b62d9acbec53"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-linux.tar.gz"
      sha256 "71a59a13d7cea1a1eaae8299a8f18ae97a8937891e422971d12803861ed344bb"
    end
  end

  def install
    bin.install "fv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fv --version")
  end
end
