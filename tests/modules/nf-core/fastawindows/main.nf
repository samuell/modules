#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { FASTAWINDOWS } from "$moduleDir/modules/nf-core/fastawindows/main.nf"

workflow test_fastawindows {

    input = [
        [ id:'test' ], // meta map
        file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    ]

    FASTAWINDOWS ( input )
}
