%:
	@echo '$*=$($*)'
d-%:
	@echo '$*=$($*)'
	@echo '  	origin =$(origin $*)'
	@echo '   	value =$(value  $*)'
	@echo '  	flavor =$(flavor $*)'


# 我们可以看到：

#     make的第一个-f后是要测试的makefile，第二个是我们的debug makefile。
#     后面直接跟变量名，如果在变量名前加”d-“，则输出更为详细的东西。

# 说一说”d-” 前缀（其意为details），其中调用了下面三个参数。

#     $(origin)：告诉你这个变量是来自哪儿，file表示文件，environment表示环境变量，还有environment override，command line，override，automatic等。
#     $(value)：打出这个变量没有被展开的样子。比如上述示例中的 foo 变量。
#     $(flavor)：有两个值，simple表示是一般展开的变量，recursive表示递归展开的变量。


# 测试用例：
# 	make -f test.mk -f var.mk OBJS
# 	make -f test.mk -f var.mk d-foo
# 	make -f test.mk -f var.mk d-CFLAGS
# 	make -f test.mk -f var.mk d-COMPILE.c
