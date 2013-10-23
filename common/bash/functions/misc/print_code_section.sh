function print_code_section
{
  enscript --header='$n|%W|File $v, Page $% of $='  --line-numbers --landscape --margins=32:72:32:32 --toc $@
}
