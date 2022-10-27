#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { GSTAMA_COLLAPSE } from "$moduleDir/modules/nf-core/gstama/collapse/main.nf"

workflow test_gstama_collapse {

    input = [
        [ id:'test' ], // meta map
        file(params.test_data['homo_sapiens']['pacbio']['aligned'], checkIfExists: true)
    ]
    genome = file(params.test_data['homo_sapiens']['genome']['genome2_fasta'], checkIfExists: true)

    GSTAMA_COLLAPSE ( input, genome )
}
