# frozen_string_literal: true

def tick(args)
  default_canvas ||= Canvas.new(100, 100, :default_canvas)
  
  args.outputs.primitives << default_canvas.pixels

end

class Canvas
  attr_accessor :width, :height, :name, :pixels

  def initialize(width, height, name)
    @width = width
    @height = height
    @name = name
    @pixels = []

    iter_x = @width

    while iter_x > 0
      @pixels[iter_x] ||= []

      iter_y = @height

      while iter_y > 0
        @pixels[iter_x][iter_y] ||= {primitive_marker: :solid, x: iter_x, y: iter_y, w: 1, h: 1, r: iter_x, g: iter_y, b: 0, a: 255}

        iter_y -= 1
      end

      iter_x -= 1
    end
  end
end
