vim_config
==========

作者: 罗昕 (luoxin.net@gmail.com)
For Vim version 7.0 and above
Last change: 2009 May 10

1. 概述 |luoxin-intro|
2. 使用的插件 |luoxin-plugin|
3. 插件功能简介 |luoxin-plugin-description|
4. 快捷键一览 |luoxin-shortcut|
5. 其他说明 |luoxin-shortcut|

==============================================================================
*luoxin-intro*
1. Overview~

本文档是罗昕的vim相关配置文件和插件的说明。这些插件和设置是完全根据个人喜好来
进行的选择，目前主要为了方便ruby和rails的开发。若您认为有不合理和不符合您个人
习惯的部分，完全可以自行进行修改。

==============================================================================
*luoxin-plugin*
2. 使用的插件~

|rails| |project| |NERDTree| |dbext| |bufexplorer| |taglist| |NERDCommenter|
|NERDSnippets| |fuzzyfinder| |vcscommand| |specky| |Grep| |endwise| |mark|
|allml| |surround| |vim.git| |sketch| |Calender| |viki|

==============================================================================
*luoxin-plugin-description*
3. 插件简介~

    3.1 rails~

    rails插件是为rails程序员量身打造的vim插件。通过rails插件，可以方便地在各
    个文件中进行跳转，方便地调用各种generator和rake操作等。以下是一些常见操
    作：

    * :R
    跳转到关联文件。可以将R看作relation的简写。比如你在controller中，将光 标
    定位到某个action方法中，然后通过:R命令，你可以跳转到对应的view中。大部分
    的rails文件都有其对应的关联文件。具体的关联，你可以自己进行尝试。

    * :A
    跳转到另一种相关的文件。比如在controller中调用:A会跳转到对应的测试文件。
    你可以在不同的文件中尝试:A的含义。

    * :Rcontroller :Rmodel :Rview
    调用此类命令时后接具体的对象名称如：
>
:Rcontroller users
<
    这会使你跳转到users_controller.rb文件中。
    Note:你可以在vim命令模式下，通过<tab>键快速地进行补全。如输入:Rco后，按
    <tab>键自动补全为Rcontroller，然后输入us，再按<tab>键补全为users。如果第
    一次按<tab>键没有找到你想要的模式，多按几次就可以了。

    * :Rconsole :Rserver :Rlog等等
    方便地调用rails内建的一系列script，Rlog用来方便地查看日志。

    * :Rfind
    通过Rfind查找特定的文件。
>
:Rfind public/javascripts/application.js
<
    Note:同样注意利用<tab>键在命令模式下快速补全。

    * :Rake :Rgenerate
    方便地调用rails内建的一系列generate和rake任务。如：
>
:Rake db:migrate VERSION=0
:Rgenerate scaffold user ...
<
    * :Rtags
    为整个rails项目生成ctags索引。生成索引后，你就可以在调用的类、方法上按
    CTRL-]的组合快速跳转到该类、方法的定义处。

    * :Rproject
    通过该命令调出整个rails工程的目录树。

    * gf
    在normal模式下通过gf快速跳转到对应的文件。比如在model中有:
>
has_many :users
<
    我将光标定位到:users上，然后按gf，就可以跳转到user.rb文件了。
    又比如在view中有:
>
render :patial => "user"
<
    则可以跳转到_user.html.erb文件中

    * :Rextract
    方便地生成partial文件。比如在view中在visual模式下选中一段代码，按:进入命令
    模式，然后通过Rextract命令用这段代码生成一个partial。如：
>
:'<,'>Rextract blog/post
<
    * snippet
    Note:snippet并不是一个命令，而是指一种快速生成代码的模式
    这里要感谢|NERDSnippets|这个插件，它使得我们在vim中可以如textmate中一样快
    速生成rails相关的代码片段。要完成插入代码片段的功能，如果不使用
    |NERDSnippets|，我们同样可以选择|snipmate|这个插件，配合|supertab|，效果也
    相当不错，这在后面会有介绍。现在，有了|NERDSnippets|插件，比如我们在model
    中输入hm，然后按<tab>，则hm会被自动展开为：
>
        has_many :objects<+, :class_name => "<+object+>", :foreign_key => "<+reference+>_id"+>
