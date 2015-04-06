BEGIN {
	s = -1;
}

/^>/ {
	++s;
	l=$1;
	sub(">", "", l);
	locus[s] = l;
	description[s] = $2;
	for (i = 3; i <= NF; ++i)
		description[s] = description[s] " " $i; 
	sequence[s] = "";
}
{
	if (substr($1, 1, 1) != ">")
		sequence[s] = sequence[s] $1;
}
END {
	for (i = 0; i <= s; ++i) { 
		printf("%s\t%s\t%s\n", locus[i], description[i], sequence[i]);
	}
} 
