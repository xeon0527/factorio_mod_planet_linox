local bootstrap = require("scripts.drv.bootstrap")
local power_converter = require("scripts.drv.linox.installation.power-converter")
local inductor = require("scripts.drv.simulation.inductor")
local surface_facility = require("scripts.svc.surface.linox-facility")

local voltage = 1000.0;

local function __get_total_consume(surface)
  local consume = 0.0
  local stat = surface.global_electric_network_statistics;
  if stat then
    for name, _ in pairs(stat.input_counts) do
      --if not is_buggy
      consume = consume + stat.get_flow_count {
        precision_index = defines.flow_precision_index.five_seconds,
        category = "input",
        count = false,
        sample_index = 1,
        name  = name,
      }
    end
  end
  return consume
end

bootstrap.create_tick_handler(function()
  local surface = surface_facility.get()
  if surface then
    local reactive_power = surface.find_entity("linox-hidden_reactive-power", {0,0})
    if not reactive_power or reactive_power.force.name ~= "player" then return end

    local enable_control  = power_converter.get_signal(power_converter.input_type.enable_control);
    local turn_on         = power_converter.get_signal(power_converter.input_type.turn_on);

    inductor.enable(enable_control ~= 0 and reactive_power);
    if turn_on > 0 then
      inductor.apply_voltage(voltage);
    elseif turn_on < 0 then
        inductor.apply_voltage(-voltage);
    else
      inductor.apply_voltage(0.0);
    end

    inductor.tick();

    -- Inductor의 Tick당 Power Output을 계산
    local inductor_tick_output = (inductor.current / 60.0) * voltage;
    --if inductor_tick_output < 0.0 then inductor_tick_output = 0.0 end

    -- reactive power의 값을 total consume에서 제외함.
    local data = __get_total_consume(surface)
    local current_tick_consume = data - reactive_power.power_usage;

    -- 실제 total consume과 inductor 출력의 오차만큼 reactive power를 추가. 오차를 보정하지 않으면 최대 2배의 소비전력이 발생.
    -- 그러나 inductor 모듈의 전기 사양 상 1GJ을 넘는 출력은 낼 수 없음.
    local reactive_power_usage = math.abs(current_tick_consume - inductor_tick_output)
    if reactive_power_usage > current_tick_consume then
      reactive_power_usage = current_tick_consume
    end
    
    local pc_entity = power_converter.get_power_converter()
    if enable_control ~= 0 then
      reactive_power.power_usage = reactive_power_usage --math.abs(current_tick_consume - inductor_tick_output);
      pc_entity.electric_buffer_size = (5 * 1000 * 1000 * 1000)
    else
      reactive_power.power_usage = 0
      pc_entity.electric_buffer_size = 0
    end

    power_converter.set_signal(power_converter.output_type.output_power, 1, inductor.current * voltage);
    power_converter.set_signal(power_converter.output_type.current_power, 2, math.floor(current_tick_consume * 60.0));-- / voltage));
  end
end)