#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { HMMCOPY_MAPCOUNTER } from "$moduleDir/modules/nf-core/hmmcopy/mapcounter/main.nf"
include { HMMCOPY_GENERATEMAP } from "$moduleDir/modules/nf-core/hmmcopy/generatemap/main.nf"
workflow test_hmmcopy_mapcounter {

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)

    HMMCOPY_GENERATEMAP( fasta )

    HMMCOPY_MAPCOUNTER ( HMMCOPY_GENERATEMAP.out.bigwig )
}
