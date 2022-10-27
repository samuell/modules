#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { MUMMER } from "$moduleDir/modules/nf-core/mummer/main.nf"

workflow test_mummer {

    input = [ [ id:'test', single_end:false ], // meta map
              file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true),
              file(params.test_data['sarscov2']['genome']['transcriptome_fasta'], checkIfExists: true) ]

    MUMMER ( input )
}
