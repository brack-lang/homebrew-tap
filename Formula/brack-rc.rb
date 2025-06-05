class BrackRc < Formula
  desc "A bracket-based lightweight markup language that extends commands with WebAssembly (RC version)"
  homepage "https://github.com/brack-lang/brack"
  license "MIT OR Apache-2.0"

  version "0.2.0-rc.20"

  x86_64_darwin_sha256 = "57d5995c2157b27393899372c40853ffbffbf9383c7bb5c47ca6f8b782c76728"
  aarch64_darwin_sha256 = "2fa82bd6975cf0dac5060d9651d24e6751fb48326d6f8fbf7db11b4648dc1b9b"
  x86_64_linux_sha256 = "9cc985f86f5ab2d417f4898e2fbf3cf063ee300675d2395a004d361e5328edd4"
  release_base_url = "https://github.com/brack-lang/brack/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.intel?
      url "#{release_base_url}/brack-x86_64-darwin"
      sha256 x86_64_darwin_sha256

      def install
        bin.install "brack-x86_64-darwin" => "brack"
      end
    end

    if Hardware::CPU.arm?
      url "#{release_base_url}/brack-aarch64-darwin"
      sha256 aarch64_darwin_sha256

      def install
        bin.install "brack-aarch64-darwin" => "brack"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "#{release_base_url}/brack-x86_64-linux"
      sha256 x86_64_linux_sha256

      def install
        bin.install "brack-x86_64-linux" => "brack"
      end
    end
  end

  test do
    system "#{bin}/brack", "version"
  end
end

