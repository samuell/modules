#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { GRIDSS_GRIDSSSOMATICFILTER } from '../../../../../modules/nf-core/gridss/gridsssomaticfilter/main.nf'

workflow test_gridss_gridsssomaticfilter {

    vcf = [
        [ id:'test' ], // meta map
        file(params.test_data['homo_sapiens']['illumina']['test_sv_vcf'], checkIfExists: true),
    ]

    GRIDSS_GRIDSSSOMATICFILTER ( vcf,[[],[]], [[],[]] )
}
