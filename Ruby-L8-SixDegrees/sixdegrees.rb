# require_relative 'sixtop'
require_relative 'urihacker'
require_relative 'wikiloader'
require_relative 'wikisearcher'



class SixDegrees
  attr_accessor :origin, :target, :base_actor,
                :film_stack, :curr_film, :curr_actors,
                :this_level_actors, :next_level_actors, :degree

  def initialize(base, target)
    @origin = base
    @target = target.add_full_uri
    @base_actor = base.add_full_uri
    @film_stack = load_web_page(@base_actor, :actor)
    @curr_film = @film_stack.pop
    @curr_actors = load_web_page(@base_actor, :film)
    @this_level_actors = [@base_actor]
    @next_level_actors = []
    @degree = 0
  end

  def check_level
    if @curr_actors.include?(@target) || @base_actor == @target
      then puts "\n\n"
        puts "######################################"
        puts "#{@base_actor.strip_out_name} and #{@target.strip_out_name}"
        puts " are at #{@degree} degrees from #{@origin}."
        puts "They were both in #{@curr_film.strip_out_name}."
        puts "######################################"
        puts "\n\n"
    elsif @this_level_actors.empty? && @film_stack.empty?
      then p "Using test1"
        @this_level_actors = (@next_level_actors.uniq).select {|actor| !actor.eql?(@base_actor)}
        @next_level_actors = []
        @base_actor = @this_level_actors.pop
        @film_stack = load_web_page(@base_actor, :actor)
        @curr_film = @film_stack.pop
        @curr_actors = load_web_page(@curr_film, :film)
        @next_level_actors.concat(@curr_actors)
        @degree += 1
        check_level
    elsif (@this_level_actors.first == @base_actor) && @film_stack.empty? && @this_level_actors.size == 1
      then p "Using test2"
        @this_level_actors = (@next_level_actors.uniq).select {|actor| !actor.eql?(@base_actor)}
        @next_level_actors = []
        @base_actor = @this_level_actors.pop
        @film_stack = load_web_page(@base_actor, :actor)
        @curr_film = @film_stack.pop
        @curr_actors = load_web_page(@curr_film, :film)
        @next_level_actors.concat(@curr_actors)
        @degree += 1
        check_level
    elsif !@this_level_actors.empty? && @film_stack.empty?
      then p "Using test3"
        @base_actor = @this_level_actors.pop
        @film_stack = load_web_page(@base_actor, :actor)
        @curr_film = @film_stack.pop
        @curr_actors = load_web_page(@curr_film, :film)
        @next_level_actors.concat(@curr_actors.select{|actor| !actor.eql?(@base_actor)})
        check_level
    elsif @this_level_actors.empty? && !@film_stack.empty?
      then p "Using test4"
        @curr_film = @film_stack.pop
        @curr_actors = load_web_page(@curr_film, :film)
        @next_level_actors.concat(@curr_actors.select{|actor| !actor.eql?(@base_actor)})
        check_level
    elsif !@this_level_actors.empty? && !@film_stack.empty?
      then p "Using test5"
        @curr_film = @film_stack.pop
        @curr_actors = load_web_page(@curr_film, :film)
        @next_level_actors.concat(@curr_actors.select{|actor| !actor.eql?(@base_actor)})
        check_level
    else puts "woops...fall through in check level"
    end
  end
end