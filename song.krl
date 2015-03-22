ruleset see_songs {
  meta {
    name "Songs"
    description <<
      Songs of Part 1
    >>
    author "Jake Parkinson"
    logging on
  }
  
  rule songs is active {
    select when echo message input re#(.*)# setting(s)
    send_directive("sing") with
      song = s;
  }
}

