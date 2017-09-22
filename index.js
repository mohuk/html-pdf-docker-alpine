var fs = require('fs');
var pdf = require('html-pdf');
var html = fs.readFileSync('./businesscard.html', 'utf8');
var options = {
	phantomPath: '/usr/bin/phantomjs'
};

pdf.create(html, options).toFile('./businesscard.pdf', function(err, res) {
	if (err) return console.log(err);
	console.log(res); // { filename: '/app/businesscard.pdf' }
});
