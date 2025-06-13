class Ipget < Formula
  desc "Simple IP acquisition tool written in Go"
  homepage "https://github.com/StarkChristmas/ipget"
  version "1.0.0"

  if Hardware::CPU.arm?
    url "https://github.com/StarkChristmas/ipget/releases/download/v1.0.0/ipget_macos_1.0.0_arm64.tar.gz"
    sha256 "4e509a2c027ece739e814100e7b827aad34006574576ab775eed04cf6cc17d95"
  else
    url "https://github.com/StarkChristmas/ipget/releases/download/v1.0.0/ipget_macos_1.0.0_x86_64.tar.gz"
    sha256 "05cf6c52dbdf78b0a61dd54b1bd93d89446e9ef44cfb1c8c46833d1d9ec82aaa"
  end

  def install
    bin.install "ipget_#{Hardware::CPU.arm? ? "arm64" : "x86_64"}" => "ipget"
  end

  test do
    output = shell_output("#{bin}/ipget")
    assert_match /\d+\.\d+\.\d+\.\d+/, output
  end
end
