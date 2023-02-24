-- Define a function to convert text to speech
local function textToSpeech(text)
  hs.speech.new():speak(text)
end

-- Define a key binding to trigger the text to speech function
hs.hotkey.bind({"cmd", "ctrl"}, "s", function()
  local text = hs.pasteboard.getContents()
  if text then
      textToSpeech(text)
  end
end)
