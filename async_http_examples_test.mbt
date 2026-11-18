///|
async test "HTTP GET reads the response body" {
  @async.with_task_group() <| group => {
    let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    let payload = "<!doctype html><title>Example Domain</title>"
    group.spawn_bg(no_wait=true) <| () => {
      server.run_forever() <| ((request, _body, conn) => {
        assert_eq(request.path, "/")
        conn.send_response(200, "OK")
        conn.write(payload)
      })
    }
    let (response, body) = @http.get("http://127.0.0.1:\{server.addr.port()}/")
    assert_eq(response.code, 200)
    assert_eq(body.text(), payload)
  }
}
