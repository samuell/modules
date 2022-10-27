#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { RAVEN } from "$moduleDir/modules/nf-core/raven/main.nf"

workflow test_raven {

    input = [
              [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['bacteroides_fragilis']['nanopore']['test_fastq_gz'], checkIfExists: true) ]
            ]

    RAVEN ( input )
}
