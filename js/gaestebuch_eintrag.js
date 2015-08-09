function send_entry (url) {
  var author = document.getElementById("author").value;
  var email = document.getElementById("email").value;
  var url = document.getElementById("url").value;
  var comment = document.getElementById("comment").value;
  var time = new Date();

  window.alert(author + " " + email + " " + url + " " + comment + " " + time.toISOString())
}
