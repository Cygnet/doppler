class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches, :id => false, :force => true do |t|
      t.string :env
      t.string :row
      t.string :rack
      t.string :vendor
      t.string :model
      t.string :mac_add, :primary => true
      t.string :hostname
      t.string :lb_ip
      t.string :int_vlan_10_ip
      t.string :uplink_1_ip
      t.string :uplink_2_ip
      t.string :next_hop_ip_1
      t.string :next_hop_ip_2

      t.timestamps
    end
  end
end
