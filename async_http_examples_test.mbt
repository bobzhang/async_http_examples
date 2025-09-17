///|
async test "x" {
  let v = @http.get("https://www.example.com")
  inspect(v.1)
}
