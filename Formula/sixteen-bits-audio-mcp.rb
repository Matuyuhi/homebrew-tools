# Homebrew expects class name derived from filename.
# "16bits-audio-mcp" -> "16bitsAudioMcp" which is invalid Ruby.
# Workaround: register the formula class under the expected name.
class SixteenBitsAudioMcp < Formula
  desc "Game audio MCP server - generate BGM, SE, and jingles via Claude"
  homepage "https://github.com/Matuyuhi/16bits-gaudio-mcp"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "812a482cb940e0e81d37be778486a24f061d7164a185f6273b9b2a26eb89256d"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "ee0a5ab7698b7c318a59c30d6a9f11a2194ebf0e49b0f6025ebe2fdd71782a63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-linux.tar.gz"
      sha256 "7a7ac7e501beea16dad58ff9b7f5c9f766d308152563e690c653328f4d2d2c20"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-linux.tar.gz"
      sha256 "571b3cc8e102eca19f2e547eee5025de02b7a5abe3b280a64dd4dd87667eff1e"
    end
  end

  def install
    bin.install "16bits-audio-mcp"
  end

  test do
    input = '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{}}}'
    output = pipe_output(bin/"16bits-audio-mcp", input)
    assert_match "protocolVersion", output
  end
end
