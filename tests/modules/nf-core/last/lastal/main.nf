#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { UNTAR       } from "$moduleDir/modules/nf-core/untar/main.nf"
include { LAST_LASTAL } from "$moduleDir/modules/nf-core/last/lastal/main.nf"

workflow test_last_lastal_with_dummy_param_file {

    input = [ [ id:'contigs', single_end:false ], // meta map
              file(params.test_data['sarscov2']['illumina']['contigs_fasta'], checkIfExists: true),
              [] ]
    db    = [ [], file(params.test_data['sarscov2']['genome']['lastdb_tar_gz'], checkIfExists: true) ]

    UNTAR ( db )
    LAST_LASTAL ( input, UNTAR.out.untar.map{ it[1] })
}

workflow test_last_lastal_with_real_param_file {

    input      = [ [ id:'contigs', single_end:false ], // meta map
                   file(params.test_data['sarscov2']['illumina']['contigs_fasta'], checkIfExists: true),
                   file(params.test_data['sarscov2']['genome']['contigs_genome_par'], checkIfExists: true) ]
    db         = [ [], file(params.test_data['sarscov2']['genome']['lastdb_tar_gz'], checkIfExists: true) ]

    UNTAR ( db )
    LAST_LASTAL ( input, UNTAR.out.untar.map{ it[1] })
}
