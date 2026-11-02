class Saferm < Formula
  desc "Safer rm: moves files to the trash, confirms, protects important directories"
  homepage "https://github.com/bartverbruggen/saferm"
  version "0.1.0"
  license "Unlicense"

  on_macos do
    on_arm do
      url "https://github.com/bartverbruggen/saferm/releases/download/v#{version}/saferm-aarch64-apple-darwin.tar.gz"
      sha256 "b3c008afdeb8c9ef72112c44dc55cac97571166c870a203f1cfad4d027b113c5"
    end
    on_intel do
      url "https://github.com/bartverbruggen/saferm/releases/download/v#{version}/saferm-x86_64-apple-darwin.tar.gz"
      sha256 "291a61cf894da0e052a101c3f8a1d9fbfe7134b48aa65eeb59fd89025054df10"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bartverbruggen/saferm/releases/download/v#{version}/saferm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3ec7b6a5bb156c6100e7bd3839026751f23a58a2c806f4b485b005737506aee"
    end
  end

  def install
    bin.install "saferm"
  end

  def caveats
    <<~EOS
      saferm does not replace /bin/rm. To use it as rm, add this to ~/.zshrc or ~/.bashrc:

        alias rm=saferm

      Bypass the alias with \\rm or `command rm`.
      Add protected paths in ~/.config/saferm/config.toml (see the README).
    EOS
  end

  test do
    (testpath/"missing").mkpath
    system bin/"saferm", "-f", "does-not-exist"
  end
end
