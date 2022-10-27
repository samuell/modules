#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { CLONALFRAMEML } from "$moduleDir/modules/nf-core/clonalframeml/main.nf"

workflow test_clonalframeml {

    input = [
        [ id:'test' ], // meta map
        file(params.test_data['haemophilus_influenzae']['genome']['genome_aln_nwk'], checkIfExists: true),
        file(params.test_data['haemophilus_influenzae']['genome']['genome_aln_gz'], checkIfExists: true)
    ]

    CLONALFRAMEML ( input )
}
