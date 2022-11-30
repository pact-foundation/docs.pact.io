---
title: 7. Publish our plugin
---

# Publish our plugin

Now we are going to publish our plugin so that anybody may use it.

Let's open our plugin project once again:

`cd ~/pact-plugin-template-golang`{{exec}}

## Configure Git

Prepare Git for use, replace the values below with your email and name:

```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```{{copy}}

### Create a fine grained personal access token

head to https://github.com/settings/personal-access-tokens/new

* Give it a name and description (e.g. Pact Plugin tutorial)
* Set expiration to something short (like 7 days)
* Choose "only select repositories" and select your plugin project
* Under "repository permissions" choose read and write for "Contents"
* Choose "generate token" and copy the value

## Commit the changes 

Add the files and commit the changes:

```
git add .
git commit -m 'feat: initial foobar plugin'
git push origin master
```

_NOTE: you will need to use your personal access token as the password in this step_

To release, we simply need to:

* Bump the `VERSION` in the `Makefile`. It's currently set to `0.0.1` which is appropriate.
* Tag the project `git tag -a v0.0.1 -m "Initial release"`{{exec}}
* Push the tag `git push origin v0.0.1`{{exec}}

That's it! There is a `release.yml` in the github workflows directory that will automatically build and publish the artifact to GitHub.

## Check the release step

Head over to your GitHub Actions build page for your repo (https://github.com/YOUR_ORG/pact-foobar-plugin/actions). You should see the release job is running (it should take about 3-4 mins to execute).

Once it's completed, it will create a number of release artifacts that are ready to be downloaded by your users!

In fact, they are prepared in a way that can also be installed through the Plugin CLI. Let's download the CLI and install it that way:

`curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-plugins/main/scripts/install-plugin-cli.sh | bash`{{exec}}

Install your plugin, using the CLI, customised to your git repo:

```
/root/bin/pact-plugin-cli install -y https://github.com/YOUR_ORG/pact-foobar-plugin/releases/tag/v0.0.1
```{{copy}}

Check if it's installed:

`/root/bin/pact-plugin-cli list`{{exec}}

You can now head back to your JS tests and try running again to see if it works:

```
cd ~/example-project-js-foobar-plugin
npm t
```{{exec}}

```
...
Verifying a pact between myconsumer and myprovider

  an HTTP request to /foobar
     Given the Foobar protocol exists
    returns a response which
      has status code 200 (OK)
      includes headers
        "content-type" with value "application/foo" (OK)
      has a matching body (OK)
```

WOOT! 🎉