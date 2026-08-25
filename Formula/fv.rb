# Template for Matuyuhi/homebrew-tools/Formula/fv.rb.
# Values are substituted and pushed by Matuyuhi/fv (.github/workflows/release.yml) on each release.

class Fv < Formula
  desc "Read-only TUI code viewer with syntax highlighting and git status"
  homepage "https://github.com/Matuyuhi/fv"
  version "2.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-apple-darwin.tar.gz"
      sha256 "854203b82de868d80d12f84ba6e364be0897d87a940ec2f134a6162b716312b6"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-apple-darwin.tar.gz"
      sha256 "8aa3170f5f4883058fc6087645aec9e9bc33ce89486d6922c6f82f923ea8334f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-linux.tar.gz"
      sha256 "c85a094d7eecdaf0daf22d661a3be1192355ce1f31ce87b69f196bc7ec48f001"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-linux.tar.gz"
      sha256 "1443c1a58737e6c0bf7b25b630f14a519f60f4fd7d75e89c6ae03ba0a50c06c1"
    end
  end

  def install
    bin.install "fv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fv --version")
  end
end
