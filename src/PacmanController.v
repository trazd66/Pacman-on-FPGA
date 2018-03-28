module PacmanController(
	input enable,
<<<<<<< HEAD
   input move_left,
   input move_up,
=======
  input move_left,
  input move_up,
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683
	input reset,
	input clock,
	input able_to_move,

<<<<<<< HEAD
   input [7:0] pacman_x_init,
   input [7:0] pacman_y_init,

	input [2:0] curr_sprite_data,

	output reg able_to_damage,
	output reg dir_change,
=======
  input [7:0] pacman_x_init,
  input [7:0] pacman_y_init,

	input [2:0] curr_sprite_data,

	output able_to_damage,
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683

	//current location
	output reg [7:0] pacman_x_coordinate,
	output reg [7:0] pacman_y_coordinate,

	//location it is trying to move to
	output reg [7:0] target_x_coordinate,
	output reg [7:0] target_y_coordinate);


<<<<<<< HEAD
	reg enable_counter;
	reg reset_counter;
=======
	wire enable_counter;
	wire reset_counter;
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683


	reg [27:0] counter_time;

	reg curr_moving_x;
	reg curr_moving_y;
	reg curr_dir;//current moving direction, 0 is up/down , 1 is sideways

<<<<<<< HEAD
	// Location it is trying to move to
	reg [7:0] target_x;
	reg [7:0] target_y;
	
