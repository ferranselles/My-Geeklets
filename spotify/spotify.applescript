-- Paths
set ArtworkFromSpotify to ((path to home folder) as text) & ".geektool:Spotify:albumArt.tiff"
--Unix versions of the above paths
--set unixArtworkFromSpotify to quoted form of POSIX path of ArtworkFromSpotify

tell application "System Events"
	set myList to (name of every process)
end tell

if myList contains "Spotify" then
	tell application "Spotify"
		if player state is stopped then
			set output to "Stopped"
		else
			set albumart to artwork of current track
			set fileRef to (open for access ArtworkFromSpotify with write permission)
			try
				write albumart to fileRef
				close access fileRef
			on error errorMsg
				try
					close access fileRef
				end try
				error errorMsg
			end try
			
			set trackname to name of current track
			set artistname to artist of current track
			set albumname to album of current track
			if player state is playing then
				set output to trackname & " | " & artistname & " | " & albumname & "new_line" & "Playing on Spotify"
			else if player state is paused then
				set output to trackname & " | " & artistname & " | " & albumname & "new_line" & "Paused"
			end if
			
		end if
	end tell
else
	set output to "Spotify is not running"
end if