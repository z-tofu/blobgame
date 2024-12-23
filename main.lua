_G.love = require("love")

function love.load()
    _G.number = 0
    _G.blob = {}
    blob.x = 0
    blob.y = 450
    blob.speed = 200
    blob.gravity = 500
    blob.yvel = 0
    blob.ground = blob.y
    blob.yvel = 0
    blob.jump_height = - 300
    blob.gravity = -500

    _G.platform = {}
    platform.y = 500
    platform.x = 0



    _G.grounded = false
end

function love.update(dt)
    number = number + 1

    if love.keyboard.isDown("d") then
        if blob.x < (love.graphics.getWidth() - 50) then
            blob.x = blob.x + (blob.speed * dt)
        end
    elseif love.keyboard.isDown("a") then 
        if blob.x > 0 then
            blob.x = blob.x - (blob.speed * dt)
        end
    end

    if love.keyboard.isDown("space") then
        if blob.yvel == 0 then
            blob.yvel = blob.jump_height
        end
    end

    if blob.yvel ~= 0 then
        blob.y = blob.y + blob.yvel * dt
        blob.yvel = blob.yvel - blob.gravity * dt
    end

    if blob.y > blob.ground then
        blob.yvel = 0
        blob.y = blob.ground
    end

end

function love.draw()
    love.graphics.print(number)
    love.graphics.setColor(247 / 255, 126 / 255, 231/ 255)
    love.graphics.rectangle("fill", blob.x, blob.y, 50, 50)

    love.graphics.setColor(70 / 255, 158 / 255, 6 / 255)
    love.graphics.rectangle("fill", 0, 500, 800, 100)

end