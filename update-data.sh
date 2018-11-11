#!/bin/bash

read -r -p "Let's update the DB with sampe set of data ? (y/N)" prompt
prompt=${prompt,,} # tolower
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then

	# issue an HTTP GET request
	curl localhost:8090

	# issue a POST request
	curl -X POST -H 'Content-Type: application/json' -d '{
  		"title": "How do I make a sandwich?",
  		"description"	: "I am trying very hard, but I do not know how to make a delicious sandwich. Can someone help me?"
}' localhost:8090

	curl -X POST -H 'Content-Type: application/json' -d '{
  "title": "What is React?",
  "description": "I have been hearing a lot about React. What is it?"
}' localhost:8090

	# re-issue the GET request
	curl localhost:8090

	# add an answer to first question
	curl -X POST -H 'Content-Type: application/json' -d '{
  "answer": "Just spread butter on the bread, and that is it."
}' localhost:8090/answer/1

fi
