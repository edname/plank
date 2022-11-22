class OrderPdf < Prawn::Document
    def initialize(tools)
        super(top_margin: 20)
        @tools = tools
        tool_names
    end

    def tool_names
        @tools.each do |tool|
            text "#{tool.id} - #{tool.name}"
        end
    end

    def tools_table
        [['ID','Name','Body']]+
        @tools.each do |tool|
            [tool.id, tool.name, tool.body]
        end
    end

end