//	Counter invinsible_counter(
//		.interval(4'd5),
//		//5seconds of invinsible time after consuming the big white blob
//		.reset(reset_counter),
//		.en(enable_counter),
//		.clock_50(clock),
//		.cur_time(counter_time));

	initial
	begin
		reset_counter <= 1'b1;
		enable_counter <= 1'b0;
		able_to_damage <= 1'b1;

		pacman_x_coordinate <= pacman_x_init;
		pacman_y_coordinate <= pacman_y_init;

		target_x <= pacman_x_init;
		target_y <= pacman_y_init;
		
		curr_moving_x <= move_left;
		curr_moving_y <= move_up;
		curr_dir <= 1'b0;//defualt moving up/down
		dir_change = 1'b0;
	end

	always @ ( posedge clock ) 
	begin
		if(reset == 1'b1)
      begin
			//initializing counter
			reset_counter <= 1'b1;
			enable_counter <= 1'b0;
			able_to_damage <= 1'b1;

			pacman_x_coordinate <= pacman_x_init;
			pacman_y_coordinate <= pacman_y_init;


			target_x <= pacman_x_init;
			target_y <= pacman_y_init;
		
			
			curr_moving_x <= move_left;
			curr_moving_y <= move_up;
			curr_dir <= 1'b0;//defualt moving up/down
      end
		else if(enable == 1'b1)      
		begin
			if(able_to_move)
				begin
					pacman_x_coordinate <= target_x;
					pacman_y_coordinate <= target_y;
				end
			dir_change <= 1'b0;
			//currently on the big blob
			if(curr_sprite_data == 3'b001)
			begin
				enable_counter = 1'b1;//enable invinsible
				if(counter_time < 4'd5)
					able_to_damage = 1'b0;//invinsible
				else
				begin
					reset_counter = 1'b1;
					enable_counter = 1'b0;
					able_to_damage = 1'b1;
				end
			end
			
			//detect which direction to move from the changing of swithes
			if(curr_moving_x != move_left)
			begin
				curr_moving_x <= move_left;
				curr_dir <= 1'b1;
				dir_change <= 1'b1;
			end
			else if (curr_moving_y != move_up)
			begin
				curr_moving_y <= move_up;
				curr_dir <= 1'b0;
				dir_change <= 1'b1;
			end
		end
		//moving
		if(curr_dir == 1'b0 && move_up == 1'b1)
			target_y <= target_y + 1'b1;
		else if (curr_dir == 1'b0 && move_up == 1'b0)
			target_y <= target_y - 1'b1;
		else if (curr_dir == 1'b1 && move_left == 1'b0)
			target_x <= target_x - 1'b1;
		else if (curr_dir == 1'b1 && move_left == 1'b1)
			target_x <= target_x + 1'b1;

			target_x_coordinate <= target_x;
			target_y_coordinate <= target_y;
	end

endmodule
=======
	Counter invinsible_counter(
		.interval(4'd5),
		//5seconds of invinsible time after consuming the big white blob
		.reset(reset_counter),
		.en(enable_counter),
		.clock_50(clock),
		.cur_time(counter_time));

  always @ ( posedge clock ) begin
    if(reset == 1'b1)
      begin
				//initializing counter
				reset_counter = 1'b1;
				enable_counter = 1'b0;
				able_to_damage = 1'b1;

				pacman_x_coordinate <= pacman_x_init;
				pacman_y_coordinate <= pacman_y_init;

				curr_moving_x <= move_left;
				curr_moving_y <= move_up;
				curr_dir = 1'b0;//defualt moving up/down
      end
    else if(enable == 1'b1)      begin

				if(curr_sprite_data == 3'b001)
				//currently on the big blob
					begin
					enable_counter = 1'b1;//enable invinsible
					if(counter_time < 4'd5)
							able_to_damage = 1'b0;//invinsible
					else
						begin
							reset_counter = 1'b1;
							enable_counter = 1'b0;
							able_to_damage = 1'b1;
						end
					end
					//detect which direction to move from the changing of swithes
					if(curr_moving_x != move_left)
						begin
							curr_moving_x <= move_left;
							curr_dir <= 1'b1;
						end
					else if (curr_moving_y != move_up)
						begin
							curr_moving_y <= move_up;
							curr_dir <= 1'b0;
						end
					end

					//moving
				if(curr_dir == 1'b0 && move_up == 1'b1)
					target_y_coordinate <= pacman_y_coordinate + 1'b1;
				else if (curr_dir == 1'b0 && move_up == 1'b0)
					target_y_coordinate <= pacman_y_coordinate - 1'b1;
				else if (curr_dir == 1'b1 && move_left == 1'b0)
					target_x_coordinate <= pacman_x_coordinate - 1'b1;
				else if (curr_dir == 1'b1 && move_left == 1'b1)
					target_x_coordinate <= pacman_x_coordinate + 1'b1;
			end
  	end

		always @ ( posedge clock ) begin
			if (able_to_move)
				begin
					pacman_x_coordinate <= target_x_coordinate;
					pacman_y_coordinate <= target_y_coordinate;
				end
		end
  endmodule
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683



	module col_datapath (
		input clock,
		input reset,

		input read_curr_sprite,
		input write_curr_to_map,
		input read_target_sprite,
<<<<<<< HEAD
		input collision_check,
=======
		input write_target_to_map,
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683

		input [2:0] target_sprite,

		//current location
		input [7:0] pacman_x_coordinate_in,
		input [7:0] pacman_y_coordinate_in,
<<<<<<< HEAD
		
		
		input [7:0] target_x_coordinate,
		input [7:0] target_y_coordinate,

		//current location
		output reg [4:0] pacman_x_map,
		output reg [4:0] pacman_y_map,
		
		output reg [2:0] map_black_tile,
		
		output reg readwrite,
		output reg able_to_move,
		output reg is_ready);
		
		
		initial begin
			map_black_tile = 3'd0;
			able_to_move = 1'b0;
			readwrite = 1'b0;
			is_ready = 1'b0;
		end
		
=======

		//current location
		output reg [7:0] pacman_x_coordinate_out,
		output reg [7:0] pacman_y_coordinate_out,

		output readwrite,
		output able_to_move);

>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683
		always @ ( posedge clock ) begin
			if(read_curr_sprite)
				begin
					readwrite = 1'b0;
<<<<<<< HEAD
					pacman_x_map <= pacman_x_coordinate_in / 5'd5;
					pacman_y_map <= pacman_y_coordinate_in / 5'd5;
				end
			else if(write_curr_to_map)
				begin
					readwrite = 1'b1;
					pacman_x_map <= pacman_x_coordinate_in / 5'd5;
					pacman_y_map <= pacman_y_coordinate_in / 5'd5;
				end
			else if(read_target_sprite)
				begin
					readwrite = 1'b0;
					pacman_x_map <= target_x_coordinate / 5'd5;
					pacman_y_map <= target_x_coordinate / 5'd5;
				end
			else if(collision_check)
				begin
					is_ready = 1'b1;
					if (target_sprite != 3'b011)
						able_to_move = 1'b1;
					else
						able_to_move = 1'b0;
				end
=======
					pacman_x_coordinate_out <= pacman_x_coordinate_in;
					pacman_y_coordinate_out <= pacman_y_coordinate_in;
				end
			else if(write_curr_to_map)
			else if(read_target_sprite)
			else if(write_target_to_map)
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683
		end




	endmodule // col_datapath


	module col_control (
		input clk,
		input resetn,
<<<<<<< HEAD
		input dir_change,
		output reg read_curr_sprite,
		output reg write_curr_to_map,
		output reg read_target_sprite,
		output reg collision_check);
=======
		output read_curr_sprite,
		output write_curr_to_map,
		output read_target_sprite,
		output write_target_to_map);
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683

	  reg current_state, next_state;

		localparam  S_READ_CURR_SPRITE   = 1'd0,
<<<<<<< HEAD
	  					S_WRITE_CURR_TO_MAP  = 1'd1,
						S_READ_TARGET_SPRITE = 1'd2,
						S_WRITE_TARGET_TO_MAP = 1'd3;


	  // Next state logic aka our state table
	  always@(posedge clk)
	  begin: state_table
			case (current_state)
				S_READ_CURR_SPRITE: next_state = S_WRITE_CURR_TO_MAP; // Loop in current state until value is input
				S_WRITE_CURR_TO_MAP: next_state = S_READ_TARGET_SPRITE;
				S_READ_TARGET_SPRITE: next_state = S_WRITE_TARGET_TO_MAP;
				S_WRITE_TARGET_TO_MAP: next_state = S_READ_CURR_SPRITE;
=======
	  						S_WRITE_CURR_TO_MAP  = 1'd1,
								S_READ_TARGET_SPRITE = 1'd2,
								S_WRITE_TARGET_TO_MAP = 1'd3;


	  // Next state logic aka our state table
	  always@(*)
	  begin: state_table
	  				case (current_state)
	  						S_READ_CURR_SPRITE: next_state = S_WRITE_CURR_TO_MAP; // Loop in current state until value is input
	              S_WRITE_CURR_TO_MAP: next_state = S_READ_TARGET_SPRITE;
								S_READ_TARGET_SPRITE: next_state = S_WRITE_TARGET_TO_MAP
								S_WRITE_TARGET_TO_MAP: next_state = S_READ_CURR_SPRITE;
	      				default:     next_state = S_READ_MEM;
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683
	  		endcase
	  end // state_table


	  // Output logic aka all of our datapath control signals
<<<<<<< HEAD
	  always @(posedge clk)
	  begin: enable_signals
	  		// By default make all our signals 0
			read_curr_sprite <= 1'b0;
			write_curr_to_map <= 1'b0;
			read_target_sprite <= 1'b0;
			collision_check <= 1'b0;

	  		case (current_state)
				S_READ_CURR_SPRITE :
					begin
						read_curr_sprite <= 1'b1;
						write_curr_to_map <= 1'b0;
						read_target_sprite <= 1'b0;
						collision_check <= 1'b0;
					end
				S_WRITE_CURR_TO_MAP :
					begin
						read_curr_sprite <= 1'b0;
						write_curr_to_map <= 1'b1;
						read_target_sprite <= 1'b0;
						collision_check <= 1'b0;
					end
				S_READ_TARGET_SPRITE:
					begin
						read_curr_sprite <= 1'b0;
						write_curr_to_map <= 1'b0;
						read_target_sprite <= 1'b1;
						collision_check <= 1'b0;
					end
				S_WRITE_TARGET_TO_MAP:
					begin
						read_curr_sprite <= 1'b0;
						write_curr_to_map <= 1'b0;
						read_target_sprite <= 1'b0;
						collision_check <= 1'b1;
					end
			endcase
=======
	  always @(*)
	  begin: enable_signals
	  		// By default make all our signals 0
				read_curr_sprite = 1'b0;
				write_curr_to_map = 1'b0;
				read_target_sprite = 1'b0;
				write_target_to_map = = 1'b0;

	  		case (current_state)
	            S_READ_CURR_SPRITE :
								begin
									read_curr_sprite = 1'b1;
									write_curr_to_map = 1'b0;
									read_target_sprite = 1'b0;
									write_target_to_map = = 1'b0;
								end
	            S_WRITE_CURR_TO_MAP :
								begin
									read_curr_sprite = 1'b0;
									write_curr_to_map = 1'b1;
									read_target_sprite = 1'b0;
									write_target_to_map = = 1'b0;
								end
							S_READ_TARGET_SPRITE:
								begin
									read_curr_sprite = 1'b0;
									write_curr_to_map = 1'b0;
									read_target_sprite = 1'b1;
									write_target_to_map = = 1'b0;
								end
							S_WRITE_TARGET_TO_MAP:
								begin
									read_curr_sprite = 1'b0;
									write_curr_to_map = 1'b0;
									read_target_sprite = 1'b0;
									write_target_to_map = = 1'b1;
								end
	  	endcase
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683
	  end // enable_signals

	  // current_state registers
	  always@(posedge clk)
	  begin: state_FFs
<<<<<<< HEAD
	  		if(!resetn | dir_change)
				current_state <= S_READ_CURR_SPRITE;
	  		else
				current_state <= next_state;
=======
	  		if(!resetn)
	  				current_state <= S_READ_MEM;
	  		else
	  				current_state <= next_state;
>>>>>>> a64bc9a69dfa0067b3d81087ab65f90b89e79683
	  end // state_FFS


	endmodule // control
