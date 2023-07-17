self : super:
{
    st = super.st.overrideAttrs ( old : rec {
         src =( builtins.fetchGit { 
            url = "https://github.com/niwhsa9/st"; 
            rev = "4650603ad54d2fa6c589b7bf9e3da7e2c94b6032";
            });
    });
    
   manif = super.callPackage ./pkgs/manif/default.nix {}; 
}  