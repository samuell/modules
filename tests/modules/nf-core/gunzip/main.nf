#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { GUNZIP } from "$moduleDir/modules/nf-core/gunzip/main.nf"

workflow test_gunzip {
    input = [ [],
              file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true)
            ]

    GUNZIP ( input )
}
