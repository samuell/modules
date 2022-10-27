#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { ULTRA_INDEX } from "$moduleDir/modules/nf-core/ultra/index/main.nf"
include { GFFREAD     } from "$moduleDir/modules/nf-core/gffread/main.nf"

workflow test_ultra_index {

    genome = file(params.test_data['homo_sapiens']['genome']['genome_fasta'], checkIfExists: true)
    gtf    = file(params.test_data['homo_sapiens']['genome']['genome_gtf']  , checkIfExists: true)
    GFFREAD ( gtf )

    ULTRA_INDEX ( genome, GFFREAD.out.gtf )
}
