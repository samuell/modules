#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { GFFREAD } from "$moduleDir/modules/nf-core/gffread/main.nf"

workflow test_gffread {
    input = file(params.test_data['sarscov2']['genome']['genome_gff3'], checkIfExists: true)

    GFFREAD ( input )
}
