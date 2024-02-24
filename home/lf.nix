{ pkgs, config, lib, ... }:

{
  programs.lf = {
    enable = true;
    commands = {
      drag-out = ''%${pkgs.ripdrag}/bin/ripdrag -a -x "$fx"'';
      editor-open = ''$$EDITOR "$f"'';
      edit-dir = ''$$EDITOR .'';
      mkdirfile = ''
        ''${{
            printf "File: "
            read DIR
            mk $DIR
        }}
      '';

      #on-cd = ''
      #  ''${{ }}
      #'';
    };
    keybindings = {
      "\\\"" = "";
      o = "";
      d = "";
      e = "";
      f = "";
      c = "mkdirfile";
      "." = "set hidden!";
      D = "delete";
      p = "paste";
      dd = "cut";
      y = "copy";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";
      a = "rename";
      r = "reload";
      C = "clear";
      U = "unselect";

      do = "drag-out";

      "g~" = "cd";
      gh = "cd";
      "g/" = "/";
      gd = "cd ~/Downloads";
      gt = "cd /tmp";
      gv = "cd ~/Videos";
      go = "cd ~/Documents";
      gc = "cd ~/.config";
      gn = "cd ~/nixconf";
      gp = "cd ~/Projects";
      gs = "cd ~/.local/share";
      gm = "cd /run/media";

      ee = "editor-open";
      "e." = "edit-dir";
      V = ''''$${pkgs.bat}/bin/bat --paging=always "$f"'';

      "<C-d>" = "5j";
      "<C-u>" = "5k";
    };

    settings = {
      reverse = false;
      preview = true;
      hidden = false;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    extraConfig = let
      previewer = pkgs.writeShellScriptBin "pv.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5

        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
            ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
        fi

        ${pkgs.pistol}/bin/pistol "$file"
      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.ctpv}/bin/ctpvclear
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in ''
      # set cleaner ''${pkgs.ctpv}/bin/ctpvclear
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${pkgs.ctpv}/bin/ctpv
      cmd stripspace %stripspace "$f"
      setlocal ~/Projects sortby time
      setlocal ~/Projects/* sortby time
      setlocal ~/Downloads/ sortby time
    '';
  };

  # I want the entire lf config to be in 1 file. One lf.nix file
  # Dont ask why.
  xdg.configFile."lf/icons".text = ''
    # These examples require Nerd Fonts or a compatible font to be used.
    # See https://www.nerdfonts.com for more information.
    
    # default values from lf (with matching order)
    # ln      l       # LINK
    # or      l       # ORPHAN
    # tw      t       # STICKY_OTHER_WRITABLE
    # ow      d       # OTHER_WRITABLE
    # st      t       # STICKY
    # di      d       # DIR
    # pi      p       # FIFO
    # so      s       # SOCK
    # bd      b       # BLK
    # cd      c       # CHR
    # su      u       # SETUID
    # sg      g       # SETGID
    # ex      x       # EXEC
    # fi      -       # FILE
    
    # file types (with matching order)
    ln             # LINK
    or             # ORPHAN
    tw      t       # STICKY_OTHER_WRITABLE
    ow             # OTHER_WRITABLE
    st      t       # STICKY
    di             # DIR
    pi      p       # FIFO
    so      s       # SOCK
    bd      b       # BLK
    cd      c       # CHR
    su      u       # SETUID
    sg      g       # SETGID
    ex             # EXEC
    fi             # FILE
    
    # file extensions (vim-devicons)
    *.styl          
    *.sass          
    *.scss          
    *.htm           
    *.html          
    *.slim          
    *.haml          
    *.ejs           
    *.css           
    *.less          
    *.md            
    *.mdx           
    *.markdown      
    *.rmd           
    *.json          
    *.webmanifest   
    *.js            
    *.mjs           
    *.jsx           
    *.rb            
    *.gemspec       
    *.rake          
    *.php           
    *.py            
    *.pyc           
    *.pyo           
    *.pyd           
    *.coffee        
    *.mustache      
    *.hbs           
    *.conf          
    *.ini           
    *.yml           
    *.yaml          
    *.toml          
    *.bat           
    *.mk            
    *.jpg           
    *.jpeg          
    *.bmp           
    *.png           
    *.webp          
    *.gif           
    *.ico           
    *.twig          
    *.cpp           
    *.c++           
    *.cxx           
    *.cc            
    *.cp            
    *.c             
    *.cs            󰌛
    *.h             
    *.hh            
    *.hpp           
    *.hxx           
    *.hs            
    *.lhs           
    *.nix           
    *.lua           
    *.java          
    *.sh            
    *.fish          
    *.bash          
    *.zsh           
    *.ksh           
    *.csh           
    *.awk           
    *.ps1           
    *.ml            λ
    *.mli           λ
    *.diff          
    *.db            
    *.sql           
    *.dump          
    *.clj           
    *.cljc          
    *.cljs          
    *.edn           
    *.scala         
    *.go            
    *.dart          
    *.xul           
    *.sln           
    *.suo           
    *.pl            
    *.pm            
    *.t             
    *.rss           
    '*.f#'          
    *.fsscript      
    *.fsx           
    *.fs            
    *.fsi           
    *.rs            
    *.rlib          
    *.d             
    *.erl           
    *.hrl           
    *.ex            
    *.exs           
    *.eex           
    *.leex          
    *.heex          
    *.vim           
    *.ai            
    *.psd           
    *.psb           
    *.ts            
    *.tsx           
    *.jl            
    *.pp            
    *.vue           
    *.elm           
    *.swift         
    *.xcplayground  
    *.tex           󰙩
    *.r             󰟔
    *.rproj         󰗆
    *.sol           󰡪
    *.pem           
    
    # file names (vim-devicons) (case-insensitive not supported in lf)
    *gruntfile.coffee       
    *gruntfile.js           
    *gruntfile.ls           
    *gulpfile.coffee        
    *gulpfile.js            
    *gulpfile.ls            
    *mix.lock               
    *dropbox                
    *.ds_store              
    *.gitconfig             
    *.gitignore             
    *.gitattributes         
    *.gitlab-ci.yml         
    *.bashrc                
    *.zshrc                 
    *.zshenv                
    *.zprofile              
    *.vimrc                 
    *.gvimrc                
    *_vimrc                 
    *_gvimrc                
    *.bashprofile           
    *favicon.ico            
    *license                
    *node_modules           
    *react.jsx              
    *procfile               
    *dockerfile             
    *docker-compose.yml     
    *rakefile               
    *config.ru              
    *gemfile                
    *makefile               
    *cmakelists.txt         
    *robots.txt             󰚩
    
    # file names (case-sensitive adaptations)
    *Gruntfile.coffee       
    *Gruntfile.js           
    *Gruntfile.ls           
    *Gulpfile.coffee        
    *Gulpfile.js            
    *Gulpfile.ls            
    *Dropbox                
    *.DS_Store              
    *LICENSE                
    *React.jsx              
    *Procfile               
    *Dockerfile             
    *Docker-compose.yml     
    *Rakefile               
    *Gemfile                
    *Makefile               
    *CMakeLists.txt         
    
    # file patterns (vim-devicons) (patterns not supported in lf)
    # .*jquery.*\.js$         
    # .*angular.*\.js$        
    # .*backbone.*\.js$       
    # .*require.*\.js$        
    # .*materialize.*\.js$    
    # .*materialize.*\.css$   
    # .*mootools.*\.js$       
    # .*vimrc.*               
    # Vagrantfile$            
    
    # file patterns (file name adaptations)
    *jquery.min.js          
    *angular.min.js         
    *backbone.min.js        
    *require.min.js         
    *materialize.min.js     
    *materialize.min.css    
    *mootools.min.js        
    *vimrc                  
    Vagrantfile             
    
    # archives or compressed (extensions from dircolors defaults)
    *.tar   
    *.tgz   
    *.arc   
    *.arj   
    *.taz   
    *.lha   
    *.lz4   
    *.lzh   
    *.lzma  
    *.tlz   
    *.txz   
    *.tzo   
    *.t7z   
    *.zip   
    *.z     
    *.dz    
    *.gz    
    *.lrz   
    *.lz    
    *.lzo   
    *.xz    
    *.zst   
    *.tzst  
    *.bz2   
    *.bz    
    *.tbz   
    *.tbz2  
    *.tz    
    *.deb   
    *.rpm   
    *.jar   
    *.war   
    *.ear   
    *.sar   
    *.rar   
    *.alz   
    *.ace   
    *.zoo   
    *.cpio  
    *.7z    
    *.rz    
    *.cab   
    *.wim   
    *.swm   
    *.dwm   
    *.esd   
    
    # image formats (extensions from dircolors defaults)
    *.jpg   
    *.jpeg  
    *.mjpg  
    *.mjpeg 
    *.gif   
    *.bmp   
    *.pbm   
    *.pgm   
    *.ppm   
    *.tga   
    *.xbm   
    *.xpm   
    *.tif   
    *.tiff  
    *.png   
    *.svg   
    *.svgz  
    *.mng   
    *.pcx   
    *.mov   
    *.mpg   
    *.mpeg  
    *.m2v   
    *.mkv   
    *.webm  
    *.ogm   
    *.mp4   
    *.m4v   
    *.mp4v  
    *.vob   
    *.qt    
    *.nuv   
    *.wmv   
    *.asf   
    *.rm    
    *.rmvb  
    *.flc   
    *.avi   
    *.fli   
    *.flv   
    *.gl    
    *.dl    
    *.xcf   
    *.xwd   
    *.yuv   
    *.cgm   
    *.emf   
    *.ogv   
    *.ogx   
    
    # audio formats (extensions from dircolors defaults)
    *.aac   
    *.au    
    *.flac  
    *.m4a   
    *.mid   
    *.midi  
    *.mka   
    *.mp3   
    *.mpc   
    *.ogg   
    *.ra    
    *.wav   
    *.oga   
    *.opus  
    *.spx   
    *.xspf  
    
    # other formats
    *.pdf   
  '';
}
