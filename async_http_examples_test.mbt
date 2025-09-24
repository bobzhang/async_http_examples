///|
async test "x" {
  let v = @http.get("https://www.example.com")
  inspect(
    v.1.text()[0:200],
    content=(
      #|<!doctype html>
      #|<html>
      #|<head>
      #|    <title>Example Domain</title>
      #|
      #|    <meta charset="utf-8" />
      #|    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
      #|    <meta name="viewport" conten
    ),
  )
}
