# Template for Matuyuhi/homebrew-tools/Formula/hush.rb.
# Values are substituted and pushed by Matuyuhi/hush (.github/workflows/release.yml) on each release.

class Hush < Formula
  desc "Compress dev-command output for LLMs; the filter physically cannot transmit it"
  homepage "https://github.com/Matuyuhi/hush"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-apple-darwin.tar.gz"
      sha256 "aaa862b17a5599c6a7b735ed5c149df8483c48c33965f119c5f3d43ad0649c2e"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-apple-darwin.tar.gz"
      sha256 "21623d369d9ed6849edadc16087b28929b2a0a6c76eab6d758017638cfe866db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-linux.tar.gz"
      sha256 "63d4764cf86215738efae3ce33e272206c3c06b1700e5298b27058cb1472b712"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-linux.tar.gz"
      sha256 "9b356536669bf3b2ef2c91a9f92e1f11828edcb7438c26ef91b9dcdbffd59274"
    end
  end

  def install
    bin.install "hush"
  end

  test do
    assert_match "hush", shell_output("#{bin}/hush --help")
  end
end
