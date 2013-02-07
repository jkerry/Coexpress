<g:set var="nRows" value="${[15,(int)(sequence.size()/40)+3].min()}" />
<g:textArea name="fastaSequence" class="span5 seqText" rows="${nRows}" >>${name}
<g:each var="subseq" in="${sequence.split('(?<=\\G.{40})')}">${subseq}
</g:each></g:textArea>