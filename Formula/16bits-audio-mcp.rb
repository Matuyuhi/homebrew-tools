class SixteenBitsAudioMcp < Formula
  desc "Game audio MCP server - generate BGM, SE, and jingles via Claude"
  homepage "https://github.com/Matuyuhi/16bits-gaudio-mcp"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_AARCH64_DARWIN"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_X86_64_DARWIN"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-linux.tar.gz"
      sha256 "PLACEHOLDER_AARCH64_LINUX"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-linux.tar.gz"
      sha256 "PLACEHOLDER_X86_64_LINUX"
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
