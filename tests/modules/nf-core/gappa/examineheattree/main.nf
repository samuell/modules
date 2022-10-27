#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { GAPPA_EXAMINEHEATTREE } from "$moduleDir/modules/nf-core/gappa/examineheattree/main.nf"

workflow test_gappa_examineheattree {

    input = [
        [ id:'test' ], // meta map
        file('https://github.com/nf-core/test-datasets/raw/modules/data/delete_me/gappa/epa_result.jplace.gz', checkIfExists: true)
    ]

    GAPPA_EXAMINEHEATTREE ( input )
}
