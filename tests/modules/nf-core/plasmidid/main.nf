#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { PLASMIDID } from "$moduleDir/modules/nf-core/plasmidid/main.nf"

workflow test_plasmidid {

    contigs = [ [ id:'test' ], // meta map
                file(params.test_data['sarscov2']['illumina']['contigs_fasta'], checkIfExists: true)
              ]

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)

    PLASMIDID ( contigs, fasta )
}
