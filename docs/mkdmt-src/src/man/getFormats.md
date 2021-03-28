## Functions to retrieve, set or remove formats used for parsing dates.

### Description

The time and date parsing and conversion relies on trying a (given and
fixed) number of timeformats. The format used is the one employed by the
underlying implementation of the Boost date\_time library.

### Usage

    getFormats()
    
    addFormats(fmt)
    
    removeFormats(fmt)

### Arguments

| Argument | Description                                                             |
| -------- | ----------------------------------------------------------------------- |
| `fmt`    | A vector of character values in the form understood by Boost date\_time |

### Value

Nothing in the case of `addFormats`; a character vector of formats in
the case of `getFormats`

### Author(s)

Dirk Eddelbuettel

### See Also

`anytime-package` and references therein

### Examples

``` 
  getFormats()
  addFormats(c("%d %b %y",      # two-digit date [not recommended], textual month
               "%a %b %d %Y"))  # weekday weeknumber four-digit year
  removeFormats("%d %b %y")     # remove first
```
