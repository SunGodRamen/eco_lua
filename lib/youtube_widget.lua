-- Define a function to download and play a YouTube video
function downloadAndPlayYouTubeVideo(url)
  -- Download the video using youtube-dl
  local command = "youtube-dl --output '~/Downloads/%(title)s.%(ext)s' -f 'best[ext=mp4]' " .. url
  hs.execute(command)

  -- Get the downloaded video file path
  local output = hs.execute("youtube-dl --get-filename -o '~/Downloads/%(title)s.%(ext)s' -f 'best[ext=mp4]' " .. url)
  local filePath = hs.fs.pathToAbsolute(output:gsub("%s*$", ""))

  -- Create an HTML5 video element with the downloaded video
  local html = [[
      <html>
      <body style="margin:0;padding:0;">
      <video width="100%%" height="100%%" autoplay>
          <source src="file://%s" type="video/mp4">
      </video>
      </body>
      </html>
  ]]
  local webView = hs.webview.new(hs.geometry.rect(0, 0, 640, 480))
  webView:windowStyle("utility")
  webView:windowTitle("")
  webView:html(string.format(html, filePath))
  webView:show()

  -- Define a hotkey to hide the video window
  local hideVideoHotkey = hs.hotkey.new({"cmd"}, "h", function()
      if webView:isVisible() then
          webView:hide()
      else
          webView:show()
      end
  end)
  hideVideoHotkey:enable()
end
