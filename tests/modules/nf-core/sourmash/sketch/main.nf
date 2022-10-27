#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { SOURMASH_SKETCH } from "$moduleDir/modules/nf-core/sourmash/sketch/main.nf"

workflow test_sourmash_sketch {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    ]

    SOURMASH_SKETCH ( input )
}
