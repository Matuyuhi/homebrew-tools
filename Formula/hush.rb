# Template for Matuyuhi/homebrew-tools/Formula/hush.rb.
# Values are substituted and pushed by Matuyuhi/hush (.github/workflows/release.yml) on each release.

class Hush < Formula
  desc "Compress dev-command output for LLMs; the filter physically cannot transmit it"
  homepage "https://github.com/Matuyuhi/hush"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-apple-darwin.tar.gz"
      sha256 "e1ccc0d6367a1405caf3b46af9f00f2c5bccef1f00631f448d8002785448b6ed"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-apple-darwin.tar.gz"
      sha256 "d9325751f10fd47193600ee7b103f50a1a0c9d9fe14d66729a69aee34bd9861d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-aarch64-linux.tar.gz"
      sha256 "63c18b03c1d700cc1803d0e93463075e19a4f550ddae0ec5c5aa2c6b806719eb"
    else
      url "https://github.com/Matuyuhi/hush/releases/download/v#{version}/hush-x86_64-linux.tar.gz"
      sha256 "da14ebc40c0801c60683406a6dd695e499c7f0c48de9ad36ad3612bd9a53e1bb"
    end
  end

  def install
    bin.install "hush"
  end

  test do
    assert_match "hush", shell_output("#{bin}/hush --help")
  end
end
