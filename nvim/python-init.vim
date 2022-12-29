" Python specific settings

" Functions
function! InsertPythonMain()
    let l:mainfunction = ["if __name__=='__main__':"]
    call add(l:mainfunction, "    main()")
    call append(line("."), l:mainfunction)
endfunction

function! RunAsScript()
    update
    let l:file = expand("%:p")
    let l:perm = getfperm(l:file)
    if l:perm[2] == "-"
        echo "Making the file executable..."
        call setfperm(l:file, l:perm[:1] . "x" . l:perm[3:])
    endif
    echo "Executing file..."
    execute "!" . shellescape(expand("%:p"), 1)
endfunction

function! InsertMITLicense()
    let l:license = [ "# MIT License",
                \"# ",
                \"# Copyright © " . strftime("%Y") . " Subhadip Ghosh",
                \"# ",
                \"# Permission is hereby granted, free of charge, to any person obtaining a copy",
                \"# of this software and associated documentation files (the “Software”), to deal",
                \"# in the Software without restriction, including without limitation the rights",
                \"# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell",
                \"# copies of the Software, and to permit persons to whom the Software is",
                \"# furnished to do so, subject to the following conditions:",
                \"# ",
                \"# The above copyright notice and this permission notice shall be included in",
                \"# all copies or substantial portions of the Software.",
                \"# ",
                \"# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR",
                \"# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,",
                \"# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE",
                \"# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER",
                \"# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,",
                \"# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE",
                \"# SOFTWARE."]

    call append(line(".") - 1, l:license)
endfunction

" Key bindings
nnoremap <F9> :call RunAsScript()<CR>
nnoremap <localleader>pm :call InsertPythonMain()<cr>
nnoremap <localleader>piml :call InsertMITLicense()<cr>
