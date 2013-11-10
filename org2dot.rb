#!ruby -Ku
# -*- coding: utf-8 -*-
# (compile "make -k start-pfd-sample2.gif")
# -*- compile-command: make start-pfd-sample2.gif -*-
# ruby --version
# ruby 1.9.3p448 (2013-06-27) [i386-mingw32]

class Org2dot

  def convert_file

    template1 =<<EOS
digraph G {

    node [fontname="MS UI Gothic", style = filled];
    node [shape = oval, color = yellow];
EOS

    template2 =<<EOS
    pa1_101 [label = "〈pa1_101-要件定義〉"];
EOS

    template3 =<<EOS
    node [shape = box, color = cyan];
EOS

    template4 =<<EOS
    ma1_101 [label = "《ma1_101-ロジック仕様書》"];
EOS

    template5 =<<EOS
    ma1_101 -> pa1_101 -> ma1_102;
EOS

    template6 =<<EOS
}
EOS

    print template1

    while line = gets
      line = convert_line line
      print "#{line}\n" if line
    end

    print template3, template4, template5, template6
  end

  def convert_line line
    id, label = match_process line
    id, label = match_datastore line unless id
    if id  then
      "    #{id} [label = \"#{label}\"];"
    else
      nil
    end
  end

  def match_process line
    if line =~ %r!\*+ (〈(\w+)/[^〉]+〉)!
      label = $1
      id = $2
    end
    [id, label]
  end

  def match_datastore line
    if line =~ %r!- (《(\w+)/[^〉]+》)!
      label = $1
      id = $2
    end
    [id, label]
  end

end

if $0 == __FILE__ then
  Org2dot.new.convert_file
end
