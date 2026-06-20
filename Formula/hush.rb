# Template for Matuyuhi/homebrew-tools/Formula/hush.rb.
# Values are substituted and pushed by Matuyuhi/hush (.github/workflows/release.yml) on each release.

class Hush < Formula
  desc "Compress dev-command output for LLMs; the filter physically cannot transmit it"
  homepage "https://github.com/Matuyuhi/hush"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-apple-darwin.tar.gz"
      sha256 "bbe808dc2b85ecd4143c29dc77d572727c5e026229051230c8a1e525458885b4"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-apple-darwin.tar.gz"
      sha256 "f5c3bab60886873b4420ffd53cfe76410adf1fa27883cf18575dcb526a61e338"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-linux.tar.gz"
      sha256 "afd9788862c932128cfe56289ce40a035143dc8803fd04aef4c01ca69161449f"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-linux.tar.gz"
      sha256 "ca96d8aa91642f5ebe8fe0c74f78ed4e2190bee8f2b829c5b9a6356113bd6efc"
    end
  end

  def install
    bin.install "hush"
  end

  test do
    assert_match "hush", shell_output("#{bin}/hush --help")
  end
end
