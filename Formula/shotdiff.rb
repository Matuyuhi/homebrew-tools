# Template for Matuyuhi/homebrew-tools/Formula/shotdiff.rb.
# Values are substituted and pushed by Matuyuhi/shotdiff (.github/workflows/release.yml) on each release.

class Shotdiff < Formula
  desc "Side-by-side screenshot diff: BEFORE | DIFF | AFTER, changes in pink"
  homepage "https://github.com/Matuyuhi/shotdiff"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/shotdiff/releases/download/v#{version}/shotdiff-aarch64-apple-darwin.tar.gz"
      sha256 "ea991e4afad313b1b955138e4e1ad5611f25e7532e5dbbe7635cf36db6709c64"
    else
      url "https://github.com/Matuyuhi/shotdiff/releases/download/v#{version}/shotdiff-x86_64-apple-darwin.tar.gz"
      sha256 "b6df83d83540a7ea77f75aaabed45f97873801b85bb37ad406a8d8d5c0f65a57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/shotdiff/releases/download/v#{version}/shotdiff-aarch64-linux.tar.gz"
      sha256 "ed058e1df1c34c1179006ee92dca82b60a1d9fa7a5f9daad2783b2a3866dc6dc"
    else
      url "https://github.com/Matuyuhi/shotdiff/releases/download/v#{version}/shotdiff-x86_64-linux.tar.gz"
      sha256 "ac6a05eb571913229bf6a55a5855181174a81001b84780037c5835564fecf941"
    end
  end

  def install
    bin.install "shotdiff"
  end

  test do
    assert_match "shotdiff", shell_output("#{bin}/shotdiff --help")
  end
end
