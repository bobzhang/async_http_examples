///|
async fn main {
  let (_, result) = @http.get("https://www.baidu.com")
  // FIXME: www.google.com not work
  // log.write_string(@bytes_util.ascii_to_string(result))
  println(result.text())
}
