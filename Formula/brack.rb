class Brack < Formula
  desc "A bracket-based lightweight markup language that extends commands with WebAssembly"
  homepage "https://github.com/brack-lang/brack"
  license "MIT OR Apache-2.0"

  version "0.2.0"

  x86_64_darwin_sha256 = ""
  aarch64_darwin_sha256 = ""
  x86_64_linux_sha256 = ""
  release_base_url = "https://github.com/brack-lang/brack/releases/download/v#{version}/"

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

