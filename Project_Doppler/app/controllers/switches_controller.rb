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

  def generate
    @switch = Switch.find(params[:id])
    @model = params[:model]
    @hostname = params[:hostname]
 
    puts @model

    t = Net::TFTP.new(get_config("tftp_config", "address"))
    file = nil

    filename = "%s.md5" % @model 

    puts filename    

    respond_to do |format|
      begin
        t.getbinaryfile(filename, filename)
        file = File.open(filename)   
        @template = file.read

        File.delete(filename)

        @config_file = render_to_string :file => "switches/generate.txt.erb"

        format.html # generate.html.erb
        format.md5 { render :file => "switches/generate.txt.erb" }
      rescue
        File.delete(filename)
        format.html { redirect_to switches_path, :notice => 'Template does not exist.' } 
      end
    end
  end

  def gen
    @switch = Switch.find(params[:mac])
    @model = params[:model]
    @hostname = params[:hostname]
 
    puts @model

    t = Net::TFTP.new(get_config("tftp_config", "address"))
    file = nil

    filename = "%s.md5" % @model 

    puts filename    

    respond_to do |format|
      begin
        t.getbinaryfile(filename, filename)
        file = File.open(filename)   
        @template = file.read

        File.delete(filename)

        @config_file = render_to_string :file => "switches/generate.txt.erb"

        format.md5 { render :file => "switches/generate.txt.erb" }
      rescue
        File.delete(filename)
      end
    end
  end 
end
