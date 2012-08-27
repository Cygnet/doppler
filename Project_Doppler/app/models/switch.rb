class Switch < ActiveRecord::Base
  attr_accessible :env, :hostname, :int_vlan_10_ip, :lb_ip, :mac_add, :model, :next_hop_ip_1, :next_hop_ip_2, :rack, :row, :uplink_1_ip, :uplink_2_ip, :vendor, :template_id
  self.primary_key = "mac_add"

  validates :mac_add, :presence => true,
                      :uniqueness => true
end
