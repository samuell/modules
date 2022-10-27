#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { PLINK_VCF } from "$moduleDir/modules/nf-core/plink/vcf/main.nf"

workflow test_plink_vcf {

    input = [ [ id:'test', single_end:false ], // meta map
              file(params.test_data['sarscov2']['illumina']['test_vcf'], checkIfExists: true) ]

    PLINK_VCF ( input )
}
