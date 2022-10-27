#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { IMPUTEME_VCFTOPRS } from "$moduleDir/modules/nf-core/imputeme/vcftoprs/main.nf"

workflow test_imputeme_vcftoprs {

    input = [
        [ id:'test' ], // meta map
        file(params.test_data['homo_sapiens']['genome']['syntheticvcf_short_vcf_gz'], checkIfExists: true)
    ]

    IMPUTEME_VCFTOPRS ( input )
}
