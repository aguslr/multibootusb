---
title: Contributing to the project
layout: default
---

# {{ page.title }}

* auto-gen TOC:
{:toc}

This project is [Free Software][freesoft] released under the [GNU General Public License (Version 3)][gpl3], therefore contributions are encouraged.


## Creating an Issue

If you find a bug (and you don't know how to fix it), have trouble following the installation process or have a question/suggestion about the project, go ahead and create an issue.

### Issue tips

- Check existing issues, both open and closed, for your problem.
- Be clear about what your problem is: what was the expected outcome, what happened instead?
- Include system details like what operating system you’re using and its version.
- Paste error output or logs in your issue or in a [pastebin][].


## Submitting a Pull Request

If you think you can solve the issue or want to [add support for another distro][howto], feel free to make a pull request with the code:

1. Fork and clone the repository.
2. Create a new branch: `git checkout -b my-branch-name`.
3. Make your change and make sure it works.
4. Push the new branch to your fork: `git push -u origin my-branch-name`.
5. Submit a pull request.
6. Wait for your pull request to be reviewed and merged.


### Pull Request tips

- Write a [good commit message][commits].
- Keep your change as focused as possible. If there are multiple changes you would like to make that are not dependent upon each other, consider submitting them as separate pull requests.


## Resources

- [Contributing to Open Source on GitHub][contribos]
- [How to Write a Git Commit Message][commits]


[commits]: http://chris.beams.io/posts/git-commit/
[contribos]: https://guides.github.com/activities/contributing-to-open-source/
[freesoft]: https://en.wikipedia.org/wiki/Free_software
[gpl3]: https://en.wikipedia.org/wiki/GNU_General_Public_License#Version_3
[howto]: howto.html
[pastebin]: https://en.wikipedia.org/wiki/Pastebin