<
    这时你可以按<tab>键对模板进行修改了。
    |NERDSnippets|为rails的开发提供了一系列的模板。
    
    3.2 project~

    其实前面已经介绍过了，这个插件被自动集成到了|rails.vim|中，方便地对整个
    rails项目的文件进行查看和导航。
>
:Rpoject
<
    当rails的项目树出现后，你可以在通过vim通用的j、k等键定位到目录、文件上，
    然后按<enter>打开目录或文件。

    3.3 NERDTree~

    |NERDTree|与|project|插件类似，同样提供了方便的目录树查看功能。个人感觉它
    比|project|要更好用一些。该插件已经绑定到快捷键<leader>tt中。你可以通过这
    个按键组合快速打开、关闭|NERDTree|。
    Note:<leader>一般指"\"键。你也可以自行将它映射到其他的键，如","
    Note:在目录树窗口中，你可以通过"o"键打开、关闭目录，打开文件。"go"键可以
    打开文件，而光标仍然停留在目录树窗口中。

    快捷键绑定
    * <leader>tt 切换显示|NERDTree|。

    3.4 dbext~

    |dbext|用来快速地对数据库进行访问。
    可以通过<leader>sbp键组合来配置数据库访问参数。
    <leader>sel执行光标所在当前行的sql语句。sel可以看作"sql execute line"的缩
    写。
    <leader>se执行visual模式下选中的语句。如以下语句：
>
SELECT * FROM users
WHERE name = 'luoxin'
<
    在visual模式下选中这个sql语句，然后按<leader>se，接下来就会出现一个split
    窗口，显示执行这段sql的结果。

    快捷键绑定
    * <leader>sbp 配置数据库。
    * <leader>sel 执行当前行的sql语句。
    * <leader>se 执行visual模式下选中的sql语句。

    3.5 bufexplorer~

    |bufexplorer|用来快速地在buffer（最近打开的文件）中进行跳转。
    可以通过<leader>bs键来调出buffer窗口，选中你想要跳转的文件后，按<enter>键
    即可跳转到对应的文件。按"q"键可以快速退出buffer窗口。

    快捷键绑定
    * <leader>bs 调出buffer窗口。

    3.6 taglist~

    |taglist|用来生成用来快速定位类、方法的索引。你可以在bash中通过ctags -r命
    令来调用，也可以在rails文件中通过:Rtags来调用。
    当生成索引后，我们就可以通过<CTRL-]>来定位到类、方法的原始定位处了。
    另外，还可以显示文件的类、方法列表，方便在文件中快速定位。

    快捷键绑定
    * <leader>tl 调出|taglist|窗口。

    3.7 NERDCommenter~

    |NERDCommenter|用来快速地对一段代码进行注释、反注释。

    快捷键绑定
    * ,cc 快速注释。normal或visual模式。
    * ,c<space> 快速反注释。normal或visual模式。

    3.8 NERDSnippets~

    |NERDSnippets|用来快速生成代码模板。

    首先输入代码模板的缩写，然后按<tab>将该模板展开，然后再按<tab>键对模板中
    的模式进行替换。

    示例：
    在ruby文件中输入"ife"，然后按<tab>键，将会获得模板
>
        if <+condition+>
          <++>
        else
          <++>
        end
