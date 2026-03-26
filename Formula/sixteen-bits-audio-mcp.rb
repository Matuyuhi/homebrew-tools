# Homebrew expects class name derived from filename.
# "16bits-audio-mcp" -> "16bitsAudioMcp" which is invalid Ruby.
# Workaround: register the formula class under the expected name.
class SixteenBitsAudioMcp < Formula
  desc "Game audio MCP server - generate BGM, SE, and jingles via Claude"
  homepage "https://github.com/Matuyuhi/16bits-gaudio-mcp"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "f82836d707bb8d367f602199b5fab61cc551a2d641652c9038460b8ca09e497c"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "72a9bb90824fe1407c929e0ea47f94004c9d26f69f15421673e728485006c110"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-linux.tar.gz"
      sha256 "291e7a43cc57cbfc2971109b01a21dbf8f63c8d0fca434883e84d9defef676e9"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-linux.tar.gz"
      sha256 "0d405e840724cb0e5a55d1193d031be122fd35a58bcf5d14840ca914fa21f685"
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
