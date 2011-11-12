# -*- coding: utf-8 -*-
require 'tengine/job'

# # Tengine Jobnet Element Selector Notation
# Tengineジョブネット要素セレクタ記法
#
# Tengineジョブネット要素セレクタ記法は、TenigneのジョブDSLで生成されるジョブネットから
# 特定のVertexやEdgeを特定するための記述方法です。
# 正式名称が長いので、ここでは略して「セレクタ記法」と呼ぶ
#
# ## 背景
# Tengienジョブでは、ジョブやジョブネットなどのvertexとそれらを結ぶedgeが連携して動くこと
# ジョブの実行を行うが、ジョブ、ジョブネット以外のvertexとedgeには名前がついていない。
# しかし、ジョブネット内の要素群が連携して動作することを確認するためには、どのvertex、
# あるいはどのedgeなのかという点について状態などを確認する必要がある。
#
# ## name_path
# Tengineのジョブ／ジョブネットは親子関係によるツリー構造を持ち、
# それぞれ兄弟間では重複しない名前が指定されるので、スラッシュによって区切ることによって
# ファイルパスのような表記によって、どのジョブ／ジョブネットなのかを特定できる
#
# ## name_pathの問題点
# ジョブとジョブネットについては名前があるのでname_pathだけで特定できるが、
# それ以外のedgeやfork, joinについては特定することができない。
#
# ## それぞれの指定方法
# ### ジョブ／ジョブネット
# 1. name_pathをそのまま
#  * 例: "/j100/j110/j111"    # jxxx は、ジョブあるいはジョブネットを想定しています
# 2. "#{ジョブ／ジョブネット名}@#{ジョブネットのname_path}"
#  * 例: "j111@/j100/j110"
#
#
# ### startとend
# 1. "#{start or end}!#{ジョブネットのセレクタ}"
#  * 例: start!j110@/j100
#  * 例: end!/j100/j110
# 2. "#{start or end}!#{ジョブネットのname_path}"
#  * 例: start@/j100/j110
#  * 例: end@/j100/j110
#
# ### edge
# #### ジョブ／ジョブネットの前後のedge
# 1. "#{prev or next}!#{ジョブ／ジョブネットのセレクタ}"
#  * 例: prev!j110@/j100
#  * 例: next!/j100/j110
#
# #### ジョブ／ジョブネットの間のedge
# 1. "#{前のジョブ名}~#{後のジョブ名}@#{ジョブネットのセレクタ}"
#  * 例: j111~j112@/j100/j110
#
# #### fork-join間のedge
# 1. "fork~join!#{前のジョブ名}~#{後のジョブ名}@#{ジョブネットのセレクタ}"
#  * 例: fork~join!j112~j113@/j100/j110
#
# ### fork, join
# 1. "#{fork or join}!#{前のジョブ名}~#{後のジョブ名}@#{ジョブネットのセレクタ}"
#  * 例: fork!j112~j113@/j100/j110
#  * 例: join!j112~j113@/j100/j110
#
#

module Tengine::Job::ElementSelectorNotation

  def element(notation)
    direction, current_path = *notation.split(/@/, 2)
    current = current_path ? vertex_by_name_path(current_path) : self
    case direction
    # when /^prev!(?:#{Tengine::Core::Validation::BASE_NAME.format})/
    when /^(prev|next)!([A-Za-z_][\w\-]*)/ then
      job = $2 ? child_by_name($2) : self
      job.send("#{$1}_edges").first
    else
      child_by_name(direction)
    end
  end
end