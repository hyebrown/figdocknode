var request = require('request');

request('http://docker1:8000',function(error,response,body){
	if(!error && response.statusCode === 200){
		console.log("docker2: response from docker1 [" + body + "]")
	}
	else {
		console.log("error: [" + error + "] something has gone awry - perhaps the server container is down?")
	}
})

