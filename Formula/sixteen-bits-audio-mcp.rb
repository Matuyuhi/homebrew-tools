# Homebrew expects class name derived from filename.
# "16bits-audio-mcp" -> "16bitsAudioMcp" which is invalid Ruby.
# Workaround: register the formula class under the expected name.
class SixteenBitsAudioMcp < Formula
  desc "Game audio MCP server - generate BGM, SE, and jingles via Claude"
  homepage "https://github.com/Matuyuhi/16bits-gaudio-mcp"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "3adbace398b4ce3edb1fd06a244c374e08c0bbe798283cd41f6979016c488cdf"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "57ab7b011641b8014a68b1c3418f635f8297518a25e7cb1ec73c5f713279d7fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-aarch64-linux.tar.gz"
      sha256 "667195a6c3756b0d0e371de86aa1cb89e7a4fc7a42e69dc5d8a8f3ed91774fab"
    else
      url "https://github.com/Matuyuhi/16bits-gaudio-mcp/releases/download/v#{version}/16bits-audio-mcp-x86_64-linux.tar.gz"
      sha256 "08c3099b2594939a8caaea270292a29352f71abf5245d8d9cb4b161d9ecab11e"
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
