module Cairo
  load_class :Surface

  class Surface
    # TODO: Add overrides
    
    # context
    # http://www.cairographics.org/manual/cairo-cairo-t.html
    
   def destroy
      Lib.cairo_surface_destroy self
    end
    
    alias :surface_destroy :destroy
    
    # PNG support
    # http://cairographics.org/manual/cairo-PNG-Support.html
    
    def write_to_png filename
      Lib.cairo_surface_write_to_png self, filename
    end
    
  end

  module Lib
    # TODO: Attach functions
    #
    # attach_function :cairo_image_surface_create, [Cairo::Format, :int, :int], :pointer
    
    # context
    # http://www.cairographics.org/manual/cairo-cairo-t.html
    
    attach_function :cairo_surface_destroy, [:pointer], :void
    
    # PNG support
    # http://cairographics.org/manual/cairo-PNG-Support.html
    
    attach_function :cairo_surface_write_to_png, [:pointer, :string], :void
    
  end
end
