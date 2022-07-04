class LinesController < ApplicationController
    def get_line
        _file = 'public/files/line_file.txt'.freeze
        _idx=1
        _params = params.permit(:line_id)
        _line = nil
        IO.foreach(_file) {|x| 
        
        if _idx == _params[:line_id].to_i
            _line = x
            break
        end       
        _idx+=1
        puts _idx
    } if _line > 0
    if _line.present?
        render 200, json: {line: _line}
    else
        render 413, json: {message: "Requested line is beyond the end of the file."}
    end

    
    end
end
