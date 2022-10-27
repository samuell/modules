#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { KALLISTO_INDEX } from "$moduleDir/modules/nf-core/kallisto/index/main.nf"

workflow test_kallisto_index {

    def input = []
    input = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)

    KALLISTO_INDEX ( input )
}
