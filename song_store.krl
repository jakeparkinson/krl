ruleset song_store {
  meta {
    name "Song Store"
    description <<
      Songs of Part 3
    >>
    author "Jake Parkinson"
    logging on
    sharing on
		provides songs, hymns, secular_music
  }
  global {
		songs = function() {ent:songs};
		hymns = function() {ent:hymns};
		secular_music = function() {songs.difference(hymns);}
	}
  
  rule collect_songs is active {
    select when explicit sung song re#(.*)# setting(s)
    pre{
     songs = ent:songs || [];
		 songs = songs.append({"song":s, "timestamp":time:now()});
    }
    always {
     set ent:songs songs;
		 log "Songs updated add" + s;
    }

  }
  
  rule collect_hymns is active {
    select when explicit found_hymn hymn re#(.*)# setting(h)
    pre{
     hymns = ent:hymns || [];
		 hymns = hymns.append({"hymn":h, "timestamp":time:now()});
    }
    always {
     set ent:hymns hymns;
		 log "Hymns updated add" + h;
    }
  }
  
    rule clear_songs is active {
    select when song reset
      always{
			set ent:songs [];
			set ent:hymns [];
			log "Cleared both hymns and songs";
      }
  }
  
}
