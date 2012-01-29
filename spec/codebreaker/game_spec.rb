require 'spec_helper'

module Codebreaker
  describe Game do
    describe "#start" do
      let(:output) { double('output').as_null_object }
      let(:game)   { Game.new(output) }

      # Replaced by let which "let( ) takes a symbol representing a
      # method name and a block, which represents the implementation of
      # that method." that way you don't have to add the tedious and
      # error prone @ symbols to all the variables with begin
      #
      # before(:each) do
      #   @output = double('output').as_null_object
      #   @game = Game.new(@output)
      # end

      it "sends a welcome message" do
        @output.should_receive(:puts).with('Welcome to Codebreaker!')
        @game.start
      end

      it "prompts for the first guess" do
        @output.should_receive(:puts).with('Enter guess:')
        @game.start
      end
    end
  end
end
