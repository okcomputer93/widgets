class ApplicationController < ActionController::Base
  before_action :set_requestid_in_thread_local

  def set_requestid_in_thread_local
    Thread.current.thread_variable_set(
      :request_id, request.request_id
    )
  end

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.request_id
  end
end