<
    接下来你可以继续按<tab>键跳转到<++>处进行修改。

    3.9 fuzzyfinder~

    |fuzzyfinder|用来快速查找文件和命令。|fuzzyfinder|可以对当前工作目录下的
    文件、buffer中的文件、当前编辑文件所在目录下的文件进行快速查找，还可以快
    速查找最近调用过的命令。

    Note: 当出现文件（命令）的下拉列表后。通过方向键或<CTRL-N>、<CTRL-P>键在
    下拉列表中进行定位。当找到需要的文件后，按<enter>在当前的窗口中打开，
    <CTRL-J>在水平分割窗口中打开，按<CTRL-K>在垂直分割窗口中打开。同样，如果
    是对命令进行查找，找到相应的命令后按<enter>执行。

    Note: 查找时可以通过*进行模式匹配。如**/*.rb将查找当前目录及其子目录下的
    所有ruby文件。

    快捷键绑定
    * <leader>ff 在当前工作目录下查找（:pwd可以查看当前的工作目录）文件。
    * <leader>fb 在buffer中查找文件。
    * <leader>fw 在当前编辑文件所在的目录下查找文件。
    * <leader>fd 在当前工作目录下查找目录。
    * <leader>fm 查找最近使用过的文件。
    * <leader>fc 查找最近执行过的命令。

    3.10 vcscommand~

    |vcscommand|用来与源代码管理工具 (svn、git等）进行集成。

    快捷键绑定
    * <Leader>ca VCSAdd
    * <Leader>cn VCSAnnotate
    * <Leader>cc VCSCommit
    * <Leader>cD VCSDelete
    * <Leader>cd VCSDiff
    * <Leader>cg VCSGotoOriginal
    * <Leader>cG VCSGotoOriginal!
    * <Leader>ci VCSInfo
    * <Leader>cl VCSLog
    * <Leader>cL VCSLock
    * <Leader>cr VCSReview
    * <Leader>cs VCSStatus
    * <Leader>cu VCSUpdate
    * <Leader>cU VCSUnlock
    * <Leader>cv VCSVimDiff
    我一般最喜欢用<leader>cs查看状态，<leader>cv查看文件的改变。

    3.11 specky~

    |specky|使ruby/rails程序文件能够轻松地与rspec进行集成。此外，|specky|还提
    供了查看rdoc等功能。
    /*
     *
     */
    /*
     *Note: 可以在~/.vimrc中修改对应的快捷键映射和spec、rdoc调用命令等。
     */

    快捷键绑定
    * <Leader>rs 运行当前文件对应的spec测试文件。
    * <Leader>rx 在原文件和对应的rspec测试文件中进行切换。
    * <Leader>rr 将光标定位到类、方法上运行此命令可以查看对应的rdoc。

    3.12 Grep~

    |Grep|用于在文件中查找指定的模式。它实际上是bash中grep命令的映射，因此
    可以参考man grep来查看更多的选项。

    示例（在当前目录下的所有ruby文件中查找"luoxin"）：
