# EAN

[![Build Status] [status]] [travis]

A minimal EAN and ISBN implementation.

## Installation

```bash
npm install ean
```

## Usage

```javascript
ean = require('ean');

var bad = '9780262011531';
ean.isValid(bad); // false
var digits = bad.split('').slice(0, 12);
ean.checksum(digits); // 2
```

[status]: https://secure.travis-ci.org/hakanensari/ean.png
[travis]: http://travis-ci.org/hakanensari/ean
