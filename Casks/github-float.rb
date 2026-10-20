cask "github-float" do
  version "1.11.0"
  sha256 "5b7ebbe5300da23cc44c24b2406862616a08ee0b092648d28cf40c897a76b858"

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
