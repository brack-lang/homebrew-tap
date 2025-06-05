class Brack < Formula
  desc "A bracket-based lightweight markup language that extends commands with WebAssembly"
  homepage "https://github.com/brack-lang/brack"
  license "MIT OR Apache-2.0"

  version "0.2.0"

  x86_64_darwin_sha256 = "401baddd1f81e0ba676c0bebe26770f6bd5a84220163a6936e35bf883b3b5379"
  aarch64_darwin_sha256 = "6add3319a5bace00f74e7cd13cf405a3c50ce2d9d8c473c8b3b6d833d24d3071"
  x86_64_linux_sha256 = "e56ba9e12e9197c15703fe025902fc630bbdd2cb7e8d1a1781c6c25f1e065157"
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

