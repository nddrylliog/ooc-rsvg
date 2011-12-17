use rsvg, cairo

include librsvg/rsvg, librsvg/rsvg-cairo
import cairo/Cairo

Svg: cover from RsvgHandle * {

    /**
     * Load an .svg file from an .svg file
     */
    new: static func (path: String) -> This {
        // who cares about errors? :D
        rsvg_handle_new_from_file(path, null)  
    }

    render: extern(rsvg_handle_render_cairo) func (cr: Context)

    free: extern(rsvg_handle_free) func

}

rsvg_handle_new_from_file: extern func (path: CString, error: Pointer*) -> Svg
