# -*- coding: utf-8 -*-
# 以下のジョブネットについてテンプレートジョブネットや
# 実行用ジョブネットを扱うフィクスチャ生成のためのクラスです。
#
# in [j10]
#              |--e2-->[j11]--e4-->|
# [S1]--e1-->[F1]                [J1]--e6-->[E1]
#              |--e3-->[j12]--e5-->|

class Rjn0002SimpleParallelJobnetBuilder < JobnetFixtureBuilder
  DSL = <<-EOS
    jobnet("rjn0002") do
      boot_jobs("j11", "j12")
      job("j11", "$HOME/j11.sh")
      job("j12", "$HOME/j12.sh")
    end
  EOS

  def create(options = {})
    root = new_root_jobnet("rjn0002")
    root.children << new_start
    root.children << new_fork
    root.children << new_script("j11", :script => "$HOME/j11.sh")
    root.children << new_script("j12", :script => "$HOME/j12.sh")
    root.children << new_join
    root.children << new_end
    root.edges << new_edge(:S1, :F1)
    root.edges << new_edge(:F1, :j11)
    root.edges << new_edge(:F1, :j12)
    root.edges << new_edge(:j11, :J1)
    root.edges << new_edge(:j12, :J1)
    root.edges << new_edge(:J1, :E1)
    root.save!
  end
end
