///|
fn main {
  @async.with_event_loop(fn(_) {
    let (_, result) = @http.get("https://www.baidu.com")
    // log.write_string(@bytes_util.ascii_to_string(result))
    println(result[:].ascii_to_string())
  }) catch {
    err => println(err)
  }
}

///|
fn @bytes.View::ascii_to_string(ascii : @bytes.View) -> String {
  let builder = StringBuilder::new()
  for byte in ascii {
    match byte {
      '\n' => builder.write_char('\n')
      '\r' => builder.write_string("\\r")
      '\t' => builder.write_string("\\t")
      32..=126 => builder.write_char(byte.to_int().unsafe_to_char())
      x =>
        builder
        ..write_string("\\x")
        ..write_string(x.to_int().to_string(radix=16))
    }
  }
  builder.to_string()
}
