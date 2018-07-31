#!/usr/bin/env nextflow

params.inputFile = 'md5sum.input'

inputFile = file(params.inputFile)

process md5sum {
    input:
    file inputFile 

    output:
    stdout outputChannel

    """
    /bin/my_md5sum ${inputFile}
    """
}