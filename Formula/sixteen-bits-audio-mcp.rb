# Homebrew expects class name derived from filename.
# "16bits-audio-mcp" -> "16bitsAudioMcp" which is invalid Ruby.
# Workaround: register the formula class under the expected name.
class SixteenBitsAudioMcp < Formula
  desc "Game audio MCP server - generate BGM, SE, and jingles via Claude"
  homepage "https://github.com/Matuyuhi/16bits-gaudio-mcp"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "6778c4f2ee1cadb58c8c4ad40d1ec957db80f133e6d01f4751e90fca3ba59f69"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "3284971cfb9c7744e6ebbfb33956b09bd8b1f594d2638234ec16a0b0bc86d3c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-linux.tar.gz"
      sha256 "a67a1d448c6935d2759b860519d740b89f316b4d12b38c4da8bfbcb9c6cedcaa"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-linux.tar.gz"
      sha256 "d9e60a5f607c961f5ec02938e82fc4e41a60afca0ab9dafa3c7be8c3a31fdfa1"
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
