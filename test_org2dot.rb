#!ruby -Ku
# -*- coding: utf-8; mode: ruby -*-
# -*- compile-command: echo make test-org2dot -*-
# (compile "make -k test-org2dot")
# ruby --version
# ruby 1.9.3p448 (2013-06-27) [i386-mingw32]

require 'minitest/unit'
require './org2dot'

MiniTest::Unit.autorun

class TestOrg2dot < MiniTest::Unit::TestCase

  def setup
    @org2dot = Org2dot.new
  end

  def test_match_process1
    input = "*** 〈pa1_101/要件定義〉"
    id, label = @org2dot.match_process input
    assert_equal "pa1_101", id
    assert_equal "〈pa1_101/要件定義〉", label
  end

  def test_match_process2
    input = "*** 〈pa2_101/外部設計〉"
    id, label = @org2dot.match_process input
    assert_equal "pa2_101", id
    assert_equal "〈pa2_101/外部設計〉", label
  end

  def test_match_datastore1
    input = "- 《ma1_101/ロジック仕様書》"
    id, label = @org2dot.match_datastore input
    assert_equal "ma1_101", id
    assert_equal "《ma1_101/ロジック仕様書》", label
  end

  def test_match_datastore2
    input = "- 《ma1_102/要件定義書》"
    id, label = @org2dot.match_datastore input
    assert_equal "ma1_102", id
    assert_equal "《ma1_102/要件定義書》", label
  end

  def test_convert_line1
    input = "*** 〈pa1_101/要件定義〉"
    output = @org2dot.convert_line input
    assert_equal "    pa1_101 [label = \"〈pa1_101/要件定義〉\"];", output
  end

  def test_convert_line2
    input = "*** 〈pa2_101/外部設計〉"
    output = @org2dot.convert_line input
    assert_equal "    pa2_101 [label = \"〈pa2_101/外部設計〉\"];", output
  end

  def test_convert_line3
    input = "*** 〈pa2_101/外部設計〉"
    output = @org2dot.convert_line input
    assert_equal "    pa2_101 [label = \"〈pa2_101/外部設計〉\"];", output
  end

end
