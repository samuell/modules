#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { HMMCOPY_GCCOUNTER } from "$moduleDir/modules/nf-core/hmmcopy/gccounter/main.nf"

workflow test_hmmcopy_gccounter {
    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)

    HMMCOPY_GCCOUNTER (fasta)
}
