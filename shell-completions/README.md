
./Hyde.usage file is auto generated.

 Add functions below this section
Be careful with spaces in your Function definitions

Example Function:
`
```

Function() { #? Example Function. this comments supports '\n'
 ```

> [!Note]
> ' #?' is a delimiter use as description and respects /n 


```
 case $1 in
 # Cases go here...
 case1) #? Case description
```
>[!Note]
> #? description for case functions

```
    commands...
    do something
 : <<USAGE
 [FUNCTION_CASE_USAGE ]
	--flags ? Description for flags
	 --args ? Desc for args
	--parms ? desc for param
sufix       ? sufix is use if you want to concat a sufix to a command/arg/param it is achieved by not giving space on line
 [END]
 USAGE
 ```
 
 > [!Note]
 >  Usage block is a comment block that will be parsed by gen_completion and man function

````
 ;;
 esac; <== ' ; ' is also use to parse case conditions
}
```
