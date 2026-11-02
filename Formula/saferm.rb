class Saferm < Formula
  desc "Safer rm: moves files to the trash, confirms, protects important directories"
  homepage "https://github.com/bartverbruggen/saferm"
  version "0.1.0"
  license "Unlicense"

  on_macos do
    on_arm do
      url "https://github.com/bartverbruggen/saferm/releases/download/v#{version}/saferm-aarch64-apple-darwin.tar.gz"
      sha256 "FILL_ME_IN"
    end
    on_intel do
      url "https://github.com/bartverbruggen/saferm/releases/download/v#{version}/saferm-x86_64-apple-darwin.tar.gz"
      sha256 "FILL_ME_IN"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bartverbruggen/saferm/releases/download/v#{version}/saferm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "FILL_ME_IN"
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
