class Ip < Formula
  desc "Display public and private IPs and city for active network interfaces"
  homepage "https://github.com/StarkChristmas/ipget"
  version "1.0.0"

  if Hardware::CPU.arm?
    url "https://github.com/StarkChristmas/ipget/releases/download/v1.0.0/ip_macos_v1.0.0_arm64.tar.gz"
    sha256 "c6093016dec0cb27576dcaa486fbe47140640646198ac57757392280635122c6"
  else
    url "https://github.com/StarkChristmas/ipget/releases/download/v1.0.0/ip_macos_v1.0.0_x86_64.tar.gz"
    sha256 "04062e4b634778f68bad52ee8e5e02f1c13c28f210bce0252023e28f07174730"
  end

  def install
    bin.install "ip_#{Hardware::CPU.arm? ? "arm64" : "x86_64"}" => "ip"
  end

  test do
    output = shell_output("#{bin}/ip 2>&1")
    assert_match(/\d+\.\d+\.\d+\.\d+/, output)
  end
end
