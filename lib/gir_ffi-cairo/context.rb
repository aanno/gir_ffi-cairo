module Cairo
  load_class :Context

  class Context
    
    def self.create target
      ptr = Lib.cairo_create target
      self.wrap ptr
    end

    def arc xc, yc, radius, angle1, angle2
      Lib.cairo_arc self, xc, yc, radius, angle1, angle2
    end

    def fill
      Lib.cairo_fill self
    end

    def get_target
      ptr = Lib.cairo_get_target self
      Surface.wrap ptr
    end

    def set_source_rgba red, green, blue, alpha
      Lib.cairo_set_source_rgba self, red, green, blue, alpha
    end

    # context
    # http://www.cairographics.org/manual/cairo-cairo-t.html
    
    def set_source_rgb red, green, blue
      Lib.cairo_set_source_rgb self, red, green, blue
    end
    
    def destroy
      Lib.cairo_destroy self
    end
    
    # paths
    # http://www.cairographics.org/manual/cairo-Paths.html#cairo-move-to
    
    def line_to x, y
      Lib.cairo_line_to self, x, y
    end
    
    def move_to x, y
      Lib.cairo_move_to self, x, y
    end
    
    # text 
    # http://www.cairographics.org/manual/cairo-text.html
    
    def select_font_face family, slant, weight
      # Lib.cairo_select_font_face self, family, slant, weight
    end
    
    def set_font_size size 
      # Lib.cairo_set_font_size self, size
    end
    
    def show_text utf8
      Lib.cairo_show_text self, utf8
    end

  end

  module Lib
    attach_function :cairo_create, [:pointer], :pointer
    
    attach_function :cairo_get_target, [:pointer], :pointer

    attach_function :cairo_arc,
      [:pointer, :double, :double, :double, :double, :double], :void
    
    attach_function :cairo_fill, [:pointer], :void
    
    attach_function :cairo_set_source_rgba,
      [:pointer, :double, :double, :double, :double], :void
    
    # added by aanno
    
    # context
    # http://www.cairographics.org/manual/cairo-cairo-t.html
    
    attach_function :cairo_set_source_rgb,
      [:pointer, :double, :double, :double], :void
    
    attach_function :cairo_destroy, [:pointer], :void
    
    # paths
    # http://www.cairographics.org/manual/cairo-Paths.html#cairo-move-to
        
    attach_function :cairo_line_to, [:pointer, :double, :double], :void
    
    attach_function :cairo_move_to, [:pointer, :double, :double], :void
    
    # text 
    # http://www.cairographics.org/manual/cairo-text.html
    
    # attach_function :cairo_select_font_face [:pointer, :string, :double, :double], :void
    
    # attach_function :cairo_set_font_size [:pointer, :double], :void
    
    attach_function :cairo_show_text, [:pointer, :string], :void
    
  end
end
