cask "github-float" do
  version "1.14.2"
  sha256 "f761f31bf21d82e3ef44d18e60b577df4fd71caa34421db57e3a82f9396889ae"

  url "https://github.com/vinimcorrea/github-float/releases/download/v#{version}/GitHubFloat.zip"
  name "GitHub Float"
  desc "Always-on-top panel for GitHub Project reviews"
  homepage "https://github.com/vinimcorrea/github-float"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "GitHubFloat.app"

  # The app is ad-hoc signed (not notarized): drop the quarantine flag so it opens without a Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/GitHubFloat.app"], must_succeed: false
  end

  uninstall quit: "com.vinimcorrea.githubfloat"

  zap trash: [
    "~/Library/Preferences/com.vinimcorrea.githubfloat.plist",
  ]
end
