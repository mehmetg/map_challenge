# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140625063049) do

  create_table "public_bicycle_parking_locations", force: true do |t|
    t.string   "COL_LOCATION"
    t.string   "COL_BOS"
    t.string   "COL_ADDR_NUM"
    t.string   "COL_ST_NAME"
    t.string   "COL_ST_TYPE"
    t.string   "COL_ADDRESS"
    t.string   "COL_EAS_ADDRESS"
    t.string   "COL_CNN"
    t.string   "COL_PARCEL"
    t.string   "COL_ZIP"
    t.string   "COL_LAT_EAS"
    t.string   "COL_LONG_EAS"
    t.string   "COL_COORDINATES"
    t.string   "COL_BIKE_PARKING"
    t.string   "COL_PLACEMENT"
    t.string   "COL_RACKS"
    t.string   "COL_SPACES"
    t.string   "COL_MO_INST"
    t.string   "COL_YR_INSTALLED"
    t.string   "COL_INSTALLED_BY"
    t.string   "COL_1_STATUS"
    t.string   "COL_2_STATUS_HIGH_LEVEL"
    t.string   "COL_3_STATUS_DETAIL"
    t.string   "COL_4_STATUS_DESCRIPTION"
    t.string   "COL_5_ACTING_AGENT"
    t.string   "COL_6_ACTION"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "COL_LATITUDE"
    t.float    "COL_LONGITUDE"
  end

end