>
:Grep luoxin **/*.rb
<
    3.13 endwise~

    |endwise|自动补全。如输入def some_method并按回车后，它会为你自动插入结尾
    的end。

    3.14 mark~

    |mark|同时高亮显示多个搜索结果。

    快捷键绑定
    * <Leader>m 在需要高亮的单词上执行，会在文件中高亮显示这个单词。
    * <Leader>n 清除高亮显示结果。在空白处执行清除整个文件的高亮显示。

    3.15 allml~

    |allml|在xml、html、erb文件中快速生成tag。

    快捷键绑定
    * <CTRL-X><CTRL-SPACE> 在insert模式下执行。会把光标处的单词转化为tag。
    * <CTRL-X><enter> 在insert模式下执行。会把光标处的单词转化为tag，并自动换
    行。

    示例（输入a后按<CTRL-X><CTRL-SPACE>，^为光标位置）：
>
<a>^</a>
<
    3.16 surround~

    |surround|用来快速生成、删除或替换引号和括号对。

    快捷键绑定
    * ds 删除引号、括号对等。如ds"将删除当前光标左右的引号。
    * cs 改变引号、括号对等。如cs"'将把包围光标的双引号改成单引号。

    Note: |surround|还有很多丰富的功能，如插入引号、括号对等，具体请参考它自带
    的文档。

    3.17 vim.git~

    |vim.git|是vim和git进行集成的插件。

    快捷键绑定
    * <Leader>gd :GitDiff<Enter>
    * <Leader>gD :GitDiff --cached<Enter>
    * <Leader>gs :GitStatus<Enter>
    * <Leader>gl :GitLog<Enter>
    * <Leader>ga :GitAdd<Enter>
    * <Leader>gA :GitAdd <cfile><Enter>
    * <Leader>gc :GitCommit<Enter>
    * <Leader>gp :GitPullRebase<Enter>

    3.18 sketch~

    |sketch|用鼠标来画连线图。

    快捷键绑定
    * <Leader>ts 切换到画图状态。

    3.19 Calender~

    |Calender|日历，可以方便地写日记:)

    快捷键绑定
    * :Calender

    3.20 Viki~

    |viki|用viki的格式编辑文件，可以通过deplate转化为html或其他格式的文件。
    当编辑*.viki文件时自动进入viki模式。

    3.21 txtbrowser~

    |txtbrowser|编辑纯文本文件(txt)的辅助工具。
    :help txtbrowser

==============================================================================
*luoxin-shortcut*
4. 快捷键一览~

    * <leader>tt 切换显示|NERDTree|。
    * <leader>bs 调出|bufexplorer|窗口。
    * <leader>tl 调出|taglist|窗口。
    * <Leader>ts 切换到画图状态。

    * <leader>sbp 配置数据库。
    * <leader>sel 执行当前行的sql语句。
    * <leader>se 执行visual模式下选中的sql语句。

    * ,cc 快速注释。normal或visual模式。
    * ,c<space> 快速反注释。normal或visual模式。

    * <leader>ff 在当前工作目录下查找（:pwd可以查看当前的工作目录）文件。
    * <leader>fb 在buffer中查找文件。
    * <leader>fw 在当前编辑文件所在的目录下查找文件。
    * <leader>fd 在当前工作目录下查找目录。
    * <leader>fm 查找最近使用过的文件。
    * <leader>fc 查找最近执行过的命令。

    * <Leader>rs 运行当前文件对应的spec测试文件。
    * <Leader>rx 在原文件和对应的rspec测试文件中进行切换。
    * <Leader>rr 将光标定位到类、方法上运行此命令可以查看对应的rdoc。

    * <Leader>m 在需要高亮的单词上执行，会在文件中高亮显示这个单词。
    * <Leader>n 清除高亮显示结果。在空白处执行清除整个文件的高亮显示。

    * <CTRL-O><CTRL-SPACE> 在insert模式下执行。会把光标处的单词转化为tag。
    * <CTRL-O><enter> 在insert模式下执行。会把光标处的单词转化为tag，并自动换

    * ds 删除引号、括号对等。如ds"将删除当前光标左右的引号。
    * cs 改变引号、括号对等。如cs"'将把包围光标的双引号改成单引号。

    * <Leader>ca VCSAdd
    * <Leader>cn VCSAnnotate
    * <Leader>cc VCSCommit
    * <Leader>cD VCSDelete
    * <Leader>cd VCSDiff
    * <Leader>cg VCSGotoOriginal
    * <Leader>cG VCSGotoOriginal!
    * <Leader>ci VCSInfo
    * <Leader>cl VCSLog
    * <Leader>cL VCSLock
    * <Leader>cr VCSReview
    * <Leader>cs VCSStatus
    * <Leader>cu VCSUpdate
    * <Leader>cU VCSUnlock
    * <Leader>cv VCSVimDiff

    * <Leader>gd :GitDiff<Enter>
    * <Leader>gD :GitDiff --cached<Enter>
    * <Leader>gs :GitStatus<Enter>
    * <Leader>gl :GitLog<Enter>
    * <Leader>ga :GitAdd<Enter>
    * <Leader>gA :GitAdd <cfile><Enter>
    * <Leader>gc :GitCommit<Enter>
    * <Leader>gp :GitPullRebase<Enter>

==============================================================================
*luoxin-others*
5. 其他说明~

1. 写ruby代码时，可以通过<CTRL-X><CTRL-O>来通过运行时反射ruby对象生成可供补全
   的列表。

2. 目前使用的生成代码模板的文件为|NERDSnippets|。另一个类似的插件是|snipmate|
   此插件与|supertab|配合也能达到非常好的效果————利用<tab>来自动补全及生成代码
   片段。如果要使用|snipmate|。可以在~/.vim目录下运行这个命令： >
       git checkout snipmate
<
3. |dbext|会导致<CTRL-O>和<CTRL-I>的默认行为发生变化。我已将plugin/dbext.vim
   文件中的最后几行注释掉了，目前暂时解决了这个问题。|NERDSnippets|同样也会引
   起<CTRL-I>的问题，通过注释enableMaps()方法中的一行解决了这个问题。|endwise|
   与viki有一点冲突，编辑viki文件时换行会变成"<Plug>DiscretionaryEnd"的形式。
   通过注释endwise.vim中的一行解决了这个冲突。|surround|会占用visual模式下的s
   键，使用c键可以完成同样的功能。

4. Vim is great. Happy coding, enjoy it. :)

==============================================================================

vim:tw=78:ts=8:noet:ft=help:
vim配置
