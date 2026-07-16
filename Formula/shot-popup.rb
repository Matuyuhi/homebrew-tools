class ShotPopup < Formula
  desc "Action popup (copy / open / reveal) for new screenshots saved to the macOS Desktop"
  homepage "https://github.com/Matuyuhi/shot-popup"
  url "https://github.com/Matuyuhi/shot-popup/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "427efc91e67ac958f3b295939ef5a7e95c78c79955f40713feb072689f958d7f"
  license "MIT"

  depends_on :macos
  depends_on xcode: :build

  def install
    system "swiftc", "-O", "-o", "shot-popup", "ShotPopup.swift"
    bin.install "shot-popup"
  end

  service do
    name macos: "com.matuyuhi.shot-popup"
    run [opt_bin/"shot-popup"]
    keep_alive true
    log_path var/"log/shot-popup.log"
    error_log_path var/"log/shot-popup.log"
  end

  def caveats
    <<~EOS
      起動:
        brew services start shot-popup
      初回起動時に「デスクトップフォルダへのアクセス」許可ダイアログが出るので許可してください。

      アップグレード後は署名が変わるため許可ダイアログが再度出ることがあります。
      避けたい場合はキーチェーンで自己署名証明書を作成し、アップグレードのたびに:
        codesign -fs <証明書名> #{opt_bin}/shot-popup
    EOS
  end

  test do
    assert_predicate bin/"shot-popup", :executable?
  end
end
