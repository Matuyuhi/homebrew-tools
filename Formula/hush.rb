# Template for Matuyuhi/homebrew-tools/Formula/hush.rb.
# Values are substituted and pushed by Matuyuhi/hush (.github/workflows/release.yml) on each release.

class Hush < Formula
  desc "Compress dev-command output for LLMs; the filter physically cannot transmit it"
  homepage "https://github.com/Matuyuhi/hush"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-apple-darwin.tar.gz"
      sha256 "0e248682779adfcac58f8257fbb25addcc01c8c87bfb5800ec710801dd878fc2"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-apple-darwin.tar.gz"
      sha256 "b3d367663dfb0b5550da34ba026298a018b13c5126b6d0edb8720c2894a19107"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-linux.tar.gz"
      sha256 "1a4474d633e3745544446db54cef08d9b330c01e345dcf276f315109bfc0449e"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-linux.tar.gz"
      sha256 "0fa6962bfb8c8c0edcda64c6e06cb7297a289cc387234abbb735bf2855b8319a"
    end
  end

  def install
    bin.install "hush"
  end

  test do
    assert_match "hush", shell_output("#{bin}/hush --help")
  end
end
