require "csv"
puts "1(新規でメモを作成) 2(既存のメモを編集する)"
memo_type = gets.to_i

case memo_type
when 1
    #新規メモの作成→csvファイルを新規作成
    puts "ファイル名を入力してください"
    name = gets.chomp
    p "メモしたい内容を記入してください"
    p "完了したらEnterキーを押してください"
    value = gets.to_s.chomp
    CSV.open("#{name}.csv",'w') do |csv|
      csv << ["#{value}"]
    end
when 2
    #既存メモの編集→編集したいcsvファイル名を入力する
    puts "編集したいファイル名を入力してください"
    name = gets.chomp
    display = CSV.readlines("#{name}.csv")
    p display
    CSV.open("#{name}.csv", "a") do |csv|
    value = gets.to_s.chomp
    csv << ["#{value}"]
  end
else
  puts "1もしくは2を入力してください。"
end
