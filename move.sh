#!/bin/bash
echo "move todo.js"
mv ~/Downloads/Todo.json ./ 
meteor-kitchen Todo.json todo
