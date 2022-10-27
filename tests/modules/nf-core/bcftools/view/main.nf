#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { BCFTOOLS_VIEW } from "$moduleDir/modules/nf-core/bcftools/view/main.nf"

workflow test_bcftools_view {

    regions = []
    targets = []
    samples = []

    input = [[ id:'out', single_end:false ], // meta map
             file(params.test_data['sarscov2']['illumina']['test_vcf_gz'], checkIfExists: true),
             file(params.test_data['sarscov2']['illumina']['test_vcf_gz_tbi'], checkIfExists: true)]

    BCFTOOLS_VIEW ( input, regions, targets, samples )
}

workflow test_bcftools_view_with_optional_files {

    regions = file(params.test_data['sarscov2']['illumina']['test3_vcf_gz'], checkIfExists: true)
    targets = file(params.test_data['sarscov2']['illumina']['test2_vcf_targets_tsv_gz'], checkIfExists: true)
    samples = []

    input = [[ id:'out', single_end:false ], // meta map
             file(params.test_data['sarscov2']['illumina']['test2_vcf_gz'], checkIfExists: true),
             file(params.test_data['sarscov2']['illumina']['test2_vcf_gz_tbi'], checkIfExists: true)]

    BCFTOOLS_VIEW ( input, regions, targets, samples )
}
