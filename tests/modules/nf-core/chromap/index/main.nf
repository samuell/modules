#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { CHROMAP_INDEX } from "$moduleDir/modules/nf-core/chromap/index/main.nf"

workflow test_chromap_index {

    input = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)

    CHROMAP_INDEX ( input )
}
