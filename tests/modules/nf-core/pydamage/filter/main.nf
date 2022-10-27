#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { PYDAMAGE_ANALYZE } from "$moduleDir/modules/nf-core/pydamage/analyze/main.nf"
include { PYDAMAGE_FILTER } from "$moduleDir/modules/nf-core/pydamage/filter/main.nf"

workflow test_pydamage {

    input = [ [ id:'test', single_end:false ], // meta map
              file(params.test_data['homo_sapiens']['illumina']['test_paired_end_sorted_bam'], checkIfExists: true),
              file(params.test_data['homo_sapiens']['illumina']['test_paired_end_sorted_bam_bai'], checkIfExists: true) ]

    PYDAMAGE_ANALYZE ( input )
    PYDAMAGE_FILTER (PYDAMAGE_ANALYZE.out.csv)
}
