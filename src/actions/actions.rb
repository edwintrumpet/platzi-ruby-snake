module Actions
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calc_next_position(state)
        if position_is_valid?(state, next_position)
            move_snake_to(state, next_position)
        else
            end_game(state)
        end
        # verificar que la siguiente casilla sea válida
        # si no es válida terminamos el juego
        # si es válida movemos la serpiente
    end

    private
    
    def calc_next_position(state)
        curr_position = state.snake.positions.first
        case state.next_direction
        when UP
            return Model::Coord.new(curr_position.row - 1, curr_position.col)
        end
        when RIGHT
            return Model::Coord.new(curr_position.row, curr_position.col + 1)
        end
        when DOWN
            return Model::Coord.new(curr_position.row + 1, curr_position.col)
        end
        when LEFT
            return Model::Coord.new(curr_position.row, curr_position.col - 1)
        end
    end

    def position_is_valid?(state, position)
        is_invalid = ((position.row >= state.grid.rows || position.row < 0) ||
            (position.col >= state.grid.cols || position.col < 0))
        return false if is_invalid
        return !(state.snake.positions.include? position)
    end

    def move_snake_to(snake, position)
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state
    end

    def end_game(state)
        state.game_finished = true
        state
    end
end