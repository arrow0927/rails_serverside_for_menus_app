task :read_csv => :environment do
  desc "This class will read a csv file and display its contents on the screen"
  
  puts 'reading lines'
  IO.foreach("yp.csv"){ |block| puts block} 
  
  
  

  #//:s/CtrlVCtrM/Replacewith/g
  #merged_duped_clean.csv
  #Scoop!,2050 4th Ave W, Vancouver,604 569-3338,www.scoopyogurt.com,nil,nil,
end
