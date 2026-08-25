# Template for Matuyuhi/homebrew-tools/Formula/fv.rb.
# Values are substituted and pushed by Matuyuhi/fv (.github/workflows/release.yml) on each release.

class Fv < Formula
  desc "Read-only TUI code viewer with syntax highlighting and git status"
  homepage "https://github.com/Matuyuhi/fv"
  version "2.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-apple-darwin.tar.gz"
      sha256 "3c7ff753c9549e83d42517c4523fdbc5573572f9fb4ded60bfe679b27ee7c644"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-apple-darwin.tar.gz"
      sha256 "facd46720b5cc52e7644b8b036bb6dcab74a6b5ab10d548bb5079211b1aa96fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-aarch64-linux.tar.gz"
      sha256 "2a035ec2e5f6607a5fb0554204b202a78422e0af4a839b4b6a480bbcfc7bf893"
    else
      url "https://github.com/Matuyuhi/fv/releases/download/v#{version}/fv-x86_64-linux.tar.gz"
      sha256 "dbc3d102f59f9aab7989ff0b44e36a63428ccbd9f188e0ea62620d0b555921c5"
    end
  end

  def install
    bin.install "fv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fv --version")
  end
end
