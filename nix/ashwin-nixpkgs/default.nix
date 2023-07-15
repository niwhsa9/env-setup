self : super:
{
    st = super.st.override {
        src = builtins.fetchGit { url = "https://github.com/niwhsa9/st"; };
    }
}  