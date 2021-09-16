module TaxiMeter(
input clock,
input vip_enable,
input moving,
input reset_income,
input seat_0, seat_1, seat_2, seat_3,
input rainy_weather,
output reg [13:0] s0cost, s1cost, s2cost, s3cost,
output reg [13:0]  vip_cost,
output reg [13:0]  overall_income
);


initial begin
	s0cost = 0;
	s1cost = 0;
	s2cost = 0;
	s3cost = 0;
	vip_cost = 0;
	overall_income = 0;
end

always @(posedge clock) begin
	if(vip_enable == 0)
		vip_cost = 0;
	if(seat_0 == 0)
		s0cost = 0;
	if(seat_1 == 0)
		s1cost = 0;
	if(seat_2 == 0)
		s2cost = 0;
	if(seat_3 == 0)
		s3cost = 0;
	if(vip_enable == 1) begin
		if(vip_cost == 0) begin
			if(rainy_weather == 1) begin
				vip_cost = 4'd15;
				overall_income = overall_income + 4'd15;
			end else begin
				vip_cost = 4'd10;
				overall_income = overall_income + 4'd10;
			end 
		end
		s0cost = 0;
		s1cost = 0;
		s2cost = 0;
		s3cost = 0;
	end else begin
		if(seat_0 == 1) begin
			if(s0cost == 0) begin
				if(rainy_weather == 1) begin 
					s0cost = 4'd15;
					overall_income = overall_income + 4'd15;
				end else begin 
					s0cost = 4'd10;
					overall_income = overall_income + 4'd10;
				end
			end
		end
		if(seat_1 == 1) begin
			if(s1cost == 0) begin
				if(rainy_weather == 1) begin 
					s1cost = 4'd15;
					overall_income = overall_income + 4'd15;
				end else begin 
					s1cost = 4'd10;
					overall_income = overall_income + 4'd10;
				end
			end
		end
		if(seat_2 == 1) begin
			if(s2cost == 0) begin
				if(rainy_weather == 1) begin 
					s2cost = 4'd15;
					overall_income = overall_income + 4'd15;
				end else begin 
					s2cost = 4'd10;
					overall_income = overall_income + 4'd10;
				end
			end
		end
		if(seat_3 == 1) begin
			if(s3cost == 0) begin
				if(rainy_weather == 1) begin 
					s3cost = 4'd15;
					overall_income = overall_income + 4'd15;
				end else begin 
					s3cost = 4'd10;
					overall_income = overall_income + 4'd10;
				end
			end
		end
	end
	if(rainy_weather == 1) begin
		if(vip_enable == 1) begin 
			if(moving == 1) begin
				vip_cost = vip_cost + 5'd19;
				overall_income = overall_income + 5'd19;
			end else begin
				vip_cost = vip_cost + 3'd6;
				overall_income = overall_income + 3'd6;
			end
		end else begin 
			if(moving == 1) begin
				if(seat_0 == 1) begin
					s0cost = s0cost + 4'd10;
					overall_income = overall_income + 4'd10;
				end
				if(seat_1 == 1) begin
					s1cost = s1cost + 4'd10;
					overall_income = overall_income + 4'd10;
				end
				if(seat_2 == 1) begin
					s2cost = s2cost + 4'd10;
					overall_income = overall_income + 4'd10;
				end
				if(seat_3 == 1) begin
					s3cost = s3cost + 4'd10;
					overall_income = overall_income + 4'd10;
				end	 
			end else begin
				if(seat_0 == 1) begin
					s0cost = s0cost + 3'd6;
					overall_income = overall_income + 3'd6;
				end
				if(seat_1 == 1) begin
					s1cost = s1cost + 3'd6;
					overall_income = overall_income + 3'd6;
				end
				if(seat_2 == 1) begin
					s2cost = s2cost + 3'd6;
					overall_income = overall_income + 3'd6;
				end
				if(seat_3 == 1) begin
					s3cost = s3cost + 3'd6;
					overall_income = overall_income + 3'd6;
				end
			end
		end
	end else begin 
		if(vip_enable == 1) begin 
			if(moving == 1) begin
				vip_cost = vip_cost + 5'd16;
				overall_income = overall_income + 5'd16;
			end else begin
				vip_cost = vip_cost + 3'd5;
				overall_income = overall_income + 3'd5;
			end
		end else begin 
			if(moving == 1) begin
				if(seat_0 == 1) begin
					s0cost = s0cost + 4'd10;
					overall_income = overall_income + 4'd10;
				end
				if(seat_1 == 1) begin
					s1cost = s1cost + 4'd8;
					overall_income = overall_income + 4'd8;
				end
				if(seat_2 == 1) begin
					s2cost = s2cost + 4'd8;
					overall_income = overall_income + 4'd8;
				end
				if(seat_3 == 1) begin
					s3cost = s3cost + 4'd8;
					overall_income = overall_income + 4'd8;
				end	 
			end else begin
				if(seat_0 == 1) begin
					s0cost = s0cost + 3'd6;
					overall_income = overall_income + 3'd6;
				end
				if(seat_1 == 1) begin
					s1cost = s1cost + 3'd5;
					overall_income = overall_income + 3'd5;
				end
				if(seat_2 == 1) begin
					s2cost = s2cost + 3'd5;
					overall_income = overall_income + 3'd5;
				end
				if(seat_3 == 1) begin
					s3cost = s3cost + 3'd5;
					overall_income = overall_income + 3'd5;
				end
			end
		end
	end
	if(overall_income == 14'd10000)
		overall_income = 0;
end

always @(posedge reset_income) begin
	overall_income = 0;
end


endmodule
