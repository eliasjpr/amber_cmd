module Amber::CMD
  class MainCommand < Cli::Supercommand
    command "g", aliased: "generate"

    class Generate < Cli::Command
      class Options
        arg "type", desc: "scaffold, model, controller, migration, job", required: true
        arg "name", desc: "name of resource", required: true
        arg_array "fields", desc: "name:string body:text age:integer draft:bool"
      end

      def run
        template = Template.new(args.name.downcase, ".", args.fields)
        template.generate args.type
      end

      class Help
        caption "# Generate Amber classes"
      end
    end
  end
end
