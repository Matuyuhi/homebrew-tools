# Template for Matuyuhi/homebrew-tools/Formula/hush.rb.
# Values are substituted and pushed by Matuyuhi/hush (.github/workflows/release.yml) on each release.

class Hush < Formula
  desc "Compress dev-command output for LLMs; the filter physically cannot transmit it"
  homepage "https://github.com/Matuyuhi/hush"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-apple-darwin.tar.gz"
      sha256 "c94ad48df616b08e60419cac58bdec0aa90025e5c1a86f5bb8bf787f8a4499a0"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-apple-darwin.tar.gz"
      sha256 "4b7f2b4073e5c6923662d5f9ffc367e2bfe47da43eaf0f27aab04a592ca650e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-linux.tar.gz"
      sha256 "ad305606eabbeac58c34f169cbb41394e9f9ca9f3685a0435947f088f1add8b7"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-linux.tar.gz"
      sha256 "20b9100ce5daeb84ce3d975529b810cdb0a7cba375f610830f0d8d89276fe291"
    end
  end

  def install
    bin.install "hush"
  end

  test do
    assert_match "hush", shell_output("#{bin}/hush --help")
  end
end
