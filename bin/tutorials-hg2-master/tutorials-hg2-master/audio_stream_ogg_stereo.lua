-- Stream a mono OGG file with stereo panning

hg = require("harfang")

hg.InputInit()
hg.AudioInit()

src_ref = hg.StreamOGGFileStereo("resources_compiled/sounds/metro_announce.ogg", hg.StereoSourceState(1, hg.SR_Loop)) -- OGG 44.1kHz 16bit mono

angle = 0

while not hg.ReadKeyboard('raw'):Key(hg.K_Escape) do
	angle = angle + hg.time_to_sec_f(hg.TickClock()) * 0.5
	hg.SetSourcePanning(src_ref, math.sin(angle))  -- panning left = -1, panning right = 1
end

hg.AudioShutdown()
hg.InputShutdown()
