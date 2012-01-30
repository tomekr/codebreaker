require 'spec_helper'

module Codebreaker
  describe Game do
    # We moved these let methods up a block (from the #start scope) so that
    # they are now in scope for the rest of the describle blocks
    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }

    describe "#start" do

      # Replaced by let which "let() takes a symbol representing a
      # method name and a block, which represents the implementation of
      # that method." that way you don't have to add the tedious and
      # error prone @ symbols to all the variables with begin
      #
      # before(:each) do
      #   @output = double('output').as_null_object
      #   @game = Game.new(@output)
      # end

      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end

      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.start('1234')
      end
    end

    describe "#guess" do
      context "with no matches" do
        it "sends a mark with ''" do
          game.start('1234')
          output.should_receive(:puts).with('')
          game.guess('5555')
        end
      end
    end
  end
end
