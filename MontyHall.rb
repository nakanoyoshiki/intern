module MontyHall
  class Simulator
    # 初期化
    def initialize
      @number = 1000000
      @cnt_of_win = 0
      @scenarios = [%w(car goat goat), %w(goat car goat), %w(goat goat car)]
    end

    #実行部分
    def execute
      @number.times do
        doors = @scenarios.sample
        first_your_choice = choose_door #プレイヤーの最初のドア選択
        host_choice = choose_door exclude: [first_your_choice, doors.find_index("car")] # 司会がプレイヤーの最初のドア選択かつ新車のあるドア選択以外を選択する
        your_choice = choose_door exclude: [first_your_choice, host_choice] #プレイヤーが最初のドア選択かつ司会のドア選択以外を選択する
        if (doors[your_choice] ==  "car")
          @cnt_of_win += 1
        end
      end
    end

    #表示部分
    def show_result
      puts "試行回数 = #{@number}"
      puts "成功 : #{@cnt_of_win} 回"
      puts "失敗: #{@number - @cnt_of_win} 回"
      puts "------------------------"
      puts("ドアを選びなおす場合、新車を当てる確率は #{@cnt_of_win.to_f / @number.to_f * 100}%になる。")
    end
    private
    #条件に合わせ、選ばれえたドアを決める。
    def choose_door(exclude: [])
      ([0, 1, 2] - exclude).sample
    end
  end
end

simulator = MontyHall::Simulator.new
simulator.execute
simulator.show_result