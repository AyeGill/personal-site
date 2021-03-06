# README

This is the code i use for generating my personal site.
If you should come across it in the wild, please feel free to use it.
However, you may be missing some content which is necessary to make it work:

- `templates/` contains the templates used to generate the site. If this folder somehow went missing, you can try inspecting site.hs to figure out the requirements, but you're probably out of luck.
- `contents/` contains the actual pages for the site, apart from a few standard pages to be described. You can put `.md`, `.tex` or `.html` files here and it should work more or less automagically. A list of everything here will be put on the archive page. If you have subfolders inside this folder, documents inside them will be indexed, but the folder structure is totally ignored.
- `images/` is for any images you want to put on the site. These will be available for other pages, but won't be indexed anywhere.
- `pdfs/` is similar, but a list of everything here will go on the archive page as well.
- `index.md` and `contact.md` is used to generate the index page and contact page (wow!)

The generator will work as long as these things exist (in fact, beyond the templates folder, the folders are not strictly necessary).

The standard way of using this is to build the executable with stack: `stack build`, then build the site with `stack exec site build`.
Using `stack exec site rebuild` will rebuild everything from scratch.

The included .gitignore file will prevent .git from syncing PDFs, and everything put into the `files/` directory.

If you're using NFS to host like me, you can sync by going into `_site/` after building and doing `rsync -r . username@server:`
(The contents of `_site/` should be in the top level folder that NFS exposes to you.)