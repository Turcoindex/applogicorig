# encoding: UTF-8
# frozen_string_literal: true

module APIv1
      module NamedParams
        extend ::Grape::API::Helpers
  
        params :filters do
          optional :limit,     type: Integer
          optional :timestamp, type: Integer, desc: "An integer represents the seconds elapsed since Unix epoch. If set, only trades executed before the time will be returned."
          optional :from,      type: Integer, regexp: /^[0-9]*$/, allow_blank: false, desc: "Trade id. If set, only trades created after the trade will be returned."
          optional :to,        type: Integer, regexp: /^[0-9]*$/, allow_blank: false, desc: "Trade id. If set, only trades created before the trade will be returned."
          optional :order_by,  type: String, values: %w(asc desc), default: 'desc', desc: "If set, returned trades will be sorted in specific order, default to 'desc'."
        end
      end
  end