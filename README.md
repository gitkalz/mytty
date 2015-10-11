Docker Image repo for Javascript based Unix Terminal/Console which you can access from a web browser on your preferred port. Built on Node.JS and [TTY.JS](https://github.com/chjj/tty.js/) from respective authors. Packaged with ZSH and Prezto for awesomeness!!

<div align="center">
<img src=http://i.imgur.com/laD3d5f.png width=800/>
</div>

Check out the [terminal recording](https://asciinema.org/a/4qktrmlwxbhdl87vizno30ei1) to glance on how to build from my repo as is.

<div align="center">
<script type="text/javascript" src="https://asciinema.org/a/4qktrmlwxbhdl87vizno30ei1.js" id="asciicast-4qktrmlwxbhdl87vizno30ei1" async></script>
</div>

Alternatively, you may readily use my automated image linked to my Git Repo from Docker hub as follows

1. Make sure you have docker installed and running `docker version`
2. `docker pull kalz/zsh_tty` to pull the image from docker hub
3. Start the container by running `docker run -p <portofyourchoice>:8080 --hostname <preferredhostname> --name <<nameyourcontainer> -d kalz/zsh_tty`


Access your Terminal from latest web browser on `http://<dockerhost>:<portofyourchoice>/`

One caveat is, Copy and Paste may not work in all browsers, however, the fool proof method is to use `tmux` style key modes to copy/paste as listed below.

###CheatSheet

1. `Ctrl + a` enters `prefix` mode, and in this mode you may use `[` to start `selection` mode and hit `v` or `space` to mark selection using `h/j/k/l` keys and hit `Ctrl + c` to copy selected text.
2. Typically you would select a text using a mouse and right-click `copy` and hit `Ctrl+a` and `Ctrl + v` to paste the copied content.
3. When you are in `Visual` or `Selection` mode, hitting `ESC` will return you to normal mode
4. `Ctrl + PageUp` or `Ctrl + PageDown` moves the screen content.