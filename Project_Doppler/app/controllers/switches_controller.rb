require 'net/tftp'
require 'net/http'
require 'uri'

class SwitchesController < ApplicationController
  # GET /switches
  # GET /switches.json
  def index
    @switches = Switch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @switches }
    end
  end

  # GET /switches/1
  # GET /switches/1.json
  def show
    @switch = Switch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @switch }
    end
  end

  # GET /switches/new
  # GET /switches/new.json
  def new
    @switch = Switch.new
    @templates = Template.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @switch }
    end
  end

  # GET /switches/1/edit
  def edit
    @switch = Switch.find(params[:id])
    @templates = Template.all
  end

  # POST /switches
  # POST /switches.json
  def create
    @switch = Switch.new(params[:switch])
    @templates = Template.all

    respond_to do |format|
      if @switch.save
        format.html { redirect_to switches_path, :notice => 'Switch was successfully created.' }
        format.json { render :json => @switch, :status => :created, :location => @switch }
      else
        format.html { render :action => "new" }
        format.json { render :json => @switch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /switches/1
  # PUT /switches/1.json
  def update
    @switch = Switch.find(params[:id])
    @templates = Template.all

    respond_to do |format|
      if @switch.update_attributes(params[:switch])
        format.html { redirect_to switches_path, :notice => 'Switch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @switch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /switches/1
  # DELETE /switches/1.json
  def destroy
    @switch = Switch.find(params[:id])
    @switch.destroy

    respond_to do |format|
      format.html { redirect_to switches_path, :notice => 'Switch was sucessfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def gen
    @switch = Switch.find(params[:mac])
    @model = params[:model]
    @hostname = params[:hostname]
 
    puts @model

    puts "-%s-" % get_config("tftp_config", "address")

    # t = Net::TFTP.new(get_config("tftp_config", "address"))
    file = nil

    filename = "%s.cfg" % @model 

    puts filename    

    respond_to do |format|
      begin
        # t.getbinaryfile(filename, filename)
        %x[tftp 172.25.187.212 -c get #{filename}]
        file = File.open(filename)   
        
        puts "I havn't failed yet" 

        @template = file.read
        puts @template

        File.delete(filename)

        format.md5 { render :file => "switches/generate.txt.erb" }
      rescue Exception => e
  
        puts "Error: %s" % e.message

        format.md5 { render :file => "switches/fail.txt.erb" }
      end
    end
  end

  def req
    @switch = Switch.find(params[:mac])
    @model = params[:model]
    @hostname = params[:hostname]

    file = nil
    filename = "%s.cfg" % @model
    filename2 = "%s.cfg" % params[:mac]

    respond_to do |format|
     begin
        puts "Begin" 
        %x[tftp 172.25.187.212 -c get #{filename}]
        file = File.open(filename)
        @template = file.read
        File.delete(filename)         
        puts "Got Template"
 
        con = render_to_string :file => "switches/generate.txt.erb"
        puts "Generated config!"        

        file2 = File.open(filename2, "w+")
        file2.puts(con)
        puts "Wrote config file!"
      
        %x[tftp 172.25.187.212 -c put #{filename2} cfg/#{filename2}]
        File.delete(filename2)
         
        @path = "tftp://172.25.187.212/cfg/%s" % filename2
          
        format.md5 { render :file => "switches/cfgpath.txt.erb" }     
      rescue Exception => e
        puts "ERROR: %s" % e.message
        format.md5 { render :file => "switches/fail.txt.erb" }
      end
    end 
  end   
end






















