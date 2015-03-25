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
    select when echo message msg_type re#song# input re#(.*)# setting(s)
    send_directive("sing") with
      song = s;
      always {
        log "rule songs with input " + m;
	raise explicit event 'sung' with song = s
      }

  }
}

