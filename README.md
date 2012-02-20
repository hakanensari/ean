# EAN

[![Build Status] [status]] [travis]

A minimal EAN and ISBN implementation.

## Installation

```bash
npm install ean
```

## Usage

```coffee
ean = require 'ean'

ean.isValid  '9780262011531' # false
ean.checksum '978026201153'  # 2

[status]: https://secure.travis-ci.org/hakanensari/ean.png
[travis]: http://travis-ci.org/hakanensari/ean
