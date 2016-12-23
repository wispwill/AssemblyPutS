//Laura Josuweit
//C program that uses assembly version of puts, asmputs
//2016-12-4
int asmputs(char* str);
int main(int argc, char **argv)
{
	
	for ( ; argc >= 0; argc--) {
            ++argv;
            asmputs(*argv);
        }
	
	return 0;
}
