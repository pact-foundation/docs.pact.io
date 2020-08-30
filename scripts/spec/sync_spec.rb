require_relative '../sync/support'

RSpec.describe "UrlAbsolutizer" do

  let(:contents) do
    " [CONTRIBUTING](CONTRIBUTING.md) "
  end
  let(:source_paths) { %w{FOO.md} }
  let(:source_repository_slug) { "foo/bar" }
  let(:link_transformer) { ->(path) { "foo/" + path.downcase.chomp('.md') } }
  let(:contents_source_path) { "dir1/somefile.md" }

  subject { UrlAbsolutizer.absolutize_links(contents, source_repository_slug, link_transformer, contents_source_path, source_paths) }

  context "when the URL is for a file that has not been synced to the docs" do
    it "modifies the link to point to the file in the repository" do
      expect(subject).to eq " [CONTRIBUTING](https://github.com/foo/bar/blob/master/CONTRIBUTING.md) "
    end
  end

  context "when the URL is for a file that has been synced to the docs" do
    let(:source_paths) { %w{CONTRIBUTING.md} }

    it "modifies the link to point to the file in the repository" do
      expect(subject).to eq " [CONTRIBUTING](foo/contributing) "
    end
  end

  context "when the file has been synced to the docs and it has a leading slash" do
    let(:contents) do
      " [CONTRIBUTING](/CONTRIBUTING.md) "
    end
    let(:source_paths) { %w{CONTRIBUTING.md} }

    it "modifies the link to point to the file in the repository" do
      expect(subject).to eq " [CONTRIBUTING](foo/contributing) "
    end
  end

  context "when the URL is already absolute" do
    let(:contents) do
      " [CONTRIBUTING](http://some-site/CONTRIBUTING.md) "
    end

    it "does not modify the URL" do
      expect(subject).to eq contents
    end
  end

  context "when the URL is a bookmark" do
    let(:contents) do
      " [CONTRIBUTING](#foo) "
    end

    it "does not modify the URL" do
      expect(subject).to eq contents
    end
  end

  context "when the URL is has .. in it" do
    let(:contents) do
      "[pact Gradle plugin](../../provider/gradle#publishing-pact-files-to-a-pact-broker)"
    end

    let(:contents_source_path) { "consumer/groovy/README.md" }

    it "resolves the path" do
      expect(subject).to eq "[pact Gradle plugin](https://github.com/foo/bar/blob/master/provider/gradle#publishing-pact-files-to-a-pact-broker)"
    end
  end

  context "with a link to a README that does not have the README.md suffix" do
    let(:contents) do
      "[Pact junit runner](../junit/)"
    end

    let(:contents_source_path) { "provider/junit5/README.md" }
    let(:source_paths) { %w{provider/junit/README.md} }

    it "resolves the path" do
      expect(subject).to eq "[Pact junit runner](foo/provider/junit)"
    end
  end

  context "with a link to a README.md that has an anchor" do
    let(:contents) do
      "[Pact junit runner](../junit#foo)"
    end

    let(:contents_source_path) { "provider/junit5/README.md" }
    let(:source_paths) { %w{provider/junit/README.md} }

    it "resolves the path" do
      expect(subject).to eq "[Pact junit runner](foo/provider/junit#foo)"
    end
  end

  context "when the URL blah" do
    let(:contents) do
      "* print out helpful error message for 403   ([5d5a18a](/../../commit/5d5a18a))"
    end

    it "resolves the path" do
      expect(subject).to eq "* print out helpful error message for 403   ([5d5a18a](https://github.com/foo/bar/commit/5d5a18a))"
    end
  end

  context "when the URL blah" do
    let(:contents) do
      "* print out helpful error message for 403   ([5d5a18a](/../../commit/5d5a18a))"
    end

    it "resolves the path" do
      expect(subject).to eq "* print out helpful error message for 403   ([5d5a18a](https://github.com/foo/bar/commit/5d5a18a))"
    end
  end
end
