# frozen_string_literal: true

def tick(args)

  args.state.default_canvas ||= Canvas.new(100, 100, :default_canvas, args)
  
  args.render_target(:default_render_target).clear_before_render = false
  args.outputs.sprites << {x: 100, y: 100, w: 100, h: 100, path: :default_render_target, source_x: 0, source_y: 0, source_w: 100, source_h: 100}

end

class Canvas
  attr_accessor :width, :height, :name, :pixels

  def initialize(width, height, name, args)
    @width = width
    @height = height
    @name = name
    @pixels = []

    iter_x = @width

    while iter_x > 0
      @pixels[iter_x] ||= []

      iter_y = @height

      while iter_y > 0
        @pixels[iter_x][iter_y] = {x: iter_x, y: iter_y, w: 1, h: 1, r: iter_x, g: iter_y, b: 0, a: 255, primitive_marker: :solid}
        args.render_target(:default_render_target).primitives << @pixels[iter_x][iter_y]

        iter_y -= 1
      end

      iter_x -= 1
    end
  end
end
