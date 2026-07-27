

# Convert to Date (or POSIXct) and assert successful conversion

[**Source code**](https://github.com/eddelbuettel/anytime/tree/master/R/#L)

## Description

Converts its input to type <code>Date</code> (or <code>POSIXct</code>),
and asserts that the content is in fact of suitable type by checking for
remaining <code>NA</code>

## Usage

<pre><code class='language-R'>assertDate(x)

assertTime(x)
</code></pre>

## Arguments

<table role="presentation">
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="x">x</code>
</td>
<td>
An input object suitable for <code>anydate</code> or
<code>anytime</code>
</td>
</tr>
</table>

## Details

Note that these functions <em>just check for <code>NA</code></em> and
cannot check for semantic correctness.

## Value

A vector of <code>Date</code> or <code>POSIXct</code> objects. As a side
effect, an error will be thrown in any of the input was not convertible.

## Author(s)

Dirk Eddelbuettel

## Examples

``` r
library("anytime")

assertDate(c("2001/02/03", "2001-02-03", "20010203"))
assertTime(c("2001/02/03 04:05:06", "2001-02-03  04:05:06", "20010203 040506"))
```
