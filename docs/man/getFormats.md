

# Functions to retrieve, set or remove formats used for parsing dates.

[**Source code**](https://github.com/eddelbuettel/anytime/tree/master/R/#L)

## Description

The time and date parsing and conversion relies on trying a (given and
fixed) number of timeformats. The format used is the one employed by the
underlying implementation of the Boost date_time library.

## Usage

<pre><code class='language-R'>getFormats()

addFormats(fmt)

removeFormats(fmt)
</code></pre>

## Arguments

<table role="presentation">
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="fmt">fmt</code>
</td>
<td>
A vector of character values in the form understood by Boost date_time
</td>
</tr>
</table>

## Value

Nothing in the case of <code>addFormats</code>; a character vector of
formats in the case of <code>getFormats</code>

## Author(s)

Dirk Eddelbuettel

## See Also

<code>anytime-package</code> and references therein

## Examples

``` r
library("anytime")

  getFormats()
```

     [1] "%Y-%m-%d %H:%M:%S%f"        "%Y-%m-%e %H:%M:%S%f"       
     [3] "%Y-%m-%d %H%M%S%f"          "%Y-%m-%e %H%M%S%f"         
     [5] "%Y/%m/%d %H:%M:%S%f"        "%Y/%m/%e %H:%M:%S%f"       
     [7] "%Y%m%d %H%M%S%f"            "%Y%m%d %H:%M:%S%f"         
     [9] "%m/%d/%Y %H:%M:%S%f"        "%m/%e/%Y %H:%M:%S%f"       
    [11] "%m-%d-%Y %H:%M:%S%f"        "%m-%e-%Y %H:%M:%S%f"       
    [13] "%Y.%m.%d %H:%M:%S%f"        "%Y.%m.%e %H:%M:%S%f"       
    [15] "%Y.%m.%d %H%M%S%f"          "%Y.%m.%e %H%M%S%f"         
    [17] "%Y-%b-%d %H:%M:%S%f"        "%Y-%b-%e %H:%M:%S%f"       
    [19] "%Y/%b/%d %H:%M:%S%f"        "%Y/%b/%e %H:%M:%S%f"       
    [21] "%Y%b%d %H%M%S%F"            "%Y%b%e %H%M%S%F"           
    [23] "%Y%b%d %H:%M:%S%F"          "%Y%b%e %H:%M:%S%F"         
    [25] "%b/%d/%Y %H:%M:%S%f"        "%b/%e/%Y %H:%M:%S%f"       
    [27] "%b-%d-%Y %H:%M:%S%f"        "%b-%e-%Y %H:%M:%S%f"       
    [29] "%d.%b.%Y %H:%M:%S%f"        "%e.%b.%Y %H:%M:%S%f"       
    [31] "%d%b%Y %H%M%S%f"            "%e%b%Y %H%M%S%f"           
    [33] "%d%b%Y %H:%M:%S%f"          "%e%b%Y %H:%M:%S%f"         
    [35] "%d-%b-%Y %H%M%S%f"          "%e-%b-%Y %H%M%S%f"         
    [37] "%d-%b-%Y %H:%M:%S%f"        "%d-%b-%Y %H:%M:%S%f"       
    [39] "%Y-%B-%d %H:%M:%S%f"        "%Y-%B-%e %H:%M:%S%f"       
    [41] "%Y/%B/%d %H:%M:%S%f"        "%Y/%B/%e %H:%M:%S%f"       
    [43] "%Y%B%d %H%M%S%f"            "%Y%B%e %H%M%S%f"           
    [45] "%Y%B%d %H:%M:%S%f"          "%Y%B%e %H:%M:%S%f"         
    [47] "%B/%d/%Y %H:%M:%S%f"        "%B/%e/%Y %H:%M:%S%f"       
    [49] "%B-%d-%Y %H:%M:%S%f"        "%B-%e-%Y %H:%M:%S%f"       
    [51] "%d.%B.%Y %H:%M:%S%f"        "%e.%B.%Y %H:%M:%S%f"       
    [53] "%a %b %d %H:%M:%S%F %Y"     "%a %b %e %H:%M:%S%F %Y"    
    [55] "%a %d %b %Y %H:%M:%S%F"     "%a %e %b %Y %H:%M:%S%F"    
    [57] "%Y-%m-%d %H:%M:%S%Z"        "%Y-%m-%e %H:%M:%S%Z"       
    [59] "%a %b %d %H:%M:%S%F xxx %Y" "%a %b %e %H:%M:%S%F xxx %Y"
    [61] "%Y-%m-%d"                   "%Y-%m-%e"                  
    [63] "%Y%m%d"                     "%Y.%m.%d"                  
    [65] "%Y.%m.%e"                   "%m/%d/%Y"                  
    [67] "%m/%e/%Y"                   "%m-%d-%Y"                  
    [69] "%m-%e-%Y"                   "%Y-%b-%d"                  
    [71] "%Y-%b-%e"                   "%Y%b%d"                    
    [73] "%Y%b%e"                     "%b/%d/%Y"                  
    [75] "%b/%e/%Y"                   "%b-%d-%Y"                  
    [77] "%b-%e-%Y"                   "%d%b%Y"                    
    [79] "%e%b%Y"                     "%d-%b-%Y"                  
    [81] "%e-%b-%Y"                   "%Y-%B-%d"                  
    [83] "%Y-%B-%e"                   "%Y%B%d"                    
    [85] "%Y%B%e"                     "%B/%d/%Y"                  
    [87] "%B/%e/%Y"                   "%B-%d-%Y"                  
    [89] "%B-%e-%Y"                  

``` r
  addFormats(c("%d %b %y",      # two-digit date [not recommended], textual month
               "%a %b %d %Y"))  # weekday weeknumber four-digit year
  removeFormats("%d %b %y")     # remove first
```
