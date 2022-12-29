=begin
入力：　列名、列順は下記：係り受け解析用の短長データと同じ形式

0 corpusName(S)
1 file(S)
2 start(S)
3 end(S)
4 boundary(S)
5 orthToken(S)
6 pronToken(S)
7 reading(S)
8 lemma(S)
9 originalText(S)
10 pos(S)
11 sysCType(S)
12 cForm(S)
13 apply(S)
14 additionalInfo(S)
15 lid(S)
16 meaning(S)
17 UpdUser(S)
18 UpdDate(S)
19 order(S)
20 note(S)
21 open(S)
22 close(S)
23 wType(S)
24 fix(S)
25 variable(S)
26 formBase(S)
27 lemmaID(S)
28 usage(S)
29 sentenceId(S)
30 s_memo(S)
31 origChar(S)
32 pSampleID(S)
33 pStart(S)
34 orthBase(S)
35 file(L)
36 l_orthToken(L)
37 l_pos(L)
38 l_cType(L)
39 l_cForm(L)
40 l_reading(L)
41 l_lemma(L)
42 luw(L)
43 memo(L)
44 UpdUser(L)
45 UpdDate(L)
46 l_start(L)
47 l_end(L)
48 bunsetsu1(L)
49 bunsetsu2(L)
50 corpusName(L)
51 diffSuw(L)
52 l_lemmaNew(L)
53 l_readingNew(L)
54 l_orthBase(L)
55 l_formBase(L)
56 l_pronToken(L)
57 l_wType(L)
58 l_originalText(L)
59 complex(L)
60 l_meaning(L)
61 l_kanaToken(L)
62 l_formOrthBase(L)
63 l_origChar(L)
64 note(L)
65 pSampleID(L)
66 pStart(L)
67 rn

=end

is_first = true
bid = 0, depid = 0
docid = 0
doc = ""

File.open(ARGV[0]).each_line do |line|
  line.chomp!
  tokens = line.split("\t")
  if tokens[4] == "B"
    if is_first
#      puts "#! DOC\t#{docid}"
#      puts "#! DOCATTR\t<ID>#{docid}</ID><file>#{tokens[0]}</file><sample>#{tokens[1]}</sample>"
      docid += 1
      doc = tokens[1]
    else
      puts "EOS"
    end
    is_first = false
    bid = 0
    depid = -1
    if tokens[1] != doc
      if docid > 150 # 150件だけ出力
        exit
      end
#      puts "#! DOC\t#{docid}"
#      puts "#! DOCATTR\t<ID>#{docid}</ID><corpusName>#{tokens[0]}</corpusName><file>#{tokens[1]}</file>"
      docid += 1
      doc = tokens[1]
    end
  end
  pos = (tokens[10].split("-") + ["*","*","*","*"])[0..3].join(",")
  ctype = tokens[11]
  ctype = "*" if tokens[11] == ""
  cform = tokens[12]
  cform = "*" if tokens[12] == ""
  if tokens[48] == "B"
    #    puts "# #{bid} #{depid}D 0/0 0"
    puts "* #{bid} #{depid}D"
    bid += 1
  end
  puts tokens[9] + "\t" + pos + "," + ctype + "," + cform + "," + tokens[5..6].join(",") + "," + tokens[34]

end

puts "EOS"
