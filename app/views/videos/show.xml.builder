xml.instruct! :xml, :version=>"1.0"
xml.tag! 'MPD', 'mediaPresentationDuration' => 'PT2M24S' do
end

# http://underpop.online.fr/f/ffmpeg/help/dash-2.htm.gz

# ffmpeg -f concat -i "C:\sites\templates\dom_gl\public\videos\contact.1080p.mp4 | C:\sites\templates\dom_gl\public\videos\contact.720p.mp4 | C:\sites\templates\dom_gl\public\videos\contact.480p.mp4 | C:\sites\templates\dom_gl\public\videos\contact.360p.mp4" -c copy contact.mpd

# ffmpeg -re -i C:\sites\templates\dom_gl\public\videos\contact.txt -map 0 -map 0 -c:a libfdk_aac -c:v libx264 \
# -b:v:0 800k -b:v:1 300k -s:v:1 320x170 -profile:v:1 baseline \
# -profile:v:0 main -bf 1 -keyint_min 120 -g 120 -sc_threshold 0 \
# -b_strategy 0 -ar:a:1 22050 -use_timeline 1 -use_template 1 \
# -window_size 5 -adaptation_sets "id=0,streams=v id=1,streams=a" \
# -f dash C:\sites\templates\dom_gl\public\videos\contact.mpd


# ffmpeg -re -i C:\sites\templates\dom_gl\public\videos\contact.mp4 -map 0 -map 0 -c:a libfdk_aac -c:v libx264 \
# -b:v:0 800k -b:v:1 300k -s:v:1 1920x1080 -profile:v:1 baseline \
# -profile:v:0 main -bf 1 -keyint_min 120 -g 120 -sc_threshold 0 \
# -b_strategy 0 -ar:a:1 22050 -use_timeline 1 -use_template 1 \
# -window_size 5 -adaptation_sets "id=0,streams=v id=1,streams=a" \
# -f dash C:\sites\templates\dom_gl\public\videos\contact.mpd