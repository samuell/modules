#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { HPSUISSERO } from "$moduleDir/modules/nf-core/hpsuissero/main.nf"

workflow test_hpsuissero {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['haemophilus_influenzae']['genome']['genome_fna_gz'], checkIfExists: true)
    ]

    HPSUISSERO ( input )
}
