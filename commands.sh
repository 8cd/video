convert plate.svg -resize 50% -background none -depth 8 plate.png
ffmpeg -i input_video.mp4 -ss 00:00:35 -t 00:00:10 -c:a copy -c:v copy cropped.mp4
ffmpeg -i cropped.mp4 -i plate.png -filter_complex "[0:v][1:v] overlay=10:446:enable='between(t,1,9)'"  -c:a copy plated.mp4
ffmpeg -i plated.mp4 -vf drawtext="fontfile=Arial.ttf:text='Test Text':fontcolor=black:fontsize=36:x=200:y=476:enable='between(t,2,9)" -c:a copy result.mp4
