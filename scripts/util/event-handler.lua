-- Factorio는 하나의 Event에 하나의 Handler만을 허용하므로 여러개의 Handler를 이용하기 위해 이 모듈을 사용함.
-- + event handler 시스템이 return 값을 허용하지 않아서 관련 기능 추가.

__UTIL_EVENT_HANDLERS__ = {};

function UTIL_create_event_handler(event, handler)
  local event_id = event;
  if type(event_id) == "string" then
    event_id = script.get_event_id(event);
  end

  if __UTIL_EVENT_HANDLERS__[event_id] == nil then
    __UTIL_EVENT_HANDLERS__[event_id] = {}

    script.on_event(event, function(_event)
      local handlers = __UTIL_EVENT_HANDLERS__[_event.name];
      for _, h in pairs(handlers) do
        h(_event);
      end
    end)
  end

  table.insert(__UTIL_EVENT_HANDLERS__[event_id], handler);
end