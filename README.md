# Parameter scan

<sup>Latest version: v0.1.1</sup> <!-- x-release-please-version -->

To run the continuous compiler, use the command

```bash
latexmk -cd -pvc -pdf templateV5.tex
```

You clean up files with

```bash
latexmk -c
```

`tectonic` also works in place of `latexmk`:

```bash
tectonic templateV5.tex
```
