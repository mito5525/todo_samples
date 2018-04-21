var express = require('express');
var app = express();

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : '127.0.0.1',
  user     : 'root',
  password : '',
  database : 'play_ground'
});

app.get('/users/:user_id/tasks', function (req, res) {
  var query = mysql.format('SELECT * FROM tasks WHERE user_id = ?', [req.params.user_id]);
  connection.query(query, function (error, tasks, fields) {
    if (error) throw error;
    body = {
      "total_count": tasks.length,
      "tasks": tasks.map(function(task) {
        return {
          "id": task.id,
          "title": task.title,
          "category_id": task.category_id
        }
      })
    };
    res.send(body);
  });
});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
