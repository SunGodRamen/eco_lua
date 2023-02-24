local screen2 = hs.screen.findByName("Desktop 2")
hs.http.asyncGet("http://jenkins-server/job/my-build/lastBuild/api/json", nil, function(status, body)
  if status == 200 then
      local json = hs.json.decode(body)
      local buildStatus = json.result
      updateBuildStatus(buildStatus)
  end
end)
function updateBuildStatus(buildStatus)
  if buildStatus == "SUCCESS" then
      canvas[1] = {
          type = "rectangle",
          fillColor = { green = 1 },
          frame = { x = 0, y = 0, w = 200, h = 100 }
      }
  else
      canvas[1] = {
          type = "rectangle",
          fillColor = { red = 1 },
          frame = { x = 0, y = 0, w = 200, h = 100 }
      }
  end
end
hs.drawing.desktopImage:setImage(canvas:imageFromCanvas())
hs.http.asyncGet("http://jenkins-server/job/my-build/lastBuild/api/json", nil, function(status, body)
  if status == 200 then
      local json = hs.json.decode(body)
      local buildStatus = json.result
      updateBuildStatus(buildStatus)
  end
end)
