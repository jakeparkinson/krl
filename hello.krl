ruleset echo {
  meta {
    name "Echo Server"
    description <<
      Echo Server
    >>
    author "Jake Parkinson"
    logging on
  }

  rule hello is active {
    select when echo hello
    send_directive("say") with
      something = "Hello World";
  }
  
  rule message is active {
    select when echo message input re#(.*)# setting(m)
    send_directive("say") with
      something = m;
  }
}

