local system = Tiny.processingSystem({
    filter = Tiny.filter('drawSprite')})
  
  function system:onAdd(e)
  
  end
  
  function system:process(e, dt)
    if e.drawSprite.animation then 
      e.drawSprite.animation:update(dt)
    end
  end
  
  return system