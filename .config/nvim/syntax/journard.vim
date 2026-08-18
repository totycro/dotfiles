" Syntax highlighting for journard notes (sectioned TODOs / work journal)
" Schema: ==== banners, * items, [STATUS] tags, subsection:, -> notes

if exists('b:current_syntax')
  finish
endif

syntax case match

" Section banners: full ==== lines and "= title" middle line
syntax match journardBanner /^[=]\{3,}\s*$/
syntax match journardTitle  /^=\s.\+$/

" Status tags: [DONE], [WAIT], [WAITING for …], etc.
syntax match journardStatus /\[[^\]]\+\]/ contained

" Status-tagged item: de-emphasized (parked / not actionable now)
syntax match journardStatusLine /^\s*\[[^\]]\+\].*$/ contains=journardStatus,journardBullet

" Subsection headers: "meeting:" at line start (word chars / spaces / hyphens)
" syntax match journardSubsection #^\s*[A-Za-z][A-Za-z0-9 _/-]*:\s*$#

" Bullets and decision arrows
syntax match journardBullet /^\s*\zs\*\ze\s/
syntax match journardBullet  /^\s-\zs->\ze\s/
syntax match journardArrow  /^\s*\zs->\ze\s/

highlight default link journardBanner     Comment
highlight default link journardTitle      Title
highlight default link journardStatus     DiagnosticOk
highlight default link journardStatusLine DiagnosticHint
" highlight default link journardSubsection Statement
highlight default link journardBullet     Operator
" Bullet used to be Special
highlight default link journardArrow      Operator

let b:current_syntax = 'journard'
