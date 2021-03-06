require "jar_dependencies"

module Ji2p
  module Package
    module JarDependencies
      extend self

      def require_jar( *args )
        return nil unless Jars.require?
        result = Jars.require_jar( *args )
        if result.is_a? String
          # JAR_DEBUG=1 will now show theses
          Jars.debug { "--- jar coordinate #{args[0..-2].join( ':' )} already loaded with version #{result} - omit version #{args[-1]}" }
          Jars.debug { "    try to load from #{caller.join("\n\t")}" }
          return false
        end
        Jars.debug { "    register #{args.inspect} - #{result == true}" }
        result
      end
    end
  end
end

