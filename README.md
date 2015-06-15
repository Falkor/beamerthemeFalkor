-*- mode: markdown; mode: visual-line; -*-

[![Licence](https://img.shields.io/badge/license-CC by--nc--sa-blue.svg)](http://creativecommons.org/licenses/by-nc-sa/4.0)

                 _____     _ _                ____
                |  ___|_ _| | | _____  _ __  | __ )  ___  __ _ _ __ ___   ___ _ __
                | |_ / _` | | |/ / _ \| '__| |  _ \ / _ \/ _` | '_ ` _ \ / _ \ '__|
                |  _| (_| | |   < (_) | |    | |_) |  __/ (_| | | | | | |  __/ |
                |_|  \__,_|_|_|\_\___/|_|    |____/ \___|\__,_|_| |_| |_|\___|_|

                                  _____ _
                                 |_   _| |__   ___ _ __ ___   ___
                                   | | | '_ \ / _ \ '_ ` _ \ / _ \
                                   | | | | | |  __/ | | | | |  __/
                                   |_| |_| |_|\___|_| |_| |_|\___|

                  Copyright (c) 2015 Sebastien Varrette <sebastien.varrette@uni.lu>

| [Project Page](https://github.com/Falkor/beamerthemeFalkor) | [Sources](https://github.com/Falkor/beamerthemeFalkor) |              [Issues](https://github.com/Falkor/beamerthemeFalkor/issues) |

## Synopsis

My personal LaTeX Beamer theme, provided in a working environment. 

This theme is largely based on the [progressbar](http://recherche.noiraudes.net/fr/LaTeX.php) beamer theme (by Sylvain Bouveret) with my own customization to fit my tastes. 
So feel free to send him a postal card (as he asks for ;) )

      Progressbar Version: 0.42 September 2010.

## Installation 

This repository is hosted on [Github](https://github.com/Falkor/beamerthemeFalkor). 

**`/!\ IMPORTANT`**: Once cloned, initiate your local copy of the repository by running: 

    $> cd beamerthemefalkor
    $> make setup

Then you can copy the `beamerthemeFalkor.sty` in your own repository.

## Usage

```latex
\documentclass{beamer}

% customize the image using the image=<path> option
\usetheme[image=logo_github.png]{Falkor}

% customize the logo (to be placed on the bottom right) as follows:
\pgfdeclareimage[height=0.8cm]{logo}{logo_UL.pdf}
```

You probably want to use [my own LaTeX Makefile](https://github.com/Falkor/Makefiles/blob/devel/latex/Makefile) combined with my generic [LaTeX style file](https://github.com/Falkor/Makefiles/blob/devel/latex/template-article-styles/_style.sty) as done in the [advanced example](examples/advanced) 

## Examples

All customization / installation instructions are better described in the sample PDF produced using this theme:

* a [Minimal](examples/minimal.pdf) example -- [sources](examples/minimal/) 
* a [more complete](examples/advanced.pdf) example with usage instructions -- [sources](examples/advanced/)
* you can (who said should?) at least try to combine it with [markdown](http://daringfireball.net/projects/markdown/).
   - an [example based on markdown](examples/markdown.pdf) is also provided -- [sources](examples/markdown/)

## Markdown-based Beamer Workflow

* Install [pandoc](http://pandoc.org/)
* Rely on my [LaTeX Makefile](https://github.com/Falkor/Makefiles/blob/devel/latex/Makefile) (or define your own)
* Rely on a main file in LaTeX
    - split markdown content in individual Markdown files
    - these file **SHOULD HAVE** the `.md` extension
	- my `Makefile` compile all `.md` files into `.md.tex` LaTeX files using:

            pandoc –from markdown –to beamer –slide-level 3 -o <filename>.md.tex <filename>.md

* Simply include the markdown files using `\input{<filename>.md}`
    - in practice, `<filename>.md.tex` is considered for inclusion since the `.tex` extension is automatically appended.

You can see a concrete example in [`examples/markdown/`](examples/markdown).
In particular, you might consider the [markdown file](examples/markdown/_content_in_markdown.md) used to produce the slides (see also the [raw markdown version](https://raw.githubusercontent.com/Falkor/beamerthemeFalkor/master/examples/markdown/_content_in_markdown.md))

## Contributing

### [Git-flow](https://github.com/nvie/gitflow)

The Git branching model for this repository follows the guidelines of [gitflow](http://nvie.com/posts/a-successful-git-branching-model/).
In particular, the central repository holds two main branches with an infinite lifetime:

* `production`: the *production-ready* branch
* `master`: the main branch where the latest developments interviene. This is the *default* branch you get when you clone the repository.

Thus you are more than encouraged to install the [git-flow](https://github.com/nvie/gitflow) extensions following the [installation procedures](https://github.com/nvie/gitflow/wiki/Installation) to take full advantage of the proposed operations. The associated [bash completion](https://github.com/bobthecow/git-flow-completion) might interest you also.

### Releasing mechanism

The operation consisting of releasing a new version of this repository is automated by a set of tasks within the root `Makefile`.

In this context, a version number have the following format:

      <major>.<minor>.<patch>[-b<build>]

where:

* `< major >` corresponds to the major version number
* `< minor >` corresponds to the minor version number
* `< patch >` corresponds to the patching version number
* (eventually) `< build >` states the build number _i.e._ the total number of commits within the `master` branch.

Example: \`1.0.0-b28\`

The current version number is stored in the root file `VERSION`. __/!\ NEVER MAKE ANY MANUAL CHANGES TO THIS FILE__

For more information on the version, run:

     $> make versioninfo

If a new version number such be bumped, you simply have to run:

      $> make start_bump_{major,minor,patch}

This will start the release process for you using `git-flow`.
Once you have finished to commit your last changes, make the release effective by running:

      $> make release

it will finish the release using `git-flow`, create the appropriate tag in the `production` branch and merge all things the way they should be.

## Licence

This project is released under the terms of the [CC by-nc-sa](LICENCE) licence. 

[![LICENCE](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0)

## Contributing

That's quite simple:

1. [Fork](https://help.github.com/articles/fork-a-repo/) it
2. Create your own feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new [Pull Request](https://help.github.com/articles/using-pull-requests/)
