framework 'ScriptingBridge'

class Spotify < Plugin

  requires_version '1.0.3'

  def self.play
    app.play
  end

  def self.pause
    app.pause
  end

  def self.play_pause
    app.playpause
  end

  def self.next
    app.nextTrack
  end

  def self.previous
    app.previousTrack
  end

  def self.current_track
    t = app.currentTrack
    `/usr/local/bin/growlnotify -a Spotify -t "#{t.name}" -m "#{t.artist}\r#{t.album}"`
  end

  def self.app
    SBApplication.applicationWithBundleIdentifier("com.spotify.client")
  end

end

command "Spotify - Next Song" do
  Spotify.next
end

command "Spotify - Previous Song" do
  Spotify.previous
end

command "Spotify - Current Track" do
  Spotify.current_track
end

command "Spotify - Play/Pause" do
  Spotify.play_pause
end
