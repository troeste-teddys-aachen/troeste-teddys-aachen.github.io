function send_entry () {
  var author = $("#author").val();
  var email = $("#email").val();
  var url = $("#url").val();
  var comment = $("#comment").val();
  var time = new Date();

  var body = "{'title' : 'New Comment', 'body': "+"'---\nlayout: post\ntitle:\ndate: "+time.toISOString()+"\nauthor: "+author+"\ncategory: gast\n---\n\n"+comment+"\nURL: "+url+"\nEmail: "+email+"'\n}";

  window.alert(body)
  $.post(
    "https://api.github.com/repos/tammoippen/troeste_teddies/issues",
    body,
    function(data) {
      alert("Response: " + data);
    }
    )
}
