class Brack < Formula
  desc "A bracket-based lightweight markup language that extends commands with WebAssembly"
  homepage "https://github.com/brack-lang/brack"
  version "0.2.0-rc.12"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/brack-lang/brack/releases/download/v0.2.0-rc.12/brack-x86_64-darwin"
      sha256 "1a5dac1a4626661714f35b844b27c2a6fb79abcf835e7a7dc63eafd3bb625cfa"
      def install
        bin.install "brack-x86_64-darwin" => "brack"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/brack-lang/brack/releases/download/v0.2.0-rc.12/brack-aarch64-darwin"
      sha256 "bf6c7e5343e866e7090ad36da657c1e2b36fc16573b5e5ff09267bff1381955a"
      def install
        bin.install "brack-aarch64-darwin" => "brack"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brack-lang/brack/releases/download/v0.2.0-rc.12/brack-x86_64-linux"
      sha256 "8475dd5d7d0555b03574c569387bb3cf32dd917f7764372abd3e0f71bd8d5f55"
      def install
        bin.install "brack-x86_64-linux" => "brack"
      end
    end
  end

  test do
    system "#{bin}/brack", "version"
  end
end

