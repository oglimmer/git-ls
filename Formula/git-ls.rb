class GitLs < Formula
  desc "List directories with git repository status information"
  homepage "https://github.com/oglimmer/git-ls"
  url "https://github.com/oglimmer/git-ls/archive/refs/tags/v1.0.0.tar.gz"
  sha256 ""
  license "MIT"

  depends_on "python@3"
  depends_on "git"

  def install
    bin.install "git-ls"
  end

  test do
    assert_match "PERMISSIONS", shell_output("#{bin}/git-ls #{testpath}")
  end
end
