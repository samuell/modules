#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { SSUISSERO } from "$moduleDir/modules/nf-core/ssuissero/main.nf"

workflow test_ssuissero {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['haemophilus_influenzae']['genome']['genome_fna_gz'], checkIfExists: true)
    ]

    SSUISSERO ( input )
}
