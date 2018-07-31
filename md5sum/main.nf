#!/usr/bin/env nextflow

params.inputFile = 'md5sum.input'

inputFile = file(params.inputFile)
md5sumScript = file('bin/my_md5sum')

process md5sum {
    container 'quay.io/agduncan94/my-m5dsum'

    input:
    file inputFile 
    file md5sumScript

    output:
    file 'md5sum.txt' into outputChannel

    """
    bash ${md5sumScript} ${inputFile}
    """
}

outputChannel.subscribe { print it.text }