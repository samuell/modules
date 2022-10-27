#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { BANDAGE_IMAGE } from "$moduleDir/modules/nf-core/bandage/image/main.nf"

workflow test_bandage_image {
    input = [
        [ id:'B-3106' ], // meta map
        file( params.test_data['sarscov2']['illumina']['assembly_gfa'], checkIfExists: true)
    ]

    BANDAGE_IMAGE ( input )
}
