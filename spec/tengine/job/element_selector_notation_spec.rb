# -*- coding: utf-8 -*-
require 'spec_helper'

describe Tengine::Job::ElementSelectorNotation do

  {
    # in [rjn0001]
    # (S1) --e1-->(j11)--e2-->(j12)--e3-->(E1)
    Rjn0001SimpleJobnetBuilder => {
      :S1 => [
        "start",
        "start@/rjn0001",
        "start!/rjn0001",
      ],
      :e1 => [
        "prev!/rjn0001/j11",
        "prev!j11@/rjn0001",
        "prev!j11",
      ],
      :j11 => [
        "/rjn0001/j11",
        "j11@/rjn0001",
        "j11",
      ],
      :e2 => [
        "next!/rjn0001/j11",
        "next!j11@/rjn0001",
        "next!j11",
        "prev!/rjn0001/j12",
        "prev!j12@/rjn0001",
        "prev!j12",
        "j11~j12@/rjn0001",
        "j11~j12",
      ],
      :j12 => [
        "/rjn0001/j12",
        "j12@/rjn0001",
        "j12",
      ],
      :e3 => [
        "next!/rjn0001/j12",
        "next!j12@/rjn0001",
        "next!j12",
      ],
      :E1 => [
        "end",
        "end@/rjn0001",
        "end!/rjn0001",
      ]
    },

    # in [rjn0002]
    #              |--e2-->(j11)--e4-->|
    # (S1)--e1-->[F1]                [J1]--e6-->(E1)
    #              |--e3-->(j12)--e5-->|
    Rjn0002SimpleParallelJobnetBuilder => {
      :S1 => [
        "start",
        "start@/rjn0002",
        "start!/rjn0002",
      ],
      :e1 => [
        "next!start@/rjn0002",
        "next!start",
      ],
      :F1 => [
        "fork!start~j11@/rjn0002",
        "fork!start~j11",
        "fork!start~j12@/rjn0002",
        "fork!start~j12",
      ],
      :e2 => [
        "prev!/rjn0002/j11",
        "prev!j11@/rjn0002",
        "prev!j11",
      ],
      :j11 => [
        "/rjn0002/j11",
        "j11@/rjn0002",
        "j11",
      ],

      :e3 => [
        "prev!/rjn0002/j12",
        "prev!j12@/rjn0002",
        "prev!j12",
      ],
      :j12 => [
        "/rjn0002/j12",
        "j12@/rjn0002",
        "j12",
      ],

      :e4 => [
        "next!/rjn0002/j11",
        "next!j11@/rjn0002",
        "next!j11",
      ],
      :e5 => [
        "next!/rjn0002/j12",
        "next!j12@/rjn0002",
        "next!j12",
      ],

      :J1 => [
        "fork!j11~end@/rjn0002",
        "fork!j11~end",
        "fork!j12~end@/rjn0002",
        "fork!j12~end",
      ],
      :e6 => [
        "prev!end@/rjn0002",
        "prev!end",
      ],
      :E1 => [
        "end",
        "end@/rjn0002",
        "end!/rjn0002",
      ]
    },

    # in [rjn0003]
    #                                                |--e7-->(j14)--e11-->(j16)--e14--->|
    #              |--e2-->(j11)--e4-->(j13)--e6-->[F2]                                 |
    # (S1)--e1-->[F1]                                |--e8-->[J1]--e12-->(j17)--e15-->[J2]--e16-->(E2)
    #              |                                 |--e9-->[J1]                       |
    #              |--e3-->(j12)------e5---------->[F3]                                 |
    #                                                |--e10---->(j15)---e13------------>|
    Rjn0003ForkJoinJobnetBuilder => {
      :e6 => [
        "next!/rjn0003/j13",
        "next!j13@/rjn0003",
        "next!j13",
      ],
      :F2 => [
        "fork!j13~j14@/rjn0003",
        "fork!j13~j14",
        "fork!j13~j17@/rjn0003",
        "fork!j13~j17",
      ],
      :e7 => [
        "prev!/rjn0003/j14",
        "prev!j14@/rjn0003",
        "prev!j14",
      ],
      :e8 => [
        "fork~join!j13~j17@/rjn0003",
        "fork~join!j13~j17",
      ],
      :e9 => [
        "fork~join!j12~j17@/rjn0003",
        "fork~join!j12~j17",
      ],
      :J1 => [
        "fork!j13~j17@/rjn0003",
        "fork!j13~j17",
        "fork!j12~j17@/rjn0003",
        "fork!j12~j17",
      ],
      :e12 => [
        "prev!/rjn0003/j17",
        "prev!j17@/rjn0003",
        "prev!j17",
      ],
    },

    # in [rjn0004]
    # [S1] --e1-->[j1100]--e2-->[j1200]--e3-->[j1300]--e4-->[j1400]--e5-->[j1500]--e6-->[j1600]--e7-->[E1]
    #
    # [j1100]
    # [S2]--e8-->(j1110)--e9-->(j1120)--e10-->[E2]
    #
    # [j1200]
    # [S3]--e11-->(j1210)--e12-->[E3]
    #
    # [j1300]
    # [S4]--e13-->(j1310)--e14-->[E4]
    #
    # [j1400]
    # [S5]--e15-->(j1410)--e16-->[E5]
    #
    # [j1500]
    # [S6]--e17-->[j1510]--e18-->[E6]
    #
    # [j1510]
    # [S7]--e19-->(j1511)--e20-->[E7]
    #
    # [j1600]
    # [S8]--e21-->[j1610]--e22-->[j1620]--e23-->[j1630]--e24-->[E8]
    #
    # [j1610]
    # [S9]--e25-->(j1611)--e26-->(j1612)--e27-->[E9]
    #
    # [j1620]
    # [S10]--e28-->(j1621)--e29-->[E10]
    #
    # [j1630]
    # [S11]--e30-->(j1631)--e31-->[E11]

    Rjn0004TreeSequentialJobnetBuilder => {
      :S2 => [
        "start@/rjn0004/j1100",
        "start@j1100",
      ],
      :e8 => [
        "next!start@/rjn0004/j1100",
        "next!start@j1100",
        "start~j1110@/rjn0004/j1100",
        "start~j1110@j1100",
      ],
      :j11 => [
        "/rjn0004/j1110",
        "j1110@/rjn0004",
        "j1110",
      ],
      :e9 => [
        "next!/rjn0004/j1100/j1110",
        "next!j1110@/rjn0004/j1100",
        "next!j1110@j1100",
        "prev!/rjn0004/j1100/j1120",
        "prev!j1120@/rjn0004/j1100",
        "prev!j1120@j1100",
        "j1110~j1120@/rjn0004/j1100",
        "j1110~j1120@j1100",
      ],
      :E2 => [
        "end",
        "end@/rjn0004",
        "end!/rjn0004",
      ]
    },

    # in [rjn0007]
    # (S1)--e1-->[j1000]--e2-->[j2000]--e3-->(E1)
    #
    # in [j1000]
    # (S2)--e4-->[j1100]--e5-->[j1200]--e6-->(E2)
    #
    # in [j1100]
    # (S3)--e7-->(j1110)--e8-->(E3)
    #
    # in [j1200]
    # (S4)--e9-->(j1210)--e10-->(E4)
    #
    # in [j1000:finally (=j1f00)]
    # (S5)--e11-->[j1f10]--e12-->(E5)
    #
    # in [j1f10]
    # (S6)--e13-->(j1f11)--e14-->(E6)
    #
    # in [j1000:finally:finally (=j1ff0)]
    # (S7)--e15-->(j1ff1)--e16-->(E7)
    #
    # in [j2000]
    # (S8)--e17-->(j2100)--e18-->(E8)
    #
    # in [jf000:finally (=jf000)]
    # (S9)--e19-->(jf100)--e20-->(E9)
    #
    Rjn0007NestedAndFinallyBuilder => {
      :j1f00 => [
        "/rjn0007/j1000/finally",
        "finally@/rjn0007/j1000",
      ],
      :S6 => [
        "start@/rjn0007/j1000/finally",
        "start@/j1000/finally",
        "start!finally@/rjn0007/j1000",
        "start!finally@j1000",
      ],
    },

  }.each do |builder_class, patterns|

    context builder_class.name do
      %w[actual template].each do |type|
        context "actual"
        before do
          Tengine::Job::Vertex.delete_all
          builder = builder_class.new
          @root = builder.send(:"create_#{type}")
          @ctx = builder.context
        end

        patterns.each do |element_key, notations|
          notations.each do |notation|
            it "#{notation.inspect} select #{element_key.inspect}" do
              @root.element(notation).should == @ctx[element_key]
            end
          end
        end

      end
    end
  end

end
