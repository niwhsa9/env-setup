self : super:
{
    st = super.st.overrideAttrs ( old : rec {
         src =( builtins.fetchGit { url = "https://github.com/niwhsa9/st"; });
    });
    
    
}  