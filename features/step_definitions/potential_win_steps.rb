
Then /^the potential Win! for (\S) should be:$/ do |player, data|
  potential_wins = data.raw
  potential_wins.each do |row|
    row.collect! {|x| x.to_i }
  end
  @grid.detect_potential_win(player).should == potential_wins
end
