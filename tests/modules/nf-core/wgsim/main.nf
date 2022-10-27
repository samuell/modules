#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { WGSIM } from "$moduleDir/modules/nf-core/wgsim/main.nf"

workflow test_wgsim {

    input = [
        [ id:'test' ], // meta map
        file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    ]

    WGSIM ( input )
}
